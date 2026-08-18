---
type: reference
title: "CLI AI Tool Instructions"
description: "How CLI-based AI tools should interact with this knowledge base"
tags:
  - meta
  - cli
  - ai
timestamp: 2026-08-18T22:00:00Z
status: stable
---

# CLI AI Tool Instructions

For Antigravity (agy), Gemini CLI, aider, and similar tools.

## Working with This KB

1. **Read `AGENTS.md` first** for the full specification
2. **Navigate via `index.md`** files — each domain has one
3. **Use templates** from `.templates/` when creating new concepts
4. **Update `log.md`** when adding or significantly modifying content

## Quick Commands

```bash
# Create a new concept using the PowerShell helper
.\scripts\new-concept.ps1 -Type concept -Domain programming -Name "topic-name"

# Validate all frontmatter
.\scripts\validate-frontmatter.ps1

# Find all concepts with a specific tag
Get-ChildItem -Recurse -Filter *.md | Select-String -Pattern "^  - kubernetes"

# Find all stale content
Get-ChildItem -Recurse -Filter *.md | Select-String -Pattern "stale_after:"
```

## Directory Convention
```
domain/          → programming, devops, finance, health, learning, projects, life, inbox
  type/          → concepts, cheatsheets, snippets, runbooks, bookmarks, notes, decisions, goals, references
    name.md      → kebab-case filename
```
