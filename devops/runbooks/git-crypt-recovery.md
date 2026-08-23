---
type: runbook
title: "Git-Crypt Key Recovery & Finance Domain Unlocking"
description: "Unencrypted recovery guide and step-by-step instructions for retrieving the finance-key.key from Google Drive to unlock encrypted financial records in D:\\kb\\finance."
tags:
  - devops
  - security
  - git-crypt
  - recovery
  - runbook
  - google-drive
timestamp: 2026-08-23T11:18:49+05:30
status: stable
---

# Git-Crypt Key Recovery & Finance Domain Unlocking

This runbook is intentionally stored **unencrypted** so it can be read on any machine after cloning the repository without requiring an encryption key.

## Secret Key Backup Location

The symmetric key required to decrypt `D:\kb\finance\` is backed up in Google Drive:

- **Key File Name**: `finance-key.key`
- **Cloud Path**: Google Drive (`Google Drive / Backups / Knowledge Base Keys / finance-key.key`)
- **Protected Paths in Repository**: `finance/**`

---

## Step-by-Step Recovery & Unlock Procedure

If you clone this Knowledge Base on a new device or fresh environment:

### 1. Download Key File from Google Drive
Download `finance-key.key` from your Google Drive backup location to the root of the knowledge base directory (`D:\kb\finance-key.key`).

### 2. Verify git-crypt Installation
Ensure `git-crypt` is installed and available in your environment path:
```powershell
git-crypt --version
```

### 3. Unlock the Finance Domain
In terminal, navigate to the knowledge base root (`D:\kb`) and execute:
```bash
git-crypt unlock finance-key.key
```

### 4. Confirm Decryption Success
Verify that files in `finance/` (such as `finance/references/dhan-portfolio.md` and `finance/index.md`) are readable plain Markdown text.
