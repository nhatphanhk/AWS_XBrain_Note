# Hướng dẫn triển khai MH-COST-A — Automated Cost Guard

Tôi sẽ hướng dẫn **chi tiết tuần tự** để xây dựng 4 component bắt buộc. Đây là hệ thống **tự động stop resource** chứ không chỉ notification.

---

## **Bước 1: Tạo IAM Role (Least-Privilege) cho Lambda**

IAM → Roles → Create role

- **Trusted entity**: AWS service → Lambda
- **Role name**: `LambdaCostGuardRole-minie-prod`

**Inline policy** (least-privilege):

[LambdaCostGuardRole](code/LambdaCostGuardRole.json)

**Tags** (Required): Owner, Environment, CostCenter, Application

![IAM Role](Screenshot/image.png)

---

## **Bước 2: Deploy Lambda Function (Component a)**

### 2.1 Tạo Lambda function

Lambda → Functions → Create function

- **Function name**: `CostGuard-Stop-Untagged-Resources`
- **Runtime**: Python 3.11 (hoặc 3.12)
- **Role**: `LambdaCostGuardRole-minie-prod` (từ bước 1)
- **Timeout**: 60 seconds

### 2.2 Mã Lambda

Dán mã dưới đây vào editor:

[CostGuard](code/Lambda.py)

### 2.3 Deploy

- Click **Deploy**
- Verify: Status = green ✓

**Tags** cho Lambda function: Owner, Environment, CostCenter, Application
![Lambda Function](Screenshot/Screenshot%202026-05-21%20143801.png)

---

## **Bước 3: Tạo EventBridge Scheduler (Component b — Daily Trigger)**

EventBridge → Schedules → Create schedule

- **Schedule name**: `CostGuard-Daily-Trigger`
- **Schedule pattern**: Recurring schedule
  - **Frequency**: Daily
  - **Time**: 13:00 (UTC) — chọn giờ phù hợp, tránh peak time
  - **Timezone**: UTC

- **Flexible time window**: Off

- **Target**:
  - **Target service**: AWS Lambda
  - **Function**: `CostGuard-Stop-Untagged-Resources`
  - **Role**: Tạo role mới hoặc dùng role có permission `lambda:InvokeFunction`

**Tags** (Required)

Click **Create schedule**

**Verify**: Schedule status = **Enabled**
![EventBridge Schedules](Screenshot/Screenshot%202026-05-21%20144020.png)

---

## **Bước 4: Demo Component (c) — Demonstrated Stop Action**

Để chứng minh Lambda **thực sự** stop resource, sử dụng **ECS service** hiện có để scale down to 0 tasks:

### 4.1 Chuẩn bị ECS Service

ECS → Clusters → `cluster-minie-prod` → Services → `svc-minie-backend-prod`

**Điều kiện bắt buộc**:

- ECS service hiện có **KHÔNG** có tag `keep=true`
- Service đang có **2 running tasks** (hoặc tùy minDesiredCount)

Nếu cần, gán tag cho service (ECS service tags):

- Key: `Owner`, Value: `prod`
- Key: `Environment`, Value: `prod`
- Key: `CostCenter`, Value: `backend`
- Key: `Application`, Value: `minie`
- **LỌC**: KHÔNG thêm tag `keep=true`

### 4.2 Screenshot Before

- Console → ECS → Clusters → `cluster-minie-prod` → Services → `svc-minie-backend-prod`
- **Screenshot 1**: Tình trạng service = **Desired count: 2, Running count: 2** (hoặc số lượng ban đầu)
  ![ECS service running](Screenshot/Screenshot%202026-05-21%20154237.png)

- Note service name: `svc-minie-backend-prod`

### 4.3 Trigger Lambda thủ công

Lambda → Functions → `CostGuard-Stop-Untagged-Resources` → Test

- **Test event**: Tạo event mới (payload có thể trống `{}`)
- Click **Test**
- **Check output**: Nó sẽ log "[SCALE-DOWN] ECS service svc-minie-backend-prod scaled to 0 tasks"
  ![Lambda log](Screenshot/Screenshot%202026-05-21%20155721.png)

### 4.4 Screenshot After

- Đợi 5–10 giây
- Console → ECS → Clusters → `cluster-minie-prod` → Services → `svc-minie-backend-prod`
- **Screenshot 2**: Service = **Desired count: 0, Running count: 0** (tasks đang scale down)
- Note thời gian scale action
  ![ECS scaled to 0](Screenshot/Screenshot%202026-05-21%20160441.png)

