# End Devlog Session

Find the most recent session log in `devlog/logs/` (today's or the latest).

Read the session log to get:
1. Session number
2. Start time
3. Goals that were set

Ask the user to provide:
1. "What problems did you encounter? For each, what solutions did you try (failed and successful)?"
2. "What milestones did you reach?"
3. "Summary and any carry-over items for next session?"

Update the session log:
1. Fill in **Problems & Solutions** section (see format below)
2. Update **Milestones** checkboxes
3. Fill in **Conclusion** section
4. Get current time: use Claude's known current time, or run `date "+%H:%M"` (works on Unix/Git Bash/macOS)
5. Calculate duration (current time - start time)

**Problems & Solutions format:**

For 1-2 problems, use list format:
```markdown
### Problem: [description]
- **Attempted:** [what was tried]
- **Result:** Failed/Success
- **Why:** [explanation]
```

For 3+ problems, prefer table format:
```markdown
| Problem | Attempted | Result | Why |
|---------|-----------|--------|-----|
| Particles not spawning | Checked emitter settings | Success | Spawn rate was 0 |
| Performance drops | Reduced particle count | Partial | Still laggy at 1000+ |
```

**Important:** Only write Problems & Solutions once. Do not duplicate this section.
6. Update the header (line 2) to add End time and Duration:
   - Use the Edit tool to replace line 2:
     FROM: `**Date:** YYYY-MM-DD | **Start:** HH:MM`
     TO: `**Date:** YYYY-MM-DD | **Start:** HH:MM | **End:** HH:MM | **Duration:** Xh Xm`
   - ⚠️ DO NOT append to file bottom - MUST edit line 2 only
   - Verify the update by reading line 2 back

Update `devlog/TIME.md`:
1. Add new row to the table:
   - Session number
   - Today's date
   - Duration
   - New cumulative total
   - Focus (brief summary from goals)
2. Update **Total Time** line

Confirm session ended:
- Session number
- Duration
- New total project time
- Brief accomplishments summary
