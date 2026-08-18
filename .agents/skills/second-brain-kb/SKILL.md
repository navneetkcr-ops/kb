---
name: second-brain-kb
description: >-
  Always refer to and search the user's personal Second Brain knowledge base at D:\kb when answering questions, researching topics, retrieving development conventions, or capturing new knowledge.
---

# Second Brain Knowledge Base Skill

Use this skill to interact with the user's centralized Second Brain at D:\kb.

## When to Activate
- The user asks technical, architectural, or domain-specific questions that may be answered in their KB.
- The user requests to store, capture, remember, or document new insights, snippets, cheatsheets, or decisions.
- The user asks about personal goals, routines, or past project decisions.

## Knowledge Base Layout (D:\kb)
- index.md: Navigation hub with an index of all domains.
- programming/: Concepts, cheatsheets, snippets, and references.
- devops/: CI/CD, containerization, and runbooks.
- inance/: Personal finance concepts, reviews, and templates.
- health/: Health, sleep hygiene, and workout tracking.
- learning/: Spaced repetition, Feynman technique, curated bookmarks.
- projects/: Architecture decisions (ADRs) and project specs.
- life/: GTD productivity workflows and goal tracking.
- inbox/: Fast capture bucket.

## Operating Procedures

### 1. Reading from KB
1. Scan D:\kb\index.md or search within D:\kb\ for relevant keywords.
2. Read the corresponding .md files and incorporate their contents into your responses.

### 2. Writing to KB
1. Pick the matching domain and subfolder (concepts, cheatsheets, snippets, unbooks, 
otes, decisions).
2. Write the file with OKF YAML frontmatter (	ype:, 	itle:, description:, 	ags:, 	imestamp:).
3. Update D:\kb\log.md.
4. Run python D:\kb\scripts\build-index.py or update D:\kb\index.md.