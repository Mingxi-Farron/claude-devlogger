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

**Screenshot setup (first session or on request):**

If this is the first session (no prior logs in `devlog/logs/`) AND screenshots path is not set or is "none":
1. Ask: "Do you want to set up screenshot capture? I can handle the full setup automatically."
2. If yes, execute the setup from `.claude/commands/devlog-screenshot-setup.md`
3. Run all commands, create files, configure MCP
4. Confirm setup complete

User can also trigger this anytime by saying "set up screenshots" or "configure screenshot capture".

If screenshots path is already set to `devlog/media/`, skip this step.

**Formatting Progress notes:**

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
