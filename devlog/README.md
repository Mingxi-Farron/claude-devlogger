# Project Dev Log

## Project Info
- **Name:** [PROJECT_NAME]
- **Tech Stack:** [e.g., Next.js, Unreal Engine 5.7, Python]
- **Description:** [One-line project description]
- **Started:** [YYYY-MM-DD]
- **Screenshots:** [will be configured on first session, or "none" if not needed]

---

## Folder Structure
```
devlog/
├── README.md       (this file - project info)
├── TIME.md         (time tracker)
├── logs/           (session logs)
│   └── YYYY-MM-DD-session.md
└── media/          (screenshots, recordings)
    └── YYYY-MM-DD/
```

---

## Session Log Format

Each session log (`logs/YYYY-MM-DD-session.md`) contains:

```markdown
# Session #X
**Date:** YYYY-MM-DD | **Start:** HH:MM | **Duration:** Xh Xm

## Goals
- [ ] Goal 1
- [ ] Goal 2

## Plan
- Approach step 1
- Approach step 2

## Problems & Solutions
### Problem: [description]
- **Attempted:** [what was tried]
- **Result:** Failed/Success
- **Why:** [explanation]

## Milestones
- [x] Milestone reached
- [ ] Milestone pending

## Screenshots
- `HH-MM-SS` - description of what this captures

## Conclusion
- Summary of progress
- Carry-over to next session
```

---

## Setup for New Projects

1. Run the setup script from devlog-kit
2. Update **Project Info** above
3. Clear TIME.md tracker (keep header row)
4. Start your first session with `/devlog-start`
