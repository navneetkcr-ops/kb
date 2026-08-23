# AI Agent Knowledge Base Instructions (AGENTS.md)

This repository (D:\kb) is the user's **Second Brain Knowledge Base**, structured using the **Google Open Knowledge Format (OKF v0.2)**.

Whenever you are interacting with the user or performing development, planning, or research tasks, follow these operational rules:

---

## 1. Always Refer to the Knowledge Base
- When answering questions, diagnosing errors, choosing architectural patterns, or recalling preferences, **consult D:\kb first**.
- **Navigation**: Start at index.md to discover domains and topics.
- **Lookup by domain**:
  - programming/: Code conventions, REST APIs, design patterns, cheatsheets, snippets.
  - devops/: CI/CD, containers, runbooks, deployment checklists.
  - inance/: Personal finance principles, review templates.
  - health/: Health, fitness, and sleep guidelines.
  - learning/: Spaced repetition, Feynman technique, curated reading lists.
  - projects/: Architecture decisions (ADRs) and project blueprints.
  - life/: Productivity (GTD), goals, and weekly reviews.
  - inbox/: Staging captures awaiting categorization.

---

## 2. Storing & Updating Knowledge
When the user asks you to save, record, summarize, or capture new information:
1. **Determine the Domain & Subfolder**:
   - domain/concepts/ for explanatory notes and deep-dives.
   - domain/cheatsheets/ for command lists and syntax summaries.
   - domain/snippets/ for reusable code snippets.
   - domain/runbooks/ for step-by-step procedures and checklists.
   - domain/bookmarks/ for annotated resource links.
   - domain/notes/ for meeting minutes, summaries, templates.
   - domain/decisions/ for Architecture Decision Records (ADRs).
   - domain/goals/ for goal tracking.
   - domain/references/ for lookup tables and specifications.
2. **Format as OKF v0.2**:
   - Every file must start with valid YAML frontmatter between --- delimiters.
   - Minimum required field: 	ype: <concept|cheatsheet|snippet|runbook|bookmark|note|decision|goal|reference>.
   - Include 	itle, description, 	ags, 	imestamp (ISO 8601), and status (draft or stable).
   - Use kebab-case for file names (my-new-topic.md).
3. **Update Index & Change Log**:
   - Add a brief entry in log.md summarizing the addition.
   - Run python scripts/build-index.py or update index.md.

---

## 3. Token-Efficient Knowledge Base Architecture
To minimize token consumption and maximize context efficiency for AI tools reading this KB:
1. **Granular Modularization (Progressive Disclosure)**:
   - **Never create massive monolithic files** (> 300-500 lines or > 10 KB).
   - Split large topics, catalogs, or song lists into a dedicated subfolder (`domain/type/topic/index.md`, `topic/sub-topic.md`).
2. **Rich Frontmatter Summaries**:
   - Write informative `title` and `description` fields in YAML frontmatter. AI tools should be able to answer overview queries directly from `index.md` without loading full child files into context.
3. **Strict YAML Escaping**:
   - Double-escape all backslashes (`\\`) in YAML double-quoted strings or wrap paths in single quotes (`'...'`).
4. **Targeted Reading**:
   - Use line ranges (`StartLine`/`EndLine`) or `grep_search` instead of reading entire large files.