# Start Devlog Session

## Natural Language Triggers

This command MUST be invoked when the user says any of these (case-insensitive):
- "start logging" / "start session" / "begin session"
- "开始记录" / "开始工作" / "新会话"
- "let's start" (in context of work/session)
- Or directly: `/devlog-start`

**When triggered, execute the FULL workflow below. Do NOT skip any step.**

---

Read `devlog/README.md` to get:
1. Project name and info
2. Screenshots folder path (if configured)
3. Current session count from `devlog/TIME.md`
4. Total cumulative time

**Fallback if files missing:**
- If README.md not found: Use "Unnamed Project" and warn user
- If TIME.md not found: Start at Session #1, cumulative = 0h

---

## Pre-flight Checks

**1. Check for unclosed session:**
Before creating a new session, check `devlog/logs/` for today's file:
- If `YYYY-MM-DD-session.md` exists AND has NO `**End:**` field:
  - ⚠️ **STOP**: "An incomplete session exists for today. Run `/devlog-end` first, or I'll create `-session-2.md`"
  - Ask user: "Close previous session first, or start a new one?"
- If exists AND has `**End:**` field: Safe to create `-session-2.md`

**2. Pull To-Do from last session:**

Find the most recent session log file in `devlog/logs/` (sort by filename, take latest).
If a previous session exists:
1. Read the file and look for to-do section (case-insensitive search):
   - `## To-Do` or `## TODO`
   - `## Next Session` or `## Next Steps`
   - `## Carry-Over`
2. If found, present those items to the user before asking for goals

If no previous session or no to-do items found, skip this step.

---

## Screenshot Setup (first session or on request)

If this is the first session (no prior logs in `devlog/logs/`) AND screenshots path is not set or is "none":
1. Ask: "Do you want to set up screenshot capture? I can handle the full setup automatically."
2. If yes, execute the setup from `.claude/commands/devlog-screenshot-setup.md`
3. Run all commands, create files, configure MCP
4. Confirm setup complete
5. **If setup fails**: Log warning, continue without screenshots

User can also trigger this anytime by saying "set up screenshots" or "configure screenshot capture".

If screenshots path is already set to `devlog/media/`, skip this step.

---

## Get Current Time (MANDATORY)

⚠️ **Time recording is REQUIRED. Never use `--` as placeholder.**

1. Try running `date "+%H:%M"` with 5-second timeout
2. **Validate output**: Must match pattern `^\d{2}:\d{2}$` (e.g., "14:30")
3. If command fails OR output invalid, **you MUST ask the user**:
   "What is the current time? (format: HH:MM, 24-hour)"
4. **Validate user input**:
   - Hour must be 00-23
   - Minute must be 00-59
   - Reject: "25:00", "14:65", "2:30 PM", "14:30:45"
   - Normalize: "9:30" → "09:30"
5. Do NOT proceed until you have a valid time
6. Do NOT use `--`, `TBD`, or any placeholder

**Late night warning:**
If time is 23:00 or later, inform user:
"Starting late session. If this crosses midnight, `/devlog-end` will handle it automatically."

---

## Create Session Log

Create new file at `devlog/logs/YYYY-MM-DD-session.md` (or `-session-2.md` if needed):

```markdown
# Session #[NEXT_NUMBER]
**Date:** YYYY-MM-DD | **Start:** HH:MM

---

## Goals

- [ ] (to be filled)

---

## Plan

- (to be filled)

---

## Progress

(work notes go here)

---

## Problems & Solutions

(to be filled during/after session)

---

## Milestones

- [ ] (to be filled)

---

## Conclusion

(to be filled at session end)
```

**Template rules:**
- `[NEXT_NUMBER]` = MAX session number from TIME.md + 1
- `YYYY-MM-DD` = today's date (ISO format)
- `HH:MM` = validated time from above step

---

## Formatting Progress Notes

When user provides documentation during the session:
- Start each topic with `### Feature/Task Name`
- Format content based on type:
  - Bullet points for general notes/findings
  - Numbered lists for SOPs/step-by-step procedures
  - Tables for configuration items, comparisons, or parameter lists
  - Free-form for quotes, references, code blocks, or specific formats
- Screenshots should be placed immediately after the related paragraph
- Claude decides complexity based on user input

**Example Progress formatting:**

```markdown
## Progress

### Water Particle System Setup

1. Open Niagara Editor
2. Create new Niagara System from template
3. Configure emitter parameters

| Parameter | Value | Notes |
|-----------|-------|-------|
| Spawn Rate | 500 | Adjust for performance |
| Lifetime | 2.0s | Controls trail length |

![Niagara Editor with spawn settings](../media/2026-01-15/10-30-45.png)

Found that increasing spawn rate beyond 1000 causes frame drops.

### Collision Detection

- Enabled Scene Depth collision
- Tested with static mesh obstacles
```

---

## Screenshot Capture

**When user wants to save a screenshot (natural language):**

Recognize phrases like:
- "screenshot: [description]"
- "save this screenshot as [description]"
- "capture this - [description]"

If MCP clipboard server is available:
1. Save clipboard image to `devlog/media/YYYY-MM-DD/HH-MM-SS.png`
2. Create date folder if not exists
3. Insert image **inline** at the current position in the Progress section:
   ```
   ![description](../media/YYYY-MM-DD/HH-MM-SS.png)
   ```
4. Confirm: "Screenshot saved: devlog/media/YYYY-MM-DD/HH-MM-SS.png"

If MCP not available or save fails:
- Note the screenshot reference inline: `[Screenshot: description at HH:MM:SS]`
- Confirm: "Logged screenshot at HH:MM:SS (text only - MCP unavailable)"

---

## Finalize Session Start

Ask the user:
1. "What are your goals for this session?" (reference previous to-do if available)
2. "What's your plan/approach to achieve these goals?"

**Validate input:**
- If goals are empty, ask again: "Please provide at least one goal."
- Format goals as checkbox list: `- [ ] Goal text`

Update the session log with their answers.

Confirm the session has started by showing:
- Session number
- Log file path
- Start time
- Goals and plan summary
