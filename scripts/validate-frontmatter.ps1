<#
.SYNOPSIS
    Validates OKF frontmatter in all markdown files.
.DESCRIPTION
    Checks that all .md files (except templates, meta, agents, and README) have valid
    YAML frontmatter with at least a 'type' field.
#>

$ErrorActionPreference = "Stop"

$kbRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$errors = 0
$checked = 0

# Find all .md files, excluding system/dotfolders and non-concept root files
$files = Get-ChildItem -Path $kbRoot -Recurse -Filter "*.md" | Where-Object {
    $_.FullName -notlike "*\.templates\*" -and
    $_.FullName -notlike "*\.meta\*" -and
    $_.FullName -notlike "*\.github\*" -and
    $_.FullName -notlike "*\.obsidian\*" -and
    $_.FullName -notlike "*\.agents\*" -and
    $_.Name -ne "README.md" -and
    $_.Name -ne "AGENTS.md" -and
    $_.Name -ne "GEMINI.md"
}

foreach ($file in $files) {
    $checked++
    $content = Get-Content $file.FullName -Raw
    
    # Check for frontmatter delimiters
    if ($content -notmatch '^---\s*\n') {
        Write-Host "  MISSING frontmatter: $($file.FullName)" -ForegroundColor Red
        $errors++
        continue
    }
    
    # Check for 'type' field
    if ($content -notmatch '(?m)^type:\s*\S+') {
        Write-Host "  MISSING 'type' field: $($file.FullName)" -ForegroundColor Red
        $errors++
        continue
    }
    
    # Extract type value and validate
    $typeMatch = [regex]::Match($content, '(?m)^type:\s*(\S+)')
    if ($typeMatch.Success) {
        $typeValue = $typeMatch.Groups[1].Value
        $validTypes = @("concept", "cheatsheet", "snippet", "runbook", "bookmark", 
                        "note", "decision", "goal", "reference", "log-entry", 
                        "index", "log")
        if ($typeValue -notin $validTypes) {
            Write-Host "  UNKNOWN type '$typeValue': $($file.FullName)" -ForegroundColor Yellow
        }
    }
}

Write-Host ""
if ($errors -eq 0) {
    Write-Host "All $checked files have valid OKF frontmatter." -ForegroundColor Green
} else {
    Write-Host "$errors error(s) found in $checked files." -ForegroundColor Red
    exit 1
}