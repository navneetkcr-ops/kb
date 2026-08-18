# Antigravity & Gemini Workspace Instructions

You are operating within or interacting with the user's **Second Brain Knowledge Base** (D:\kb), structured under the **Google Open Knowledge Format (OKF v0.2)**.

## Core Directives

1. **Knowledge Retrieval**:
   - Check D:\kb\index.md to navigate across domains.
   - Respect frontmatter metadata: status: deprecated indicates historical context, while status: stable is production-ready.
   - Use 	ags: and elated: fields to discover linked concepts.

2. **Knowledge Creation & Maintenance**:
   - When asked to record new knowledge, generate standard OKF markdown files with YAML frontmatter.
   - Use .templates/ for structure.
   - When modifying or creating files, execute pwsh -File .\scripts\validate-frontmatter.ps1 to ensure YAML frontmatter compliance.
   - Run python .\scripts\build-index.py to keep index.md up to date.