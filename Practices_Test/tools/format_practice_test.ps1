<#
.SYNOPSIS
    Automated Formatter for AWS Solutions Architect Practice Tests (Udemy SAA-C03).

.DESCRIPTION
    Takes raw copied questions from Udemy Practice Exam Review mode and formats them
    into a structured, professional study guide with:
    - Exam Performance Summary table
    - 4 Domains Breakdown performance matrix
    - Focused Revision table for incorrect answers
    - Interactive Quick Index (table of contents)
    - Standardized Question blocks with interactive <details><summary> explanations
    - Cleaned-up visual diagrams and official AWS documentation references

.PARAMETER InputFile
    Path to the raw markdown file (e.g., udemy_pt1.md or n:\AWS_XBrain_Note\Practices_Test\udemy_pt1.md).

.PARAMETER OutputFile
    Optional output file path. If omitted, the InputFile will be overwritten (with a .bak backup created).

.PARAMETER MetaFile
    Optional custom metadata JSON file containing custom topic titles, review notes, or exam title.
    If not specified, checks if '<FileName>_metadata.json' exists in tools/ directory, otherwise
    falls back to config_template.json with intelligent automatic topic generation.

.PARAMETER ExamTitle
    Optional custom exam title override.

.PARAMETER NoBackup
    Switch parameter. If set, skips creating a .bak backup file before overwriting.

.EXAMPLE
    .\format_practice_test.ps1 -InputFile "..\udemy_pt1.md"
    .\format_practice_test.ps1 -InputFile "..\udemy_pt6.md" -MetaFile ".\pt6_metadata.json"
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$InputFile,

    [Parameter(Position = 1)]
    [string]$OutputFile,

    [Parameter()]
    [string]$MetaFile,

    [Parameter()]
    [string]$ExamTitle,

    [switch]$NoBackup
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# 1. Resolve Input File
if (-not [System.IO.Path]::IsPathRooted($InputFile)) {
    $resolvedInput = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine((Get-Location).Path, $InputFile))
} else {
    $resolvedInput = $InputFile
}

if (-not (Test-Path $resolvedInput)) {
    Write-Error "Input file not found: $resolvedInput"
    exit 1
}

$inputFileName = [System.IO.Path]::GetFileNameWithoutExtension($resolvedInput)
$inputFileDir = [System.IO.Path]::GetDirectoryName($resolvedInput)

# 2. Resolve Output File
if ([string]::IsNullOrWhiteSpace($OutputFile)) {
    $resolvedOutput = $resolvedInput
} else {
    if (-not [System.IO.Path]::IsPathRooted($OutputFile)) {
        $resolvedOutput = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine((Get-Location).Path, $OutputFile))
    } else {
        $resolvedOutput = $OutputFile
    }
}

# 3. Resolve Metadata File
$resolvedMeta = $null
if (-not [string]::IsNullOrWhiteSpace($MetaFile)) {
    if (-not [System.IO.Path]::IsPathRooted($MetaFile)) {
        $candidate = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine((Get-Location).Path, $MetaFile))
    } else {
        $candidate = $MetaFile
    }
    if (Test-Path $candidate) {
        $resolvedMeta = $candidate
    }
}

if ($null -eq $resolvedMeta) {
    # Check for specific metadata e.g. pt6_metadata.json or udemy_pt6_metadata.json in scriptDir
    $autoName1 = Join-Path $scriptDir ($inputFileName + "_metadata.json")
    $autoName2 = Join-Path $scriptDir (($inputFileName -replace "udemy_", "") + "_metadata.json")
    if (Test-Path $autoName1) {
        $resolvedMeta = $autoName1
    } elseif (Test-Path $autoName2) {
        $resolvedMeta = $autoName2
    } else {
        $resolvedMeta = Join-Path $scriptDir "config_template.json"
    }
}

Write-Host "==========================================================="
Write-Host "AWS Practice Test Formatter"
Write-Host "Input File  : $resolvedInput"
Write-Host "Output File : $resolvedOutput"
Write-Host "Config/Meta : $resolvedMeta"
Write-Host "==========================================================="

# Load Metadata
$metaJson = Get-Content -Path $resolvedMeta -Raw -Encoding UTF8 | ConvertFrom-Json

