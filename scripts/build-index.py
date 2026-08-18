#!/usr/bin/env python3
"""Build index.md from the knowledge base directory structure.

Scans all domain folders and generates a navigation index
by reading YAML frontmatter from each concept file.
"""

import os
import re
from pathlib import Path
from datetime import datetime, timezone

KB_ROOT = Path(__file__).parent.parent
DOMAINS = ["programming", "devops", "finance", "health", "learning", "projects", "life", "inbox"]
SKIP_DIRS = {".templates", ".meta", ".github", ".obsidian", ".git", "scripts"}


def extract_frontmatter(filepath: Path) -> dict:
    """Extract YAML frontmatter fields from a markdown file."""
    content = filepath.read_text(encoding="utf-8")
    match = re.match(r'^---\s*\n(.*?)\n---', content, re.DOTALL)
    if not match:
        return {}
    
    fm = {}
    for line in match.group(1).split("\n"):
        if ":" in line and not line.startswith(" ") and not line.startswith("-"):
            key, _, value = line.partition(":")
            fm[key.strip()] = value.strip().strip('"')
    return fm


def build_index() -> str:
    """Generate the index.md content."""
    timestamp = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    
    lines = [
        "---",
        "type: index",
        'title: "Knowledge Base Index"',
        'description: "Auto-generated navigation hub for the personal knowledge base"',
        f"timestamp: {timestamp}",
        "status: stable",
        "---",
        "",
        "# Knowledge Base Index",
        "",
        "Welcome to the personal knowledge base. This index is auto-generated.",
        "",
    ]
    
    for domain in DOMAINS:
        domain_path = KB_ROOT / domain
        if not domain_path.is_dir():
            continue
        
        # Read domain index for description
        domain_index = domain_path / "index.md"
        domain_fm = extract_frontmatter(domain_index) if domain_index.exists() else {}
        domain_title = domain_fm.get("title", domain.title())
        domain_desc = domain_fm.get("description", "")
        
        lines.append(f"## [{domain_title}]({domain}/index.md)")
        if domain_desc:
            lines.append(f"{domain_desc}")
        lines.append("")
        
        # List concepts by subfolder
        for subfolder in sorted(domain_path.iterdir()):
            if not subfolder.is_dir() or subfolder.name.startswith("."):
                continue
            
            concepts = sorted(subfolder.glob("*.md"))
            if not concepts:
                continue
            
            lines.append(f"### {subfolder.name.title()}")
            for concept_file in concepts:
                fm = extract_frontmatter(concept_file)
                title = fm.get("title", concept_file.stem.replace("-", " ").title())
                desc = fm.get("description", "")
                rel_path = concept_file.relative_to(KB_ROOT).as_posix()
                entry = f"- [{title}]({rel_path})"
                if desc:
                    entry += f" — {desc}"
                lines.append(entry)
            lines.append("")
    
    lines.extend([
        "## Meta",
        "",
        "- [Templates](.templates/) — Reusable concept templates",
        "- [AI Instructions](.meta/) — How AI tools should use this KB",
        "- [Change Log](log.md) — History of additions and changes",
        "",
    ])
    
    return "\n".join(lines)


if __name__ == "__main__":
    index_content = build_index()
    index_path = KB_ROOT / "index.md"
    index_path.write_text(index_content, encoding="utf-8")
    print(f"Updated {index_path}")
