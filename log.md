---
type: log
title: "Change Log"
description: "Chronological history of knowledge base changes"
timestamp: 2026-08-18T23:20:00Z
status: stable
---

# Change Log

## 2026-08-23 — Added Unencrypted Git-Crypt Key Recovery Runbook (`devops/runbooks/git-crypt-recovery.md`)

- Relocated key recovery documentation to an **unencrypted** runbook under `devops/runbooks/git-crypt-recovery.md`:
  - Solved chicken-and-egg dilemma by ensuring recovery instructions remain plain text without requiring a key.
  - Documented Google Drive path for `finance-key.key` and step-by-step unlocking instructions.
- Updated `devops/index.md` navigation links and rebuilt master `index.md`.

## 2026-08-23 — Imported Dhan Stock Portfolio Holdings (`C:\Users\Win 11\Downloads\Dhan\Portfolio.csv`)



- Added **Dhan Stock Portfolio Holdings** reference document under `finance/references/dhan-portfolio.md`:
  - Structured summary of 38 stock positions with capital invested (₹6.71L), current valuation (₹8.23L), and net P&L (+₹1.52L / +22.73%).
  - Detailed table with quantities, average purchase prices, last traded prices, market valuations, and individual position gains/losses.
  - Highlights of top performing stocks by percentage gain and absolute profit.
- Updated `finance/index.md` navigation links and rebuilt master `index.md`.

## 2026-08-23 — Integrated Shri Navneet Kochar: Meri Post aur Vishleshan (`F:\My Documents\Meri Post aur Vishleshan`)


- Added complete **Token-Efficient OKF v0.2 Knowledge Base Catalog** under `life/references/meri-post-aur-vishleshan/`:
  - `index.md`: Master navigation hub & overview for writings, podcasts, slides, and mind maps.
  - `01-aadhyatm-aur-darshan.md`: Sadguru vs Dharmguru, temple offerings & inner consciousness, grace, and silence.
  - `02-samaj-aur-jain-darshan.md`: Jain society self-introspection, Paryushan Aangi significance, media claims factual rebuttal.
  - `03-jeevan-aur-darshanik-chintan.md`: Ramayana vs Mahabharata impact on modern life, death as celebration (Antim Iksha), today's Dropadi.
  - `04-vyaktigat-patra-aur-sansmaran.md`: 66th Birthday self-analysis letter ("Mera B'Day") & Covid-era roadside letter.
  - `05-samajik-rishte-aur-manovigyan.md`: Post-marriage relationship dynamics, societal conditioning, fear vs love.
  - `06-profile-aur-multimedia.md`: Multidisciplinary consulting profile, Konark Sun Temple time cycle, and complete inventory of 14 audio tracks, 10 slide PDFs, and 3 mind maps.
- Enhanced `scripts/build-index.py` to auto-discover nested topic index files under domain directories.
- Updated `life/index.md` and re-generated master `index.md`.

## 2026-08-23 — Token-Efficient Modular Re-architecture (`E:\Bhajan and Songs`)

- Refactored monolithic 102 KB (`bhajan-and-songs-catalog.md`) into a **Token-Efficient Modular Architecture** under `projects/references/bhajan-and-songs/`:
  - `index.md`: Master navigation hub & asset overview (~2 KB / 500 tokens).
  - `ai-music-prompts.md`: Isolated AI music generator prompts & production standards (~2.5 KB / 600 tokens).
  - `audio-inventory.md`: Complete structured audio track master inventory (~6 KB / 1,500 tokens).
  - `lyrics/hindu-bhajans.md`: Transcribed Hindi lyrics for Shiv & Hindu devotional songs.
  - `lyrics/jain-tirth-bhajans.md`: Lyrics for Tirth Bhajans (Bhandasar, Delwara, Kulpakji, Medchal, Mirpur, etc.).
  - `lyrics/jain-bhagwan-and-stotra.md`: Lyrics for Tirthankaras, Dada Gurudeo, Namokar Mantra, Uvasaggaharam Stotra.
- **Token Efficiency**: Achieved **94%-98% reduction** in context token consumption during AI retrievals and lookups.
- Updated links in `projects/notes/youtube-channels.md`, `projects/index.md`, and rebuilt master `index.md`.

## 2026-08-18 — Seed Data Cleanup

