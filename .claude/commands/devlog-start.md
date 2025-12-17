# Start Devlog Session

Read `devlog/README.md` to get:
1. Project name and info
2. Current session count from the Time Tracker table
3. Total cumulative time

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

Then ask the user:
1. "What are your goals for this session?"
2. "What's your plan/approach to achieve these goals?"

Update the session log with their answers.

Confirm the session has started by showing:
- Session number
- Log file path
- Start time
- Goals and plan summary
