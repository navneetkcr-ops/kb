---
type: reference
title: "AI Agent Instructions"
description: "Universal instructions for AI agents consuming this knowledge base"
tags:
  - meta
  - ai
  - instructions
timestamp: 2026-08-18T22:00:00Z
status: stable
---

# AI Agent Instructions

This is a personal knowledge base built using the **Google Open Knowledge Format (OKF v0.2)**.

## How to Read This Knowledge Base

1. **Start at `index.md`** in the root — it maps all domains and their contents
2. **Each `.md` file is a "concept"** — a self-contained unit of knowledge
3. **YAML frontmatter** at the top of each file contains structured metadata:
   - `type`: The kind of concept (concept, cheatsheet, snippet, runbook, etc.)
   - `tags`: Keywords for filtering and discovery
   - `status`: Lifecycle state (draft, stable, review, deprecated)
   - `related`: Cross-links to other concepts (paths without `.md` extension)
   - `stale_after`: Date after which content should be reviewed for freshness
4. **Directory structure** is `domain/type/concept-name.md`
5. **Cross-links** between concepts use relative markdown links

## How to Write to This Knowledge Base

1. Use templates from `.templates/` as starting points
2. Always include YAML frontmatter with at least `type` field
3. Place files in the correct `domain/type/` directory
4. Use kebab-case for filenames: `my-concept-name.md`
5. Add `related:` links to connect to existing concepts
6. Set `status: draft` for new content, `stable` for reviewed content
7. Set `timestamp` to the current ISO 8601 date
8. Update `log.md` with a brief entry about what was added

## Concept Types

| Type | Description | Typical Location |
|:-----|:------------|:-----------------|
| `concept` | Explanatory knowledge about a topic | `domain/concepts/` |
| `cheatsheet` | Quick-reference commands or syntax | `domain/cheatsheets/` |
| `snippet` | Reusable code fragments | `domain/snippets/` |
| `runbook` | Step-by-step operational procedures | `domain/runbooks/` |
| `bookmark` | Curated links with annotations | `domain/bookmarks/` |
| `note` | Free-form observations or meeting notes | `domain/notes/` |
| `decision` | Architecture/design decision records | `domain/decisions/` |
| `goal` | Personal or project goals with tracking | `domain/goals/` |
| `reference` | Lookup tables, status codes, specs | `domain/references/` |
| `log-entry` | Timestamped journal or changelog entry | `domain/logs/` |
