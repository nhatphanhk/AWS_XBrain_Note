[CmdletBinding()]
param(
    [int]$ExamNumber
)

$ErrorActionPreference = "Stop"

$cloudMentorDir = "n:\AWS_XBrain_Note\Practices_Test\Cloud_Mentor"
$toolsDir = "n:\AWS_XBrain_Note\Practices_Test\tools"
$formatterScript = Join-Path $toolsDir "format_practice_test.ps1"
$baseMetaPath = Join-Path $toolsDir "pt_1_metadata.json"

if (-not (Test-Path $baseMetaPath)) {
    Write-Error "Base metadata template not found: $baseMetaPath"
    exit 1
}

$examsToProcess = if ($PSBoundParameters.ContainsKey('ExamNumber')) { @($ExamNumber) } else { @(2, 3, 4, 5, 6) }

foreach ($exNum in $examsToProcess) {
    Write-Host "==========================================================="
    Write-Host "Processing Cloud Mentor Practice Test $exNum"
    Write-Host "==========================================================="

    $inputPath = Join-Path $cloudMentorDir "pt_$exNum.md"
    $metaPath = Join-Path $toolsDir "pt_${exNum}_metadata.json"

    $backupPath = $inputPath + ".bak"
    $sourcePath = if (Test-Path $backupPath) { $backupPath } else { $inputPath }
    if (-not (Test-Path $sourcePath)) {
        Write-Warning "File not found: $sourcePath. Skipping..."
        continue
    }

    $raw = [System.IO.File]::ReadAllText($sourcePath, [System.Text.Encoding]::UTF8)
    $qMatches = [regex]::Matches($raw, "(?m)^Question (\d+):?\r?$")

    if ($qMatches.Count -ne 65) {
        Write-Warning "Expected 65 questions, found $($qMatches.Count)"
    }

    # Load template from pt_1_metadata.json
    $baseMeta = Get-Content -Path $baseMetaPath -Raw -Encoding UTF8 | ConvertFrom-Json

    $questionDomains = [ordered]@{}
    $topicTitles = [ordered]@{}
    $incorrectReviewNotes = [ordered]@{}
    $correctAnswers = [ordered]@{}

    $incorrectCount = 0

    for ($i = 0; $i -lt $qMatches.Count; $i++) {
        $qNum = $i + 1
        $start = $qMatches[$i].Index
        $end = if ($i + 1 -lt $qMatches.Count) { $qMatches[$i+1].Index } else { $raw.Length }
        $chunk = $raw.Substring($start, $end - $start)

        $statusMatch = [regex]::Match($chunk, "(?m)^Question \d+:\r?\n([^\r\n]+)")
        $status = if ($statusMatch.Success) { $statusMatch.Groups[1].Value.Trim() } else { "Unknown" }
        $isCorrect = ($status -eq "Correct")
        if (-not $isCorrect) { $incorrectCount++ }

        $promptMatch = [regex]::Match($chunk, "(?ms)^Question \d+:\r?\n(?:Correct|Incorrect|Skipped)\r?\n(.*?)(?=\r?\n[A-H]\.\r?\n)")
        $promptText = if ($promptMatch.Success) { $promptMatch.Groups[1].Value.Trim() } else { "" }
        
        $expectedCount = 1
        if ($promptText -match "(?i)\(choose two|\(select two") { $expectedCount = 2 }
        elseif ($promptText -match "(?i)\(choose three|\(select three") { $expectedCount = 3 }

        $optMatches = [regex]::Matches($chunk, "(?ms)^([A-H])\.\r?\n(.*?)(?=\r?\n[A-H]\.\r?\n|\r?\nExplanation\r?\n)")
        
        $corrExpMatch = [regex]::Match($chunk, "(?ms)(?:\u2705)?\s*Đáp án đúng:\s*\r?\n(.*?)(?=\r?\n(?:Các đáp án sai:|\u274C|\uD83D\uDD11|Tips and tricks:|\uD83D\uDCD6|Reference:|$))")
        $corrText = if ($corrExpMatch.Success) { $corrExpMatch.Groups[1].Value.Trim() } else { "" }
        $corrTextNorm = ($corrText -replace "\s+", " ").Trim()

        $wrongMatches = [regex]::Matches($chunk, "(?m)^\u274C\s*(.+)")
        $wrongTexts = @()
        foreach ($wm in $wrongMatches) { 
            $w = ($wm.Groups[1].Value.Trim() -replace "\s+", " ")
            $w = ($w -replace "^(?:Đáp án \d+:|Option [A-H]:|[A-H]\.?\s*)", "").Trim()
            $wrongTexts += $w 
        }

        # Candidate scoring
        $scoredOpts = @()
        for ($o = 0; $o -lt $optMatches.Count; $o++) {
            $letter = $optMatches[$o].Groups[1].Value
            $bText = $optMatches[$o].Groups[2].Value.Trim()
            $optNorm = ($bText -replace "\s+", " ").Trim()

            $isExplicitlyWrong = $false
            foreach ($wt in $wrongTexts) {
                if ($wt.StartsWith($optNorm) -or $optNorm.StartsWith($wt) -or $wt -eq $optNorm) {
                    $isExplicitlyWrong = $true
                    break
                }
                $optAlnum = ($optNorm -replace "[^a-zA-Z0-9]", "").ToLower()
                $wtAlnum = ($wt -replace "[^a-zA-Z0-9]", "").ToLower()
                if ($optAlnum.Length -ge 20 -and $wtAlnum.Length -ge 20) {
                    $cmpLen = [math]::Min(35, [math]::Min($optAlnum.Length, $wtAlnum.Length))
                    if ($optAlnum.Substring(0, $cmpLen) -eq $wtAlnum.Substring(0, $cmpLen)) {
                        $isExplicitlyWrong = $true
                        break
                    }
                }
            }

            $corrScore = 0
            if (-not $isExplicitlyWrong) { $corrScore += 100 }
            $optSub = $optNorm.Substring(0, [math]::Min(30, $optNorm.Length))
            if ($corrTextNorm.Contains($optSub)) { $corrScore += 50 }
            $optSubLong = $optNorm.Substring(0, [math]::Min(60, $optNorm.Length))
            if ($corrTextNorm.Contains($optSubLong)) { $corrScore += 50 }

            $scoredOpts += [PSCustomObject]@{
                Letter = $letter
                Text = $bText
                Score = $corrScore
                IsWrong = $isExplicitlyWrong
            }
        }

        $topOpts = $scoredOpts | Sort-Object Score -Descending | Select-Object -First $expectedCount
        $topLetters = ($topOpts | ForEach-Object { $_.Letter }) | Sort-Object
        $correctAnswers["$qNum"] = @($topLetters)

        # Explanation components
        $tipsMatch = [regex]::Match($chunk, "(?ms)(?:\uD83D\uDD11)\s*Tips and tricks:\s*\r?\n(.*?)(?=\r?\n(?:\uD83D\uDCD6|Reference:|$))")
        $tipsText = if ($tipsMatch.Success) { $tipsMatch.Groups[1].Value.Trim() } else { "" }
        $tipsLines = @($tipsText -split "\r?\n" | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 })

        $tomTatMatch = [regex]::Match($chunk, "(?ms)(?:\uD83D\uDCDD)\s*Tóm tắt đề:\s*\r?\n(.*?)(?=\r?\n(?:\u2705|Đáp án đúng:))")
        $tomTatText = if ($tomTatMatch.Success) { $tomTatMatch.Groups[1].Value.Trim() } else { "" }
        $tomTatLines = @($tomTatText -split "\r?\n" | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 })

        # Domain classification
        $allText = ($promptText + " " + $corrText + " " + $tipsText).ToLower()

        $d1 = 0; $d2 = 0; $d3 = 0; $d4 = 0

        # Cost Optimization (Domain 4)
        if ($promptText -match "(?i)(cost-effectiv|least cost|lowest cost|minimize cost|reduce cost|expense|pricing|budget)") { $d4 += 6 }
        if ($allText -match "\b(spot|savings plans|reserved instances|glacier|intelligent-tiering|aurora serverless|transfer cost|data transfer|standard-ia|cheapest)\b") { $d4 += 4 }

        # Security (Domain 1)
        if ($promptText -match "(?i)(secure|security|encrypt|private|compliance|credentials|unauthorized|protect|permission|restrict|audit|prevent)") { $d1 += 6 }
        if ($allText -match "\b(iam|kms|secrets manager|privatelink|vpc endpoint|security group|nacl|waf|shield|macie|guardduty|identity center|scp|organizations|cloudtrail|lake formation)\b") { $d1 += 4 }

        # High Performance (Domain 3)
        if ($promptText -match "(?i)(performance|latency|throughput|sub-second|fastest|speed|accelerat|real-time|streaming)") { $d3 += 6 }
        if ($allText -match "\b(elasticache|redis|memcached|dax|cloudfront|global accelerator|kinesis|fsx for lustre|placement group|st1|io2)\b") { $d3 += 4 }

        # Resilient (Domain 2)
        if ($promptText -match "(?i)(highly available|availability|resilient|disaster recovery|rpo|rto|fault-tolerant|failover|uninterrupted|durability)") { $d2 += 6 }
        if ($allText -match "\b(multi-az|auto scaling|sqs|eventbridge|backup|restore|read replica|target tracking)\b") { $d2 += 4 }

        $chosen = "Design Resilient Architectures"
        $max = [math]::Max([math]::Max($d1, $d2), [math]::Max($d3, $d4))
        if ($max -eq $d1 -and $d1 -gt 0) { $chosen = "Design Secure Architectures" }
        elseif ($max -eq $d4 -and $d4 -gt 0) { $chosen = "Design Cost-Optimized Architectures" }
        elseif ($max -eq $d3 -and $d3 -gt 0) { $chosen = "Design High-Performing Architectures" }
        elseif ($max -eq $d2 -and $d2 -gt 0) { $chosen = "Design Resilient Architectures" }

        $questionDomains["$qNum"] = $chosen

        # Topic Title
        $cleanOpts = @()
        foreach ($to in $topOpts) {
            $t = $to.Text -replace "(?i)^(?:use|create|deploy|configure|set up|host|migrate|purchase|enable|associate|store|ingest|forward|change|move|add|replace)\s+", ""
            $firstP = ($t -split "\.")[0].Trim()
            $cleanOpts += $firstP
        }
        $rawTopic = ($cleanOpts -join " and ")
        if ($rawTopic.Length -gt 85) { $rawTopic = $rawTopic.Substring(0, 82) + "..." }
        if ($rawTopic.Length -gt 0) {
            $rawTopic = $rawTopic.Substring(0, 1).ToUpper() + $rawTopic.Substring(1)
        }
        $topicTitles["$qNum"] = $rawTopic

        # Incorrect Review Notes
        if (-not $isCorrect) {
            $noteParts = @()
            if ($tomTatLines.Count -gt 0) {
                $mainPrompt = ($tomTatLines | Where-Object { $_ -match "Yêu cầu" -or $_ -match "\u2192" } | Select-Object -First 1)
                if (-not $mainPrompt) { $mainPrompt = $tomTatLines[0] }
                $mainPrompt = $mainPrompt -replace "^[\s\*\-\u2192]+", "" -replace "^Yêu cầu:\s*", ""
                $mainPrompt = $mainPrompt -replace "\|", "-"
                $noteParts += $mainPrompt
            }
            if ($tipsLines.Count -gt 0) {
                $mainTip = $tipsLines[0] -replace "^[\s\*\-\u2192]+", ""
                $mainTip = $mainTip -replace "\|", "-"
                $noteParts += $mainTip
            } else {
                $corrLines = @($corrText -split "\r?\n" | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 })
                if ($corrLines.Count -gt 1) {
                    $cLine = $corrLines[1] -replace "\|", "-"
                    $noteParts += $cLine
                }
            }
            $incorrectReviewNotes["$qNum"] = ($noteParts -join "<br>")
        }
    }

    $numPadded = "{0:D2}" -f $exNum

    # Clone base template and override specific fields
    $baseMeta.examTitle = "# Bộ Đề Thi Thử AWS Certified Solutions Architect - Associate (SAA-C03) - Cloud Mentor Practice Test $exNum"
    $baseMeta.metaSet = "> **Bộ đề**: Practice Test $numPadded - Results & In-Depth Architecture Review (65 Questions)  "
    $baseMeta.h2 = "## 🎯 2. Danh Sách $incorrectCount Câu Cần Tập Trung Ôn Tập (Focused Revision for Incorrect Answers)"
    $baseMeta.h2Intro = "Dưới đây là tổng hợp $incorrectCount câu trả lời chưa chính xác và bỏ qua trong bài thi thử này. Hãy rà soát kỹ các bẫy đề bài, nguyên lý kiến trúc cốt lõi và bài học thực tế trước khi bước vào kỳ thi thật:"
    $baseMeta.questionDomains = $questionDomains
    $baseMeta.topicTitles = $topicTitles
    $baseMeta.incorrectReviewNotes = $incorrectReviewNotes

    if (-not ($baseMeta | Get-Member -Name "correctAnswers")) {
        $baseMeta | Add-Member -MemberType NoteProperty -Name "correctAnswers" -Value $correctAnswers
    } else {
        $baseMeta.correctAnswers = $correctAnswers
    }

    $jsonText = $baseMeta | ConvertTo-Json -Depth 10
    [System.IO.File]::WriteAllText($metaPath, $jsonText, [System.Text.UTF8Encoding]::new($true))
    Write-Host "Generated metadata: $metaPath ($([math]::Round($jsonText.Length / 1024, 1)) KB, Incorrect: $incorrectCount)"

    # Restore raw backup before formatting so format_practice_test runs against original raw input
    if (Test-Path $backupPath) {
        [System.IO.File]::Copy($backupPath, $inputPath, $true)
    }

    # Now execute format_practice_test.ps1
    Write-Host "Formatting $inputPath ..."
    & powershell -ExecutionPolicy Bypass -File $formatterScript -InputFile $inputPath -MetaFile $metaPath
    Write-Host "Successfully formatted Practice Test $exNum!`n"
}
