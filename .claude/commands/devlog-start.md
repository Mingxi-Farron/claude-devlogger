# Start Devlog Session

Read `devlog/README.md` to get:
1. Project name and info
2. Screenshots folder path (if configured)
3. Current session count from `devlog/TIME.md`
4. Total cumulative time

**Screenshot folder setup (first session only):**

If this is the first session (no prior logs in `devlog/logs/`) AND screenshots path is not set:
- Ask: "Do you want to set up a screenshot folder for this project? This is useful for visual projects (games, UI, art). You can skip if you don't need visual logging."
- If yes: Ask for the folder path. Suggest creating a dedicated folder (not the default OS screenshots folder, which gets cluttered). Update `devlog/README.md` with the path.
- If no/skip: Set screenshots path to "none" in `devlog/README.md` so we don't ask again.

If screenshots path is already set (including "none"), don't ask about it.

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

## Screenshots
(to be filled when user says "screenshot: [description]")

## Conclusion
(to be filled at session end)
```

**When user says "screenshot: [description]":**
- Note the current time as the identifier (HH-MM-SS format)
- Add to the Screenshots section: `- \`HH-MM-SS\` - [their description]`
- Confirm briefly: "Logged screenshot at HH:MM:SS"

Then ask the user:
1. "What are your goals for this session?"
2. "What's your plan/approach to achieve these goals?"

Update the session log with their answers.

Confirm the session has started by showing:
- Session number
- Log file path
- Start time
- Goals and plan summary
