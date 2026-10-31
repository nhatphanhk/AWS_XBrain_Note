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
    # Check for specific metadata e.g. pt_1_metadata.json, pt6_metadata.json, etc.
    $cleanBaseName = $inputFileName -replace "\.bak$", "" -replace "_raw$", "" -replace "\.md$", ""
    $autoCandidates = @(
        (Join-Path $scriptDir ($cleanBaseName + "_metadata.json")),
        (Join-Path $scriptDir (($cleanBaseName -replace "udemy_", "") + "_metadata.json")),
        (Join-Path $scriptDir ($inputFileName + "_metadata.json"))
    )
    foreach ($cand in $autoCandidates) {
        if (Test-Path $cand) {
            $resolvedMeta = $cand
            break
        }
    }
    if ($null -eq $resolvedMeta) {
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

# Check for accidental clipboard duplication (e.g. nested 'Practice Test #X Review' inside Question 1)
if ($raw -match "(?s)Question 1.*?Practice Test #\d+ Review.*?Question 65") {
    Write-Host "Detected accidental duplicated practice test pasted into file. Cleaning up..."
    $lines = [System.IO.File]::ReadAllLines($resolvedInput, [System.Text.Encoding]::UTF8)
    $cleanLines = @()
    $cleanLines += $lines[0..9]
    $cleanLines += '[ ] Ingest the sensor data in Amazon Kinesis Data Streams, which is polled by an application running on an Amazon EC2 instance and the data is written into an auto-scaled Amazon DynamoDB table for downstream processing'
    $cleanLines += $lines[1107..($lines.Length - 1)]
    $raw = $cleanLines -join "`n"
}

# Parse questions
$qMatches = [regex]::Matches($raw, "(?m)^Question (\d+)\s*[\-\u2013\u2014]\s*(?:Correct|Incorrect)")
if ($qMatches.Count -eq 0) {
    $qMatches = [regex]::Matches($raw, "(?m)^Question (\d+):?\r?$")
}
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
$optLetters = @("A", "B", "C", "D", "E", "F", "G", "H")

for ($idx = 0; $idx -lt $qMatches.Count; $idx++) {
    $qNum = $idx + 1
    $start = $qMatches[$idx].Index
    $end = if ($idx + 1 -lt $qMatches.Count) { $qMatches[$idx+1].Index } else { $raw.Length }
    $chunk = $raw.Substring($start, $end - $start)

    $isReviewBreakdown = ($chunk -match "^Question \d+\s*[\-\u2013\u2014]\s*(?:Correct|Incorrect)")
    $isBracketFormat = ($chunk -match "(?m)^\[([ xX])\]")
    $isQABank = ($chunk -match "(?m)^Question\r?$" -and $chunk -match "(?m)^Answer\r?$")
    $isCloudMentor = ($chunk -match "(?m)^Question \d+:\r?\n(?:Correct|Incorrect|Skipped)" -and $chunk -match "(?m)^[A-H]\.\r?\n" -and $chunk -match "(?m)^Explanation\r?$")

    $optionsList = @()
    $correctLetters = @()
    $userLetters = @()
    $tipsPart = ""

    if ($isReviewBreakdown) {
        # Format C: Detailed Review Breakdown (e.g. PT2)
        $statusMatch = [regex]::Match($chunk, "^Question \d+\s*[\-\u2013\u2014]\s*(Correct|Incorrect)")
        $status = if ($statusMatch.Success) { $statusMatch.Groups[1].Value } else { "Unknown" }
        $isAllCorrect = ($status -eq "Correct")

        $domMatch = [regex]::Match($chunk, "(?m)^Domain:\s*(.+)")
        $domain = if ($domMatch.Success) { $domMatch.Groups[1].Value.Trim() } else { "Design Resilient Architectures" }

        $qMatch = [regex]::Match($chunk, "(?ms)^Question:\s*(.*?)(?=\r?\n(?:Your Answer|Correct Answer))")
        $promptText = if ($qMatch.Success) { $qMatch.Groups[1].Value.Trim() } else { "" }

        if ($isAllCorrect) {
            $ansMatch = [regex]::Match($chunk, "(?ms)^Your Answer / Correct Answers?:\s*(.*?)(?=\r?\n(?:Reason|Reason / Explanation|Explanation):|\r?\n---|$)")
            $ansRaw = if ($ansMatch.Success) { $ansMatch.Groups[1].Value.Trim() } else { "" }
            $ansLines = ($ansRaw -split "\r?\n") | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 }
            foreach ($line in $ansLines) {
                $letter = $optLetters[$optionsList.Count]
                $correctLetters += $letter
                $userLetters += $letter
                $optionsList += [PSCustomObject]@{ Letter = $letter; Text = $line; IsCorrect = $true; IsUser = $true }
            }
        } else {
            $userMatch = [regex]::Match($chunk, "(?ms)^Your Answer:\s*(.*?)(?=\r?\nCorrect Answers?:)")
            $userRaw = if ($userMatch.Success) { $userMatch.Groups[1].Value.Trim() } else { "" }
            $userLines = ($userRaw -split "\r?\n") | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 }

            $ansMatch = [regex]::Match($chunk, "(?ms)^Correct Answers?:\s*(.*?)(?=\r?\n(?:Reason|Reason / Explanation|Explanation):|\r?\n---|$)")
            $ansRaw = if ($ansMatch.Success) { $ansMatch.Groups[1].Value.Trim() } else { "" }
            $corrLines = ($ansRaw -split "\r?\n") | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 }

            foreach ($line in $userLines) {
                $letter = $optLetters[$optionsList.Count]
                $userLetters += $letter
                $optionsList += [PSCustomObject]@{ Letter = $letter; Text = $line; IsCorrect = $false; IsUser = $true }
            }
            foreach ($line in $corrLines) {
                $letter = $optLetters[$optionsList.Count]
                $correctLetters += $letter
                $optionsList += [PSCustomObject]@{ Letter = $letter; Text = $line; IsCorrect = $true; IsUser = $false }
            }
        }

        $rMatch = [regex]::Match($chunk, "(?ms)^(?:Reason|Reason / Explanation):\s*(.*?)(?=\r?\n---|---\Z|\Z)")
        $corrPart = if ($rMatch.Success) { $rMatch.Groups[1].Value.Trim() } else { "" }
        $incPart = ""
        $refPart = ""

    } elseif ($isQABank) {
        # Format D: Q&A Question Bank format (e.g. PT3)
        $domMatch = [regex]::Match($chunk, "(?m)^Domain:\s*(.+)")
        $domain = if ($domMatch.Success) { $domMatch.Groups[1].Value.Trim() } else { "Design Resilient Architectures" }

        $qMatch = [regex]::Match($chunk, "(?ms)^Question\r?\n(.*?)(?=\r?\nAnswer\r?\n)")
        $qaBody = if ($qMatch.Success) { $qMatch.Groups[1].Value.Trim() } else { "" }

        $ansMatch = [regex]::Match($chunk, "(?ms)^Answer\r?\n(.*?)(?=\r?\nExplanation\r?\n)")
        $ansBody = if ($ansMatch.Success) { $ansMatch.Groups[1].Value.Trim() } else { "" }
        $ansLines = ($ansBody -split "\r?\n") | ForEach-Object { ($_ -replace "\s+", " ").Trim() } | Where-Object { $_.Length -gt 0 }

        $lines = ($qaBody -split "\r?\n") | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 }
        $lastPromptIdx = -1
        for ($l = 0; $l -lt $lines.Count; $l++) {
            if ($lines[$l] -match "(\?|\?\s*\([Ss]elect [a-zA-Z0-9\s]+\))\s*$") { $lastPromptIdx = $l }
        }
        $promptText = if ($lastPromptIdx -ge 0) { ($lines[0..$lastPromptIdx] -join "`n`n") } else { $lines[0] }
        $optBlocks = if ($lastPromptIdx -ge 0) { $lines[($lastPromptIdx + 1)..($lines.Count - 1)] } else { @() }

        for ($o = 0; $o -lt $optBlocks.Count; $o++) {
            $bText = $optBlocks[$o]
            $optNorm = ($bText -replace "\s+", " ").Trim()
            $isCorrect = ($ansLines -contains $optNorm)
            $letter = $optLetters[$o]
            if ($isCorrect) { $correctLetters += $letter; $userLetters += $letter }
            $optionsList += [PSCustomObject]@{ Letter = $letter; Text = $bText; IsCorrect = $isCorrect; IsUser = $isCorrect }
        }
        $isAllCorrect = $true
        $status = "Correct"

        $expMatch = [regex]::Match($chunk, "(?ms)^Explanation\r?\n(.*?)(?=\r?\n(?:Incorrect options?:|References?:|Domain:)|\Z)")
        $corrPart = if ($expMatch.Success) { $expMatch.Groups[1].Value.Trim() } else { "" }

        $incMatch = [regex]::Match($chunk, "(?ms)^Incorrect options?:\s*\r?\n(.*?)(?=\r?\n(?:References?:|Domain:)|\Z)")
        $incPart = if ($incMatch.Success) { $incMatch.Groups[1].Value.Trim() } else { "" }

        $refMatch = [regex]::Match($chunk, "(?ms)^References?:\s*\r?\n(.*?)(?=\r?\nDomain:|\Z)")
        $refPart = if ($refMatch.Success) { $refMatch.Groups[1].Value.Trim() } else { "" }

    } elseif ($isBracketFormat) {
        # Format B: Checkbox Markdown Format (e.g. PT1 raw)
        $domMatch = [regex]::Match($chunk, "(?m)^Domain:\s*(.+)")
        $domain = if ($domMatch.Success) { $domMatch.Groups[1].Value.Trim() } else { "Design Resilient Architectures" }

        # Prompt
        $qMatch = [regex]::Match($chunk, "(?ms)Question:\s*(.*?)(?=\r?\nOptions:)")
        $promptText = if ($qMatch.Success) { $qMatch.Groups[1].Value.Trim() } else { "" }

        # Options
        $optMatches = [regex]::Matches($chunk, "(?m)^\[([ xX])\]\s*")
        $ansMatch = [regex]::Match($chunk, "(?ms)^Correct Answers?:\s*(.*?)(?=\r?\nReason|\r?\nExplanation|\r?\n--|\Z)")
        $corrRaw = if ($ansMatch.Success) { $ansMatch.Groups[1].Value.Trim() } else { "" }
        $corrLines = ($corrRaw -split "\r?\n") | ForEach-Object { ($_ -replace "\s+", " ").Trim() } | Where-Object { $_.Length -gt 0 }
        $corrRawCompact = ($corrRaw -replace "\s+", "")

        for ($o = 0; $o -lt $optMatches.Count; $o++) {
            $startIdx = $optMatches[$o].Index + $optMatches[$o].Length
            $endIdx = if ($o + 1 -lt $optMatches.Count) { 
                $optMatches[$o+1].Index 
            } else {
                $ansSearch = [regex]::Match($chunk.Substring($startIdx), "(?m)^Correct Answers?:")
                if ($ansSearch.Success) { $startIdx + $ansSearch.Index } else { $chunk.Length }
            }
            $isUser = ($optMatches[$o].Groups[1].Value.Trim().ToLower() -eq 'x')
            $bText = $chunk.Substring($startIdx, $endIdx - $startIdx).Trim()

            $optNorm = ($bText -replace "\s+", " ").Trim()
            $optCompact = ($bText -replace "^Option [A-D]:", "" -replace "\s+", "")
            $isCorrect = $false

            if ($corrLines -contains $optNorm) {
                $isCorrect = $true
            } elseif ($bText -match "^\s*[\{\[]" -or $bText -match "^Option [A-D]:") {
                if ($corrRawCompact.Length -gt 0 -and $corrRawCompact.Contains($optCompact)) {
                    $isCorrect = $true
                }
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

        $isAllCorrect = ($userLetters.Count -gt 0 -and $userLetters.Count -eq $correctLetters.Count)
        if ($isAllCorrect) {
            foreach ($ul in $userLetters) {
                if ($correctLetters -notcontains $ul) { $isAllCorrect = $false }
            }
        }
        $status = if ($isAllCorrect) { "Correct" } else { "Incorrect" }

        # Explanation parsing
        $expMatch = [regex]::Match($chunk, "(?ms)^(?:Reason / Explanation|Reason|Explanation):\s*(.*?)(?=\r?\n--|\Z)")
        $fullExp = if ($expMatch.Success) { $expMatch.Groups[1].Value.Trim() } else { "" }

        $hasCorr = ($fullExp -match "(?s)Correct options?:\s*(.*?)((?=Incorrect options?:)|(?=References?:)|$)")
        $corrPart = if ($hasCorr) { $matches[1].Trim() } else { $fullExp }

        $hasInc = ($fullExp -match "(?s)Incorrect options?:\s*(.*?)((?=References?:)|$)")
        $incPart = if ($hasInc) { $matches[1].Trim() } else { "" }

        $hasRef = ($fullExp -match "(?s)References?:\s*(.*)$")
        $refPart = if ($hasRef) { $matches[1].Trim() } else { "" }

    } elseif ($isCloudMentor) {
        # Format E: Cloud Mentor Practice Test format (pt_1.md)
        $statusMatch = [regex]::Match($chunk, "(?m)^Question \d+:\r?\n([^\r\n]+)")
        $rawStatus = if ($statusMatch.Success) { $statusMatch.Groups[1].Value.Trim() } else { "Unknown" }
        $isAllCorrect = ($rawStatus -eq "Correct")
        $status = if ($isAllCorrect) { "Correct" } else { "Incorrect" }

        # Domain
        $qKey = "$qNum"
        $domain = if ($metaJson.questionDomains -and $metaJson.questionDomains.$qKey) {
            $metaJson.questionDomains.$qKey
        } else {
            "Design Resilient Architectures"
        }

        # Prompt
        $promptMatch = [regex]::Match($chunk, "(?ms)^Question \d+:\r?\n(?:Correct|Incorrect|Skipped)\r?\n(.*?)(?=\r?\n[A-H]\.\r?\n)")
        $promptText = if ($promptMatch.Success) { $promptMatch.Groups[1].Value.Trim() } else { "" }

        # Options
        $optMatches = [regex]::Matches($chunk, "(?ms)^([A-H])\.\r?\n(.*?)(?=\r?\n[A-H]\.\r?\n|\r?\nExplanation\r?\n)")
        $wrongMatches = [regex]::Matches($chunk, "(?m)^❌\s*(.+)")
        $wrongTexts = @()
        foreach ($wm in $wrongMatches) { $wrongTexts += ($wm.Groups[1].Value.Trim() -replace "\s+", " ") }

        for ($o = 0; $o -lt $optMatches.Count; $o++) {
            $letter = $optMatches[$o].Groups[1].Value
            $bText = $optMatches[$o].Groups[2].Value.Trim()
            $optNorm = ($bText -replace "\s+", " ").Trim()

            $isWrong = $false
            foreach ($wt in $wrongTexts) {
                if ($wt.StartsWith($optNorm) -or $optNorm.StartsWith($wt) -or $wt -eq $optNorm) {
                    $isWrong = $true
                    break
                }
            }
            $isCorrect = (-not $isWrong)
            $isUser = ($isAllCorrect -and $isCorrect)

            if ($isCorrect) { $correctLetters += $letter }
            if ($isUser) { $userLetters += $letter }

            $optionsList += [PSCustomObject]@{
                Letter = $letter
                Text = $bText
                IsCorrect = $isCorrect
                IsUser = $isUser
            }
        }

        # Explanation parsing
        $expMatch = [regex]::Match($chunk, "(?ms)^Explanation\r?\n(.*)$")
        $expBlock = if ($expMatch.Success) { $expMatch.Groups[1].Value.Trim() } else { "" }

        # Scenario Summary (Tóm tắt đề)
        $ttMatch = [regex]::Match($expBlock, "(?ms)📝\s*Tóm tắt đề:\s*\r?\n(.*?)(?=\r?\n(?:✅\s*|Đáp án đúng:))")
        $tomTatText = if ($ttMatch.Success) { $ttMatch.Groups[1].Value.Trim() } else { "" }

        # Correct Answer Reasoning
        $corrExpMatch = [regex]::Match($expBlock, "(?ms)(?:✅\s*)?Đáp án đúng:\s*\r?\n(.*?)(?=\r?\n(?:Các đáp án sai:|❌|🔑|Tips and tricks:|📖|Reference:|$))")
        $corrExpRaw = if ($corrExpMatch.Success) { $corrExpMatch.Groups[1].Value.Trim() } else { "" }

        $corrPartSb = [System.Text.StringBuilder]::new()
        if ($tomTatText.Length -gt 0) {
            $ttLines = ($tomTatText -split "\r?\n") | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 }
            [void]$corrPartSb.AppendLine("> 📝 **Tóm tắt đề bài:**")
            foreach ($ttl in $ttLines) {
                [void]$corrPartSb.AppendLine("> - $ttl")
            }
            [void]$corrPartSb.AppendLine("")
            [void]$corrPartSb.AppendLine("**Phân tích giải pháp tối ưu:**")
        }
        if ($corrExpRaw.Length -gt 0) {
            [void]$corrPartSb.AppendLine($corrExpRaw)
        }
        $corrPart = $corrPartSb.ToString().Trim()

        # Distractor Analysis
        $incMatch = [regex]::Match($expBlock, "(?ms)Các đáp án sai:\s*\r?\n(.*?)(?=\r?\n(?:🔑|Tips and tricks:|📖|Reference:|$))")
        $incPart = if ($incMatch.Success) { $incMatch.Groups[1].Value.Trim() } else { "" }

        # Tips & Tricks
        $tipsMatch = [regex]::Match($expBlock, "(?ms)🔑\s*Tips and tricks:\s*\r?\n(.*?)(?=\r?\n(?:📖|Reference:|$))")
        $tipsPart = if ($tipsMatch.Success) { $tipsMatch.Groups[1].Value.Trim() } else { "" }

        # References
        $refMatch = [regex]::Match($expBlock, "(?ms)📖\s*Reference:\s*\r?\n(.*)$")
        $refPart = if ($refMatch.Success) { $refMatch.Groups[1].Value.Trim() } else { "" }
    } else {
        # Format A: Udemy review format (e.g. PT6, sample_raw_test)
        $statusMatch = [regex]::Match($chunk, "(?m)^Question \d+\r?\n(Correct|Incorrect)\r?\n")
        $status = if ($statusMatch.Success) { $statusMatch.Groups[1].Value } else { "Unknown" }
        $isAllCorrect = ($status -eq "Correct")

        # Explanation and Domain
        $overallIdx = $chunk.IndexOf("Overall explanation")
        $preExplanation = if ($overallIdx -ge 0) { $chunk.Substring(0, $overallIdx) } else { $chunk }
        $postExplanation = if ($overallIdx -ge 0) { $chunk.Substring($overallIdx) } else { "" }

        $domainMatch = [regex]::Match($postExplanation, "(?m)^Domain\r?\n([^\r\n]+)")
        $domain = if ($domainMatch.Success) { $domainMatch.Groups[1].Value.Trim() } else { "Design Resilient Architectures" }

        $expOnly = if ($domainMatch.Success) { $postExplanation.Substring(0, $domainMatch.Index).Trim() } else { $postExplanation.Trim() }

        $hasCorr = ($expOnly -match "(?s)Correct options?:\s*(.*?)((?=Incorrect options?:)|(?=References?:)|$)")
        $corrPart = if ($hasCorr) { $matches[1].Trim() } else { "" }

        $hasInc = ($expOnly -match "(?s)Incorrect options?:\s*(.*?)((?=References?:)|$)")
        $incPart = if ($hasInc) { $matches[1].Trim() } else { "" }

        $hasRef = ($expOnly -match "(?s)References?:\s*(.*)$")
        $refPart = if ($hasRef) { $matches[1].Trim() } else { "" }

        # Prompt & Options extraction
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
    }

    $qKey = "$qNum"
    if ($metaJson.questionDomains -and $metaJson.questionDomains.$qKey) {
        $domain = $metaJson.questionDomains.$qKey
    }

    if (-not $domainStats.ContainsKey($domain)) {
        $domainStats[$domain] = @{ Total = 0; Correct = 0; Incorrect = 0 }
        $domainOrder += $domain
    }
    $domainStats[$domain].Total++
    if ($isAllCorrect) { $domainStats[$domain].Correct++ } else { $domainStats[$domain].Incorrect++ }

    $qType = if ($promptText -match "(?i)\(select two[ \.]*\)") {
        $metaJson.qTypeSelect2
    } elseif ($promptText -match "(?i)\(select three[ \.]*\)") {
        $metaJson.qTypeSelect3
    } else {
        $metaJson.qTypeSingle
    }

    $qKey = "$qNum"
    $topic = if ($metaJson.topicTitles -and $metaJson.topicTitles.$qKey) {
        $metaJson.topicTitles.$qKey
    } else {
        # Intelligent auto-topic from correct options or prompt
        $firstCorr = ($optionsList | Where-Object { $_.IsCorrect } | Select-Object -First 1)
        if ($firstCorr) {
            $cleanTopic = ($firstCorr.Text -split "\r?\n")[0]
            if ($cleanTopic.Length -gt 75) { $cleanTopic = $cleanTopic.Substring(0, 72) + "..." }
            $cleanTopic
        } else {
            $firstLine = ($promptText -split "\r?\n")[0]
            if ($firstLine.Length -gt 75) { $firstLine = $firstLine.Substring(0, 72) + "..." }
            $firstLine
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
        TipsText = $tipsPart
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
    $completionStatus = if ($metaJson.statusCompleted) { $metaJson.statusCompleted } else { "Hoàn thành 100%" }
    [void]$sb.AppendLine($metaJson.tblTotal + " **$totalQuestions$cau** | 65$cau | $completionStatus |")
    $correctStatus = if ($isPassed) { if ($metaJson.statusTargetMet) { $metaJson.statusTargetMet } else { "Đạt tiêu chuẩn ✅" } } else { if ($metaJson.statusTargetNotMet) { $metaJson.statusTargetNotMet } else { "Chưa đạt tiêu chuẩn ❌" } }
    [void]$sb.AppendLine($metaJson.tblCorrect + " **$totalCorrect$cau** | $\ge 47$ $cau (72%) | $correctStatus |")
    $incorrectStatus = if ($totalIncorrect -eq 0) { if ($metaJson.statusNoErrors) { $metaJson.statusNoErrors } else { "Không có câu sai 🌟" } } else { if ($metaJson.statusNeedsRevision) { $metaJson.statusNeedsRevision } else { "Cần tập trung ôn tập ⚠️" } }
    [void]$sb.AppendLine($metaJson.tblIncorrect + " **$totalIncorrect$cau** | $\le 18$ $cau | $incorrectStatus |")
    $banner = if ($isPassed) { $metaJson.passedBanner } else { $metaJson.failedBanner }
    [void]$sb.AppendLine($metaJson.tblScore + " **$overallPct% (~$([int]($overallPct * 10)) / 1000)** | $\ge 72.0\%$ (720 / 1000) | $banner |")
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
        $takeawayClean = (($takeaway.Trim() -split "\r?\n") | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 }) -join "<br>"
        $takeawayClean = $takeawayClean -replace "\|", "\|"
        $topicClean = $qObj.Topic -replace "\|", "\|" -replace "(?:\r?\n)+", " "
        $anchor = "question-$("{0:D2}" -f $qNum)"
        $linkCode = $metaJson.linkJump + $anchor + ")"
        $cauPrefix = $metaJson.cauWord
        [void]$sb.AppendLine("| **$cauPrefix$("{0:D2}" -f $qNum)** | $domShort | **$topicClean** | $takeawayClean | $linkCode |")
    }
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("---")
    [void]$sb.AppendLine("")
} else {
    [void]$sb.AppendLine($metaJson.h2)
    [void]$sb.AppendLine("")
    $emptyMsg = if ($metaJson.h2Empty) { $metaJson.h2Empty } else { "> 🌟 **Tuyệt vời!** Bạn đã trả lời chính xác 100% tất cả các câu hỏi trong đề thi này ($totalQuestions / $totalQuestions câu). Không có câu hỏi nào cần đưa vào danh sách ôn tập trọng tâm." }
    [void]$sb.AppendLine($emptyMsg)
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
    $topicClean = $q.Topic -replace "\|", "\|" -replace "(?:\r?\n)+", " "
    [void]$sb.AppendLine("| [$numStr](#$anchor) | $badge | [$topicClean](#$anchor) | $domShort |")
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

    $formattedIncParas = @()
    if ($incClean -match "(?m)^❌") {
        $wrongBlocks = [regex]::Matches($incClean, "(?ms)^❌\s*(.*?)(?=\r?\n❌|\Z)")
        foreach ($wb in $wrongBlocks) {
            $wText = $wb.Groups[1].Value.Trim()
            $firstNewline = $wText.IndexOf("`n")
            $wOptName = if ($firstNewline -ge 0) { $wText.Substring(0, $firstNewline).Trim() } else { $wText }
            $wReason = if ($firstNewline -ge 0) { $wText.Substring($firstNewline).Trim() } else { "" }

            $wLetter = ""
            $wNorm = ($wOptName -replace "\s+", " ").Trim()
            foreach ($opt in $q.Options) {
                $oNorm = ($opt.Text -replace "\s+", " ").Trim()
                if ($wNorm.StartsWith($oNorm) -or $oNorm.StartsWith($wNorm) -or $wNorm -eq $oNorm) {
                    $wLetter = "($($opt.Letter)) "
                    break
                }
            }

            $reasonLines = ($wReason -split "\r?\n") | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 }
            $reasonClean = ($reasonLines -join "`n  ")
            if ($reasonClean.Length -gt 0) {
                $formattedIncParas += "- **$wLetter$wOptName**:`n  $reasonClean"
            } else {
                $formattedIncParas += "- **$wLetter$wOptName**"
            }
        }
    } else {
        $incParas = @()
        if ($incClean -match "(?:\r?\n){2,}") {
            $incParas = ($incClean -split "(?:\r?\n){2,}") | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 }
        } else {
            $incParas = ($incClean -split "\r?\n") | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 }
        }

        foreach ($p in $incParas) {
            if ($p -match "^(.*?)\s*[:\-]\s+(.+)$") {
                $optName = $matches[1].Trim()
                $explanation = $matches[2].Trim()
                $formattedIncParas += "- **$optName**:`n  $explanation"
            } elseif ($p -match "^>") {
                $formattedIncParas += $p
            } else {
                $formattedIncParas += "- $p"
            }
        }
    }
    $finalIncText = if ($formattedIncParas.Count -gt 0) { ($formattedIncParas -join "`n`n") } else { "- Không có phân tích bẫy bổ sung." }

    $tipsBlock = ""
    if ($q.TipsText -and $q.TipsText.Trim().Length -gt 0) {
        $tipsLines = ($q.TipsText.Trim() -split "\r?\n") | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 }
        $formattedTips = @()
        foreach ($tl in $tipsLines) {
            $formattedTips += "- $tl"
        }
        $headingTips = if ($metaJson.headingTips) { $metaJson.headingTips } else { "#### 🔑 Bí kíp thi cử & Trọng tâm ghi nhớ (Exam Tips & Key Takeaways):" }
        $tipsBlock = "$headingTips`n" + ($formattedTips -join "`n") + "`n"
    }

    $refLines = ($q.RefText -split "\r?\n") | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 }
    $formattedRefs = @()
    foreach ($r in $refLines) {
        if ($r -match "< back to result overview" -or $r -match "©" -or $r -match "Course Review -") { continue }
        if ($r -match "^(.*?)\s*-\s*(https?://\S+)\s*$") {
            $title = $matches[1].Trim()
            $url = $matches[2].Trim()
            $formattedRefs += ($metaJson.refPrefix + $title + "](" + $url + ")")
        } elseif ($r -match "^https?://") {
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
    if ($tipsBlock.Length -gt 0) {
        [void]$sb.AppendLine($tipsBlock)
    }
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
