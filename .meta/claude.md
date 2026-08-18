---
type: reference
title: "Claude AI Instructions"
description: "How Anthropic Claude should interact with this knowledge base"
tags:
  - meta
  - claude
  - ai
timestamp: 2026-08-18T22:00:00Z
status: stable
---

# Claude Instructions

You are reading a personal knowledge base in **Google Open Knowledge Format (OKF v0.2)**.

## Reading
- Parse YAML frontmatter between `---` delimiters at the top of each file
- The `type` field tells you the category: concept, cheatsheet, snippet, runbook, etc.
- Use `tags` for filtering and `related` for cross-referencing
- Check `status` — `deprecated` means outdated, `draft` means unreviewed

## When Writing
- Always include YAML frontmatter with at least: `type`, `title`, `description`, `tags`, `timestamp`, `status`
- Use `status: draft` for new content
- Follow kebab-case naming: `my-topic-name.md`
- Place in correct directory: `domain/type/name.md`

## Claude Desktop MCP Setup
For direct GitHub read/write access, add to `claude_desktop_config.json`:
```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_token"
      }
    }
  }
}
```

## Claude Code / Claude CLI
When working in the `kb/` directory, read `AGENTS.md` for full instructions.
