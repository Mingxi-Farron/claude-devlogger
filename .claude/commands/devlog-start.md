# Start Devlog Session

Read `devlog/README.md` to get:
1. Project name and info
2. Screenshots folder path (if configured)
3. Current session count from `devlog/TIME.md`
4. Total cumulative time

**Pull To-Do from last session:**

Find the most recent session log file in `devlog/logs/`. If a previous session exists:
1. Read the file and look for a to-do or next-steps section (e.g., `## To-Do`, `## Next Session`, or similar)
2. If found, present those items to the user before asking for goals

If no previous session or no to-do items found, skip this step.

**Screenshot folder setup (first session only):**

If this is the first session (no prior logs in `devlog/logs/`) AND screenshots path is not set:
- Ask: "Where should screenshots be saved? Default is `devlog/media/`"
- Update `devlog/README.md` with the path
- Confirm MCP clipboard server is configured (if not, warn user)

If screenshots path is already set, don't ask about it.

**Formatting Progress notes:**

When user provides documentation during the session:
- Start each topic with `### Feature/Task Name`
- Format content based on type:
  - Bullet points for general notes/findings
  - Numbered lists for SOPs/step-by-step procedures
  - Free-form for quotes, references, code blocks, or specific formats
- Claude decides complexity based on user input

Create a new session log file at `devlog/logs/YYYY-MM-DD-session.md` (use today's date) with this structure:

```markdown
# Session #[NEXT_NUMBER]
**Date:** [TODAY] | **Start:** [CURRENT_TIME]

## Goals
- [ ] (to be filled)

## Plan
- (to be filled)

## Problems & Solutions
(to be filled during/after session)

## Milestones
- [ ] (to be filled)

## Conclusion
(to be filled at session end)
```

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

If MCP not available, fallback to text-only logging:
- Note the screenshot reference inline: `[Screenshot: description at HH:MM:SS]`
- Confirm: "Logged screenshot at HH:MM:SS (text only)"

Then ask the user:
1. "What are your goals for this session?" (reference previous to-do if available)
2. "What's your plan/approach to achieve these goals?"

Update the session log with their answers.

Confirm the session has started by showing:
- Session number
- Log file path
- Start time
- Goals and plan summary