### 4.5 CloudTrail Evidence

CloudTrail → Event history

- **Search filter**:
  - Event name: `UpdateService`
    ![Event name UpdateService](Screenshot/Screenshot%202026-05-21%20144829.png)

  - Resource name: `svc-minie-backend-prod` (hoặc service ARN)
    ![Resource name service](Screenshot/Screenshot%202026-05-21%20145233.png)

  - Event source: `ecs.amazonaws.com`
    ![Event source ECS](Screenshot/Screenshot%202026-05-21%20145024.png)

- **Detail tab** sẽ hiện: `desiredCount: 0` được set bởi Lambda

---

## **Bước 5: AWS Budgets + SNS + Lambda Chain (Component d)**

### 5.1 Tạo SNS Topic

SNS → Topics → Create topic

- **Topic name**: `CostGuard-Budget-Alert`
- **Display name**: CostGuard Budget Alert

**Tags** (Required)

![SNS](Screenshot/Screenshot%202026-05-21%20145328.png)

Copy **Topic ARN** (sẽ dùng ở bước 5.3)

### 5.2 Tạo SNS Subscription tới Lambda

SNS → Topics → `CostGuard-Budget-Alert` → Create subscription

- **Protocol**: AWS Lambda
- **Endpoint**: `CostGuard-Stop-Untagged-Resources` (Lambda function)

Click **Create subscription**

![Subscription](Screenshot/Screenshot%202026-05-21%20145736.png)

**Important**: Bạn cần cập nhật Lambda **Resource-based policy** để cho phép SNS invoke. AWS sẽ tự động thêm khi subscription tạo.

### 5.3 Tạo AWS Budget (Daily, $150)

AWS Budgets → Budgets → Create budget

- **Budget type**: Cost
- **Name**: `Daily-Cost-Guard-150`
- **Period**: Daily
- **Budgeted amount**: $150 USD

**Alert threshold**:

- Alert when **100%** of budget is forecasted to be exceeded
- Notification preferences: **Alert me by**: chọn SNS
  - Topic: `CostGuard-Budget-Alert`

Click **Create**

![budgets](Screenshot/Screenshot%202026-05-21%20145943.png)

**Note**: Cost data latency ~8–24h → trong 48h demo, Budgets action có thể **KHÔNG fire**. Đó là điều dự kiến.

### 5.4 Demo SNS → Lambda Chain (thủ công, không chờ Budgets fire)

SNS → Topics → `CostGuard-Budget-Alert` → Publish message

- **Subject**: `Budget Alert - Cost Threshold Exceeded`
- **Message**:

```json
{
  "detail-type": "Budget Notification",
  "detail": {
    "eventName": "BudgetThreshold",
    "budgetName": "Daily-Cost-Guard-150"
  }
}
```

Click **Publish message**

**Verify**:

- Lambda Logs (CloudWatch) → `/aws/lambda/CostGuard-Stop-Untagged-Resources`
  - Xem log entry cho SNS trigger (timestamp gần đó)
  - Log sẽ ghi: `[STOP] EC2 instance i-... stopped` hoặc `[SKIP]` nếu resource đã có tag

  ![Demo SNS](Screenshot/Screenshot%202026-05-21%20161733.png)

### 5.5. Latency ADR (Architectural Decision Record)

|                  |                                                                                                                                                                                                                                                                |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Context**      | AWS cost data có độ trễ ~8-24 giờ. Trong account workshop 48h, cost-driven trigger từ Budgets gần như chắc chắn sẽ KHÔNG fire vì cost data chưa kịp cập nhật.                                                                                                  |
| **Decision**     | Triển khai **CẢ HAI** mechanism song song:                                                                                                                                                                                                                     |
|                  | 1. **Scheduled (primary)**: EventBridge daily cron → Lambda tắt ECS Fargate tasks không tag `keep=true`                                                                                                                                                        |
|                  | 2. **Cost-driven (secondary)**: Budgets $150 → SNS → cùng Lambda. Đã wire và test bằng manual SNS publish                                                                                                                                                      |
| **Consequences** | Scheduled mechanism hoạt động và demonstrated trong 48h. Cost-driven trigger không fire — **dự kiến, không phải lỗi**. Trong production, cả hai chạy song song: scheduled tắt dev resources mỗi tối, cost-driven làm **emergency brake** khi chi phí đột biến. |