# If user passed custom ExamTitle parameter
if (-not [string]::IsNullOrWhiteSpace($ExamTitle)) {
    $metaJson.examTitle = "# " + $ExamTitle
} elseif ($resolvedMeta -like "*config_template.json") {
    # Auto-adjust exam title based on file name
    $prettyName = $inputFileName -replace "_", " " -replace "udemy", "Udemy" -replace "pt", "Practice Exam "
    $metaJson.examTitle = "# Bo De Thi Thu AWS Certified Solutions Architect - Associate (SAA-C03) - " + $prettyName.ToUpper()
}

# Read Input File
$raw = [System.IO.File]::ReadAllText($resolvedInput, [System.Text.Encoding]::UTF8)

# Parse questions
$qMatches = [regex]::Matches($raw, "(?m)^Question (\d+)\r?$")
if ($qMatches.Count -eq 0) {
    Write-Error "No 'Question X' patterns found in $resolvedInput. Ensure the file contains Udemy test review text."
    exit 1
}

Write-Host "Found $($qMatches.Count) questions. Processing..."

$domainOrder = @(
    "Design Secure Architectures",
    "Design Resilient Architectures",
    "Design High-Performing Architectures",
    "Design Cost-Optimized Architectures"
)

$domainStats = @{
    "Design Secure Architectures" = @{ Total = 0; Correct = 0; Incorrect = 0 }
    "Design Resilient Architectures" = @{ Total = 0; Correct = 0; Incorrect = 0 }
    "Design High-Performing Architectures" = @{ Total = 0; Correct = 0; Incorrect = 0 }
    "Design Cost-Optimized Architectures" = @{ Total = 0; Correct = 0; Incorrect = 0 }
}

$questionsData = @()
$incorrectList = @()

