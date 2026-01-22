# Project Dev Log

## Project Info
- **Name:** Water2026
- **Tech Stack:** Unreal Engine 5.7
- **Description:** Water fluid simulation demo focusing on realistic water behavior and physics
- **Started:** 2025-12-16
- **Screenshots:** devlog/media/

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

## Progress (In Session)

### Feature/Task Name
Claude formats based on content type:
- Bullet points for general notes
- Numbered lists for SOPs/procedures
- Free-form for quotes, references, code blocks

![screenshot description](../media/YYYY-MM-DD/HH-MM-SS.png)

## Problems & Solutions
### Problem: [description]
- **Attempted:** [what was tried]
- **Result:** Failed/Success
- **Why:** [explanation]

## Milestones
- [x] Milestone reached
- [ ] Milestone pending

## To-Do (Next Session)
- [ ] Carry-over items

## Conclusion
- Summary of progress
```

**Note:** Screenshots are inserted inline within the Progress section, directly after related documentation.

---

## Setup for New Projects

1. Run the setup script from devlog-kit
2. Update **Project Info** above
3. Clear TIME.md tracker (keep header row)
4. Start your first session with `/devlog-start`
