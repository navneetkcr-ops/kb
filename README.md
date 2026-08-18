---
type: reference
title: "Knowledge Base — Second Brain"
description: "Personal knowledge base built on Google Open Knowledge Format (OKF v0.2)"
tags:
  - meta
  - documentation
timestamp: 2026-08-18T22:00:00Z
status: stable
---

# 🧠 Personal Knowledge Base

A comprehensive personal knowledge base ("second brain") built using the [Google Open Knowledge Format (OKF)](https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing). Designed to be consumed by humans and AI agents alike.

## What is OKF?

OKF is a vendor-neutral, open specification from Google Cloud. Every piece of knowledge is:
- A **Markdown file** with **YAML frontmatter** (only `type` is required)
- Organized in a **directory hierarchy** (the "knowledge bundle")
- **Cross-linked** via standard markdown links to form a knowledge graph

## Structure

```
kb/
├── programming/     # Software development concepts, cheatsheets, snippets
├── devops/          # CI/CD, containers, infrastructure, runbooks
├── finance/         # Personal finance concepts and tracking
├── health/          # Health, fitness, and wellness
├── learning/        # Learning techniques, bookmarks, course notes
├── projects/        # Project decisions and documentation
├── life/            # Goals, productivity, life management
├── inbox/           # Quick capture staging area
├── .templates/      # Reusable OKF concept templates
├── .meta/           # AI tool instructions
├── scripts/         # Automation scripts
└── index.md         # Navigation hub
```

## Frontmatter Schema

Every `.md` file uses this YAML frontmatter (OKF v0.2):

```yaml
---
type: concept          # REQUIRED: concept | note | cheatsheet | snippet |
                       #   runbook | bookmark | log-entry | decision | goal | reference
title: "Title"         # Display name
description: "Summary" # One-line summary for AI previews
tags: [tag1, tag2]     # Keywords for discovery
timestamp: 2026-08-18T22:00:00Z  # Last updated (ISO 8601)
status: draft          # draft | stable | review | deprecated
stale_after: 2027-02-18         # Review date
related:               # Cross-links (concept IDs = file paths without .md)
  - domain/subfolder/concept-name
---
```

## Using with AI Tools

### CLI AI Tools (can read AND write)

| Tool | Usage |
|:-----|:------|
| **Antigravity (agy)** | Open `D:\kb` as workspace. AI reads/writes directly. |
| **Claude Code** | `claude "Read my KB and add a concept about X"` |
| **Gemini CLI** | `gemini "Create a cheatsheet for Docker Compose in devops/cheatsheets/"` |
| **Codex CLI** | Point to the repo as context source |
| **aider** | `aider --read programming/concepts/*.md` |

### Web AI Tools (read-only — copy/paste workflow)

| Tool | How to Use |
|:-----|:-----------|
| **Gemini Web** | Upload files or paste content as context |
| **Claude.ai** | Add files to Project Knowledge, or paste into chat |
| **ChatGPT** | Upload files as attachments |

**To capture output from web AI**, ask it to format as OKF:

```
Format your response as an OKF concept:
---
type: concept
title: "[topic]"
description: "[one-line summary]"
tags: [relevant, tags]
timestamp: [today's date]T00:00:00Z
status: draft
---
# [Title]
[Your content here]
```

Then paste the output into `inbox/` and later move it to the correct domain folder.

### Claude Desktop (can read AND write via MCP)

Add to `%APPDATA%\Claude\claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_token_here"
      }
    }
  }
}
```

## Adding New Knowledge

1. Copy a template from `.templates/`
2. Fill in the frontmatter and content
3. Save to the appropriate `domain/type/` folder
4. Commit and push

Or use the PowerShell helper:
```powershell
.\scripts\new-concept.ps1 -Type concept -Domain programming -Name "my-topic"
```

## License

Personal knowledge base. Content is for private reference.
