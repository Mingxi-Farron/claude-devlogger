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
1. Fill in **Problems & Solutions** section:
   ```
   ### Problem: [description]
   - **Attempted:** [what was tried]
   - **Result:** Failed/Success
   - **Why:** [explanation]
   ```
2. Update **Milestones** checkboxes
3. Fill in **Conclusion** section
4. Get current time by running: `date "+%H:%M"`
5. Calculate duration (current time - start time)
6. Add duration to header: `**Duration:** Xh Xm`

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
