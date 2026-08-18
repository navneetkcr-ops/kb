<#
.SYNOPSIS
    Creates a new OKF concept from a template.
.DESCRIPTION
    Creates a new markdown file with OKF-compliant YAML frontmatter
    in the correct domain/type directory.
.PARAMETER Type
    The concept type: concept, cheatsheet, snippet, runbook, bookmark, note, decision, goal, reference, log-entry
.PARAMETER Domain
    The domain folder: programming, devops, finance, health, learning, projects, life
.PARAMETER Name
    The concept name in kebab-case (e.g., "my-new-topic")
.EXAMPLE
    .\scripts\new-concept.ps1 -Type concept -Domain programming -Name "kubernetes-networking"
#>
param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("concept", "cheatsheet", "snippet", "runbook", "bookmark", "note", "decision", "goal", "reference", "log-entry")]
    [string]$Type,
    
    [Parameter(Mandatory=$true)]
    [ValidateSet("programming", "devops", "finance", "health", "learning", "projects", "life", "inbox")]
    [string]$Domain,
    
    [Parameter(Mandatory=$true)]
    [string]$Name
)

$ErrorActionPreference = "Stop"

# Map type to subfolder
$typeToFolder = @{
    "concept"    = "concepts"
    "cheatsheet" = "cheatsheets"
    "snippet"    = "snippets"
    "runbook"    = "runbooks"
    "bookmark"   = "bookmarks"
    "note"       = "notes"
    "decision"   = "decisions"
    "goal"       = "goals"
    "reference"  = "references"
    "log-entry"  = "logs"
}

$subfolder = $typeToFolder[$Type]
$kbRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$targetDir = Join-Path $kbRoot $Domain $subfolder
$targetFile = Join-Path $targetDir "$Name.md"

# Check if file already exists
if (Test-Path $targetFile) {
    Write-Error "File already exists: $targetFile"
    exit 1
}

# Create directory if needed
if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
}

# Check for template
$templateFile = Join-Path $kbRoot ".templates" "$Type.md"
if (Test-Path $templateFile) {
    $content = Get-Content $templateFile -Raw
    # Replace timestamp placeholder
    $timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
    if ($content -match 'timestamp: $') {
        $content = $content -replace 'timestamp: $', "timestamp: $timestamp"
    } elseif ($content -match 'timestamp:') {
        $content = $content -replace 'timestamp:.*', "timestamp: $timestamp"
    }
} else {
    # Fallback: create minimal frontmatter
    $timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
    $titleCase = ($Name -replace '-', ' ').Substring(0,1).ToUpper() + ($Name -replace '-', ' ').Substring(1)
    $content = @"
---
type: $Type
title: "$titleCase"
description: ""
tags: []
timestamp: $timestamp
status: draft
---

# $titleCase


"@
}

$content | Out-File -FilePath $targetFile -Encoding utf8 -NoNewline

Write-Host "Created: $targetFile" -ForegroundColor Green
Write-Host "Type: $Type | Domain: $Domain" -ForegroundColor Cyan
