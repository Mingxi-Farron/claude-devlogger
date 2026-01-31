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
**Date:** YYYY-MM-DD | **Start:** HH:MM | **End:** HH:MM | **Duration:** Xh Xm

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

## Conventions

### Midnight-Spanning Sessions
当 session 跨越午夜时（如 23:00 开始，01:00 结束），**不创建新 session**，而是：

1. **文件名保持原日期**：`2026-01-29-session.md`（以开始日期为准）
2. **Date 字段标注跨日**：`**Date:** 2026-01-29 ~ 01-30`
3. **End 时间标注 +1d**：`**End:** 00:50 (+1d)`
4. **TIME.md 日期用波浪线**：`2026-01-29~30`

示例：
```markdown
# Session #14
**Date:** 2026-01-29 ~ 01-30 | **Start:** 23:00 | **End:** 00:50 (+1d)
```

这样避免同一工作流被拆分成多个 session。

---

## Setup for New Projects

1. Run the setup script from devlog-kit
2. Update **Project Info** above
3. Clear TIME.md tracker (keep header row)
4. Start your first session with `/devlog-start`