for ($idx = 0; $idx -lt $qMatches.Count; $idx++) {
    $qNum = $idx + 1
    $start = $qMatches[$idx].Index
    $end = if ($idx + 1 -lt $qMatches.Count) { $qMatches[$idx+1].Index } else { $raw.Length }
    $chunk = $raw.Substring($start, $end - $start)

    # Status
    $statusMatch = [regex]::Match($chunk, "(?m)^Question \d+\r?\n(Correct|Incorrect)\r?\n")
    $status = if ($statusMatch.Success) { $statusMatch.Groups[1].Value } else { "Unknown" }
    $isAllCorrect = ($status -eq "Correct")

    # Explanation and Domain
    $overallIdx = $chunk.IndexOf("Overall explanation")
    $preExplanation = if ($overallIdx -ge 0) { $chunk.Substring(0, $overallIdx) } else { $chunk }
    $postExplanation = if ($overallIdx -ge 0) { $chunk.Substring($overallIdx) } else { "" }

    $domainMatch = [regex]::Match($postExplanation, "(?m)^Domain\r?\n([^\r\n]+)")
    $domain = if ($domainMatch.Success) { $domainMatch.Groups[1].Value.Trim() } else { "Design Resilient Architectures" }

    if (-not $domainStats.ContainsKey($domain)) {
        $domainStats[$domain] = @{ Total = 0; Correct = 0; Incorrect = 0 }
        $domainOrder += $domain
    }

    $domainStats[$domain].Total++
    if ($isAllCorrect) { $domainStats[$domain].Correct++ } else { $domainStats[$domain].Incorrect++ }

    $expOnly = if ($domainMatch.Success) { $postExplanation.Substring(0, $domainMatch.Index).Trim() } else { $postExplanation.Trim() }

    $hasCorr = ($expOnly -match "(?s)Correct options?:\s*\r?\n(.*?)((?=Incorrect options?:)|(?=References?:)|$)")
    $corrPart = if ($hasCorr) { $matches[1].Trim() } else { "" }

    $hasInc = ($expOnly -match "(?s)Incorrect options?:\s*\r?\n(.*?)((?=References?:)|$)")
    $incPart = if ($hasInc) { $matches[1].Trim() } else { "" }

    $hasRef = ($expOnly -match "(?s)References?:\s*\r?\n(.*)$")
    $refPart = if ($hasRef) { $matches[1].Trim() } else { "" }

    # Prompt and Options
    $bodyText = [regex]::Replace($preExplanation, "(?s)^Question \d+\r?\n(Correct|Incorrect)\r?\n", "").Trim()
    $rawLines = $bodyText -split "\r?\n"
    $blocks = @()
    $currentBlock = @()
    foreach ($line in $rawLines) {
        $trimmed = $line.Trim()
        if ($trimmed.Length -eq 0) {
            if ($currentBlock.Count -gt 0) {
                $blocks += ($currentBlock -join "`n")
                $currentBlock = @()
            }
        } else {
            $currentBlock += $trimmed
        }
    }
    if ($currentBlock.Count -gt 0) {
        $blocks += ($currentBlock -join "`n")
    }

    $lastPromptIdx = -1
    for ($b = 0; $b -lt $blocks.Count; $b++) {
        if ($blocks[$b] -match "(\?|\?\s*\([Ss]elect [a-zA-Z0-9\s]+\))\s*$") {
            $lastPromptIdx = $b
        }
    }

    $promptText = if ($lastPromptIdx -ge 0) {
        ($blocks[0..$lastPromptIdx] -join "`n`n")
    } else {
        $blocks[0]
    }

    $optionBlocks = if ($lastPromptIdx -ge 0 -and $lastPromptIdx + 1 -lt $blocks.Count) {
        $blocks[($lastPromptIdx + 1)..($blocks.Count - 1)]
    } else {
        @()
    }

    $optLetters = @("A", "B", "C", "D", "E", "F")
    $optionsList = @()
    $correctLetters = @()
    $userLetters = @()

    for ($o = 0; $o -lt $optionBlocks.Count; $o++) {
        $bText = $optionBlocks[$o]
        $isUser = $false
        $isCorrect = $false

        if ($bText -match "^Your answer is correct") {
            $isUser = $true; $isCorrect = $true
            $bText = [regex]::Replace($bText, "^Your answer is correct\r?\n?", "").Trim()
        } elseif ($bText -match "^Your selection is correct") {
            $isUser = $true; $isCorrect = $true
            $bText = [regex]::Replace($bText, "^Your selection is correct\r?\n?", "").Trim()
        } elseif ($bText -match "^Your answer is incorrect") {
            $isUser = $true; $isCorrect = $false
            $bText = [regex]::Replace($bText, "^Your answer is incorrect\r?\n?", "").Trim()
        } elseif ($bText -match "^Your selection is incorrect") {
            $isUser = $true; $isCorrect = $false
            $bText = [regex]::Replace($bText, "^Your selection is incorrect\r?\n?", "").Trim()
        } elseif ($bText -match "^Correct answer") {
            $isUser = $false; $isCorrect = $true
            $bText = [regex]::Replace($bText, "^Correct answer\r?\n?", "").Trim()
        } elseif ($bText -match "^Correct selection") {
            $isUser = $false; $isCorrect = $true
            $bText = [regex]::Replace($bText, "^Correct selection\r?\n?", "").Trim()
        }

        $letter = $optLetters[$o]
        if ($isCorrect) { $correctLetters += $letter }
        if ($isUser) { $userLetters += $letter }

        $optionsList += [PSCustomObject]@{
            Letter = $letter
            Text = $bText
            IsCorrect = $isCorrect
            IsUser = $isUser
        }
    }

    $qType = if ($promptText -match "\([Ss]elect two\)") {
        $metaJson.qTypeSelect2
    } elseif ($promptText -match "\([Ss]elect three\)") {
        $metaJson.qTypeSelect3
    } else {
        $metaJson.qTypeSingle
    }

    $qKey = "$qNum"
    $topic = ""
    if ($metaJson.topicTitles -and $metaJson.topicTitles.$qKey) {
        $topic = $metaJson.topicTitles.$qKey
    } else {
        # Intelligent auto-topic from correct options or prompt
        $firstCorr = ($optionsList | Where-Object { $_.IsCorrect } | Select-Object -First 1)
        if ($firstCorr) {
            $cleanTopic = ($firstCorr.Text -split "\r?\n")[0]
            if ($cleanTopic.Length -gt 75) { $cleanTopic = $cleanTopic.Substring(0, 72) + "..." }
            $topic = $cleanTopic
        } else {
            $firstLine = ($promptText -split "\r?\n")[0]
            if ($firstLine.Length -gt 75) { $firstLine = $firstLine.Substring(0, 72) + "..." }
            $topic = $firstLine
        }
    }

    if (-not $isAllCorrect) {
        $incorrectList += $qNum
    }

    $questionsData += [PSCustomObject]@{
        Num = $qNum
        Topic = $topic
        Domain = $domain
        QType = $qType
        Status = $status
        IsCorrect = $isAllCorrect
        Prompt = $promptText
        Options = $optionsList
        CorrectLetters = $correctLetters
        UserLetters = $userLetters
        CorrExplanation = $corrPart
        IncExplanation = $incPart
        RefText = $refPart
    }
}

