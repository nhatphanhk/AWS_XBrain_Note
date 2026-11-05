[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$csv = Import-Csv -Path 'n:\AWS_XBrain_Note\scratch\all_questions.csv'

function Find-Questions($name, $terms) {
    Write-Host "`n=== MATCHES FOR $name ==="
    $matches = $csv | Where-Object {
        $text = ($_.Question + ' ' + $_.Explanation).ToLower()
        foreach ($t in $terms) {
            if ($text.Contains($t.ToLower())) { return $true }
        }
        return $false
    }
    Write-Host "Count: $($matches.Count)"
    $matches | ForEach-Object {
        $qShort = if ($_.Question.Length -gt 70) { $_.Question.Substring(0, 70) + "..." } else { $_.Question }
        Write-Host "$($_.PT) Q$($_.QuestionNumber) | $qShort"
    }
}

Find-Questions "API Gateway / Cognito / Step Functions" @('api gateway', 'cognito', 'step function', 'appsync')
Find-Questions "AI / ML Services" @('sagemaker', 'rekognition', 'transcribe', 'polly', 'comprehend', 'textract', 'translate', 'lex')
Find-Questions "CloudFormation / Systems Manager" @('cloudformation', 'systems manager', 'session manager', 'parameter store', 'patch manager', 'cfn-')

