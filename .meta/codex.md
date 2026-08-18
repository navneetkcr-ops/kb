---
type: reference
title: "Codex AI Instructions"
description: "How OpenAI Codex should interact with this knowledge base"
tags:
  - meta
  - codex
  - openai
  - ai
timestamp: 2026-08-18T22:00:00Z
status: stable
---

# Codex Instructions

This repository is a personal knowledge base using **Google Open Knowledge Format (OKF v0.2)**.

## Key Facts
- Every `.md` file has YAML frontmatter with structured metadata
- `type` is the only required field — it defines the concept category
- Directory layout: `domain/type/concept-name.md`
- Cross-links in `related:` field use paths without `.md` extension

## When Modifying
- Preserve existing YAML frontmatter — only add/modify relevant fields
- Update `timestamp` to current date when editing
- Add entries to `log.md` for significant changes
- Follow existing naming and formatting conventions