$totalQuestions = $questionsData.Count
$totalCorrect = ($questionsData | Where-Object { $_.IsCorrect }).Count
$totalIncorrect = $totalQuestions - $totalCorrect
$overallPct = if ($totalQuestions -gt 0) { [math]::Round(($totalCorrect / $totalQuestions) * 100, 2) } else { 0 }
$isPassed = ($overallPct -ge 72.0)

Write-Host "Scored: $totalCorrect / $totalQuestions ($overallPct%) -> Passed: $isPassed"

# Construct Document
$sb = [System.Text.StringBuilder]::new()

# Title and Meta
[void]$sb.AppendLine($metaJson.examTitle)
[void]$sb.AppendLine("")
[void]$sb.AppendLine($metaJson.metaCourse)
[void]$sb.AppendLine($metaJson.metaSet)
[void]$sb.AppendLine($metaJson.metaRef)
[void]$sb.AppendLine("")
[void]$sb.AppendLine("---")
[void]$sb.AppendLine("")

# Performance Summary
[void]$sb.AppendLine($metaJson.h1)
[void]$sb.AppendLine("")
[void]$sb.AppendLine($metaJson.tblHeaderMetric)
[void]$sb.AppendLine("| :--- | :---: | :---: | :---: |")
$cau = $metaJson.tblCau
[void]$sb.AppendLine($metaJson.tblTotal + " **$totalQuestions$cau** | 65 cau | Hoan thanh 100% |")
[void]$sb.AppendLine($metaJson.tblCorrect + " **$totalCorrect$cau** | $\ge 47$ cau (72%) | Dat tieu chuan [x] |")
[void]$sb.AppendLine($metaJson.tblIncorrect + " **$totalIncorrect$cau** | $\le 18$ cau | Can tap trung on tap [!] |")
$banner = if ($isPassed) { $metaJson.passedBanner } else { $metaJson.failedBanner }
[void]$sb.AppendLine($metaJson.tblScore + " **$overallPct% (~$([int]($overallPct * 10)) / 1000)** | $\ge 72.0\%$ (720 / 1000) | $banner |")
[void]$sb.AppendLine($metaJson.tblTime)
[void]$sb.AppendLine("")
[void]$sb.AppendLine("---")
[void]$sb.AppendLine("")

# Domains Breakdown
[void]$sb.AppendLine($metaJson.h1Domain)
[void]$sb.AppendLine("")
[void]$sb.AppendLine($metaJson.tblHeaderDomains)
[void]$sb.AppendLine("| :--- | :---: | :---: | :---: | :---: | :---: | :---: |")

foreach ($dom in $domainOrder) {
    if ($domainStats.ContainsKey($dom)) {
        $stat = $domainStats[$dom]
        $weight = if ($metaJson.domainWeights -and $metaJson.domainWeights.$dom) { $metaJson.domainWeights.$dom } else { "-" }
        $titleVi = if ($metaJson.domainTitlesVi -and $metaJson.domainTitlesVi.$dom) { $metaJson.domainTitlesVi.$dom } else { $dom }
        $domLabel = if ($metaJson.domainLabels -and $metaJson.domainLabels.$dom) { $metaJson.domainLabels.$dom } else { $dom }
        $pct = if ($stat.Total -gt 0) { [math]::Round(($stat.Correct / $stat.Total) * 100, 1) } else { 0 }
        $rating = if ($pct -ge 85) { $metaJson.ratingExcellent } elseif ($pct -ge 75) { $metaJson.ratingGood } else { $metaJson.ratingNeedsWork }
        [void]$sb.AppendLine("| **$domLabel**<br>*$titleVi* | **$weight** | $($stat.Total)$cau | $($stat.Correct)$cau | $($stat.Incorrect)$cau | **$pct%** | $rating |")
    }
}
[void]$sb.AppendLine($metaJson.tblTotalRowLabel + " **$totalQuestions$cau** | **$totalCorrect$cau** | **$totalIncorrect$cau** | **$overallPct%** | $banner |")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("---")
[void]$sb.AppendLine("")

