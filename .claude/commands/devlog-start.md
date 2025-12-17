# Start Devlog Session

Read `devlog/README.md` to get:
1. Project name and info
2. Screenshots folder path
3. Current session count from `devlog/TIME.md`
4. Total cumulative time

If screenshots path is set, confirm it with the user. If not set, ask if they want to configure one.

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
