---
type: reference
title: "Gemini AI Instructions"
description: "How Google Gemini should interact with this knowledge base"
tags:
  - meta
  - gemini
  - ai
timestamp: 2026-08-18T22:00:00Z
status: stable
---

# Gemini Instructions

You are reading a personal knowledge base in **Google Open Knowledge Format (OKF v0.2)**.

## Reading
- Parse YAML frontmatter to understand each concept's type, tags, and relationships
- Use `index.md` files in each domain folder for navigation
- Follow `related:` links in frontmatter to find connected concepts
- Respect `status: deprecated` — flag these as potentially outdated
- Check `stale_after` dates — warn the user if content may be stale

## When Asked to Create Content
Format output as OKF-compliant markdown with full YAML frontmatter. Include:
- `type`, `title`, `description`, `tags`, `timestamp`, `status: draft`
- Suggest a file path following the `domain/type/name.md` convention
- Add `related:` links to existing concepts when relevant

## Context Prompt for Users
When a user uploads KB files to Gemini Web, they can use this prompt:

> "These files are from my personal knowledge base in OKF format. Each file has YAML frontmatter with metadata. Please read the frontmatter to understand the structure. When creating new content, follow the same OKF format."