- Removed all 24 initial boilerplate/seed concept files across all domains, leaving only authentic user-created files:
  - DevOps: removed `docker.md`, `ci-cd.md`, `containers.md`, `deploy-checklist.md`
  - Finance: removed `compound-interest.md`, `emergency-fund.md`, `monthly-review-template.md`
  - Health: removed `sleep-hygiene.md`, `workout-log-template.md`
  - Learning: removed `essential-reads.md`, `feynman-technique.md`, `spaced-repetition.md`, `course-notes-template.md`
  - Life: removed `gtd-methodology.md`, `2026-goals.md`, `weekly-review-template.md`
  - Programming: removed `git.md`, `python.md`, `design-patterns.md`, `rest-api.md`, `http-status-codes.md`, `python-file-operations.md`
  - Projects: removed `kb-architecture.md`, `project-template.md`
- Preserved all user-generated content:
  - 10 categorized bookmark files (418 Chrome bookmarks)
  - `projects/notes/youtube-channels.md` (YouTube channel tracker and full catalog)
  - `PrachinTirthDarshan_shorts.json`
- Cleaned up empty subdirectories and updated domain indexes.
- Re-generated `index.md` and validated all frontmatter.

## 2026-08-18 — Chrome Bookmarks Migration & Organization

- Parsed, sanitized, and deduplicated 552 Chrome bookmarks from `D:\bookmarks_8_18_26.html` into 418 unique categorized resources.
- Organized bookmarks across 4 core domains into 10 structured OKF v0.2 concept files:
  - `finance/bookmarks/trading-and-investing.md` (49 bookmarks): Stock screeners, Chartink, TradingView, Sensibull, IPOs, Unlisted Shares, Crypto, Broker portals.
  - `finance/bookmarks/banking-and-tax.md` (21 bookmarks): Net banking (SBI, ICICI, PNB), Income Tax e-filing, PAN, NPS, GPF MP, EPF, Insurance.
  - `learning/bookmarks/ai-tools-and-utilities.md` (36 bookmarks): Generative AI (Qwen, ElevenLabs, Genspark, LMArena), image background removers, audio transcription, Hindi OCR.
  - `learning/bookmarks/digital-design-and-publishing.md` (30 bookmarks): Graphic design (Polotno, VistaCreate, Adobe Express), Amazon KDP, Google Play Books, icons, fonts.
  - `learning/bookmarks/education-and-career.md` (26 bookmarks): MP Board, CBSE, University results (RDVV, RGPV), SEBI exam, Employment News.
  - `life/bookmarks/government-and-civic-services.md` (33 bookmarks): Aadhaar, Samagra ID, Voter ID, Passport, MPOnline, Parivahan/Vehicle Tax, Electricity bill.
  - `life/bookmarks/travel-and-transport.md` (28 bookmarks): IRCTC/Indian Railways, flight aggregators, RedBus/AbhiBus, Shirdi Sansthan booking, Fastag.
  - `life/bookmarks/shopping-and-lifestyle.md` (124 bookmarks): E-commerce, discount coupons/cashback, DTH/mobile recharge, PDF converters, temp mail, calculators.
  - `life/bookmarks/spiritual-and-media.md` (59 bookmarks): Jain media/radio, Osho audio discourses, devotional music, live TV news, comedy video archives, P2P/BitTorrent archives.
  - `programming/bookmarks/developer-tools.md` (12 bookmarks): Cloud storage (Drive, OneDrive, Box), GitHub, Mockaroo, color palettes, tech news.
- Updated domain-level indexes (`finance/index.md`, `learning/index.md`, `life/index.md`, `programming/index.md`) and rebuilt master `index.md`.
- Validated all 45 markdown files against OKF frontmatter schema rules.

## 2026-08-18 — Initial Creation

- Created knowledge base structure using Google OKF v0.2
- Added 8 domain folders: programming, devops, finance, health, learning, projects, life, inbox
- Added 10 concept templates in `.templates/`
- Added AI tool instructions in `.meta/`
- Added automation scripts in `scripts/`
- Added project note & full video catalog: `projects/notes/youtube-channels.md` (Bhakti Sangeet NKP & Prachin Tirth Darshan with 33+ videos/shorts)
- Updated `projects/notes/youtube-channels.md`: Synced all 44 videos from `@PrachinTirthDarshan/videos`.