# Focused Revision Table (if any incorrect)
if ($incorrectList.Count -gt 0) {
    [void]$sb.AppendLine($metaJson.h2)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine($metaJson.h2Intro)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine($metaJson.tblHeaderReview)
    [void]$sb.AppendLine("| :---: | :--- | :--- | :--- | :---: |")

    foreach ($qNum in $incorrectList) {
        $qObj = $questionsData[$qNum - 1]
        $domShort = $qObj.Domain
        if ($metaJson.domainLabels -and $metaJson.domainLabels.($qObj.Domain)) {
            $domShort = ($metaJson.domainLabels.($qObj.Domain) -split ":")[0]
        }
        $qKey = "$qNum"
        $takeaway = ""
        if ($metaJson.incorrectReviewNotes -and $metaJson.incorrectReviewNotes.$qKey) {
            $takeaway = $metaJson.incorrectReviewNotes.$qKey
        } else {
            # Auto fallback takeaway from correct answer
            $corrAnsStr = ($qObj.Options | Where-Object { $_.IsCorrect } | ForEach-Object { $_.Text }) -join " + "
            $takeaway = "Dap an chinh xac: **" + $corrAnsStr + "**"
        }
        $anchor = "question-$("{0:D2}" -f $qNum)"
        $linkCode = $metaJson.linkJump + $anchor + ")"
        $cauPrefix = $metaJson.cauWord
        [void]$sb.AppendLine("| **$cauPrefix$("{0:D2}" -f $qNum)** | $domShort | **$($qObj.Topic)** | $takeaway | $linkCode |")
    }
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("---")
    [void]$sb.AppendLine("")
}

# Quick Index
[void]$sb.AppendLine($metaJson.h3)
[void]$sb.AppendLine("")
[void]$sb.AppendLine("<details>")
[void]$sb.AppendLine($metaJson.h3Summary)
[void]$sb.AppendLine("")
[void]$sb.AppendLine($metaJson.tblHeaderIndex)
[void]$sb.AppendLine("| :---: | :---: | :--- | :--- |")

foreach ($q in $questionsData) {
    $numStr = "{0:D2}" -f $q.Num
    $anchor = "question-$numStr"
    $badge = if ($q.IsCorrect) { $metaJson.badgeCorrect } else { $metaJson.badgeIncorrect }
    $domShort = $q.Domain
    if ($metaJson.domainLabels -and $metaJson.domainLabels.($q.Domain)) {
        $domShort = ($metaJson.domainLabels.($q.Domain) -split ":")[0]
    }
    [void]$sb.AppendLine("| [$numStr](#$anchor) | $badge | [$($q.Topic)](#$anchor) | $domShort |")
}

[void]$sb.AppendLine("")
[void]$sb.AppendLine("</details>")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("---")
[void]$sb.AppendLine("")

# Detailed Questions
[void]$sb.AppendLine($metaJson.h4)
[void]$sb.AppendLine("")

foreach ($q in $questionsData) {
    $numStr = "{0:D2}" -f $q.Num
    $anchor = "question-$numStr"
    $statusBadge = if ($q.IsCorrect) { $metaJson.statusCorrect } else { $metaJson.statusIncorrect }

    $optionsMd = @()
    foreach ($opt in $q.Options) {
        $tag = ""
        if ($opt.IsUser -and $opt.IsCorrect) {
            $tag = $metaJson.tagUserCorrect
        } elseif ($opt.IsUser -and (-not $opt.IsCorrect)) {
            $tag = $metaJson.tagUserIncorrect
        } elseif ((-not $opt.IsUser) -and $opt.IsCorrect) {
            $tag = $metaJson.tagCorrect
        }
        $optionsMd += "- **($($opt.Letter))** $($opt.Text)$tag"
    }
    $finalOptionsText = ($optionsMd -join "`n")

    $correctStr = ($q.CorrectLetters | ForEach-Object { "($($_))" }) -join ", "
    $userStr = if ($q.UserLetters.Count -gt 0) { ($q.UserLetters | ForEach-Object { "($($_))" }) -join ", " } else { "-" }

    $corrClean = $q.CorrExplanation
    $vRef = $metaJson.visualRef
    $corrClean = [regex]::Replace($corrClean, "(?m)^(.*?)\s*via\s*-\s*(https?://\S+)\s*$", ($vRef + '[$1]($2)'))
    $corrClean = [regex]::Replace($corrClean, "(?m)^\s*via\s*-\s*(https?://\S+)\s*$", ($vRef + '[AWS Documentation]($1)'))

    $incClean = $q.IncExplanation
    $incClean = [regex]::Replace($incClean, "(?m)^(.*?)\s*via\s*-\s*(https?://\S+)\s*$", ($vRef + '[$1]($2)'))
    $incClean = [regex]::Replace($incClean, "(?m)^\s*via\s*-\s*(https?://\S+)\s*$", ($vRef + '[AWS Documentation]($1)'))
    $incParas = ($incClean -split "(?:\r?\n){2,}") | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 }
    $formattedIncParas = @()
    foreach ($p in $incParas) {
        if ($p -match "^(.*?)\s+-\s+(.+)$") {
            $optName = $matches[1].Trim()
            $explanation = $matches[2].Trim()
            $formattedIncParas += "- **$optName**:`n  $explanation"
        } elseif ($p -match "^>") {
            $formattedIncParas += $p
        } else {
            $formattedIncParas += "- $p"
        }
    }
    $finalIncText = ($formattedIncParas -join "`n`n")

    $refLines = ($q.RefText -split "\r?\n") | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 }
    $formattedRefs = @()
    foreach ($r in $refLines) {
        if ($r -match "^https?://") {
            $url = $r
            $urlTitle = $url -replace "^https?://", "" -replace "/$", ""
            if ($url -match "docs\.aws\.amazon\.com/([^/]+)/.*?([^/]+)\.html") {
                $service = $matches[1]
                $page = $matches[2] -replace "-", " "
                $urlTitle = "AWS Docs: $service - $page"
            } elseif ($url -match "aws\.amazon\.com/blogs/([^/]+)/([^/]+)") {
                $cat = $matches[1]
                $page = $matches[2] -replace "-", " "
                $urlTitle = "AWS Architecture Blog: $page"
            } elseif ($url -match "aws\.amazon\.com/([^/]+)/") {
                $service = $matches[1]
                $urlTitle = "AWS Service Overview: $service"
            }
            $formattedRefs += ($metaJson.refPrefix + $urlTitle + "](" + $url + ")")
        } elseif ($r.Length -gt 0) {
            $formattedRefs += "- $r"
        }
    }
    $finalRefText = if ($formattedRefs.Count -gt 0) { ($formattedRefs -join "`n") } else { $metaJson.noExtraRef }

    $domLabel = if ($metaJson.domainLabels -and $metaJson.domainLabels.($q.Domain)) { $metaJson.domainLabels.($q.Domain) } else { $q.Domain }

    [void]$sb.AppendLine("<div id=""$anchor""></div>")
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("### Question ${numStr}: $($q.Topic)")
    [void]$sb.AppendLine($metaJson.labelDomain + $domLabel + "  ")
    [void]$sb.AppendLine($metaJson.labelType + $q.QType + "  ")
    [void]$sb.AppendLine($metaJson.labelResult + $statusBadge + $metaJson.labelUser + $userStr + $metaJson.labelCorrect + $correctStr)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine($metaJson.headingPrompt)
    [void]$sb.AppendLine($q.Prompt)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine($metaJson.headingOptions)
    [void]$sb.AppendLine($finalOptionsText)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("<details>")
    [void]$sb.AppendLine($metaJson.summaryExp)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine($metaJson.headingAns + "**$correctStr**")
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine($metaJson.headingCore)
    [void]$sb.AppendLine($corrClean)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine($metaJson.headingDistractors)
    [void]$sb.AppendLine($finalIncText)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine($metaJson.headingRefs)
    [void]$sb.AppendLine($finalRefText)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("</details>")
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("---")
    [void]$sb.AppendLine("")
}

# Backup if overwriting
if ($resolvedOutput -eq $resolvedInput -and (-not $NoBackup)) {
    $backupPath = $resolvedInput + ".bak"
    [System.IO.File]::Copy($resolvedInput, $backupPath, $true)
    Write-Host "Created backup: $backupPath"
}

# Write final output with UTF-8 BOM
[System.IO.File]::WriteAllText($resolvedOutput, $sb.ToString(), [System.Text.UTF8Encoding]::new($true))
Write-Host "==========================================================="
Write-Host "SUCCESS: Structured Markdown generated!"
Write-Host "Output File: $resolvedOutput"
Write-Host "File Size  : $([math]::Round($sb.Length / 1024, 1)) KB"
Write-Host "Questions  : $totalQuestions"
Write-Host "Score      : $totalCorrect / $totalQuestions ($overallPct%)"
Write-Host "==========================================================="
