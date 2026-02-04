# End Devlog Session

## Find Session to Close

Find the most recent session log in `devlog/logs/`:
1. List all `YYYY-MM-DD-session*.md` files
2. Sort by date (filename), then by suffix (-session-2 > -session)
3. Take the latest file

**Check if already closed:**
- If the file's line 2 already contains `**End:**` and `**Duration:**`:
  - ⚠️ **STOP**: "This session is already closed (Duration: Xh Xm). Nothing to do."
  - Ask: "Did you mean to start a new session? Run `/devlog-start`"

---

## Validate Start Time

Read the session log to get:
1. Session number (from `# Session #X`)
2. Start time (from `**Start:** HH:MM`)
3. Goals that were set

⚠️ **VALIDATE Start time:**
- If Start time is `--`, empty, or missing:
  - **STOP and ask**: "The session start time was not recorded. What time did this session start? (format: HH:MM)"
  - Validate input (see time validation rules below)
  - Update line 2 with the provided start time before proceeding
- If Start time exists but invalid format:
  - Ask user to provide correct time

---

## Collect Session Summary

Ask the user to provide:
1. "What problems did you encounter? For each, what solutions did you try (failed and successful)?"
2. "What milestones did you reach?"
3. "Summary and any carry-over items for next session?"

---

## Get End Time (MANDATORY)

⚠️ **Time recording is REQUIRED. Never use `--` as placeholder.**

1. Try running `date "+%H:%M"` with 5-second timeout
2. **Validate output**: Must match pattern `^\d{2}:\d{2}$`
3. If command fails OR output invalid, **you MUST ask the user**:
   "What is the current time? (format: HH:MM, 24-hour)"
4. **Validate user input**:
   - Hour must be 00-23
   - Minute must be 00-59
   - Reject: "25:00", "14:65", "2:30 PM"
   - Normalize: "9:30" → "09:30"
5. Do NOT proceed until you have a valid end time

---

## Calculate Duration (with Midnight Handling)

**Standard case (same day):**
```
Duration = End_Time - Start_Time
Example: 19:00 - 12:00 = 7h 0m
```

**Cross-midnight case:**
If End_Time < Start_Time (e.g., Start: 23:00, End: 01:30):
```
Duration = (24:00 - Start_Time) + End_Time
Example: (24:00 - 23:00) + 01:30 = 1h + 1h30m = 2h 30m
```

**Duration format rules:**
- Always use `Xh Ym` format (e.g., "7h 0m", "2h 30m", "0h 45m")
- Never use `~` approximations (no "~4h")
- Never omit minutes (use "7h 0m" not "7h")
- Round seconds: 2h 30m 45s → 2h 31m

---

## Update Session Log

**1. Fill in Problems & Solutions section:**

For 1-2 problems, use list format:
```markdown
### Problem: [description]
- **Attempted:** [what was tried]
- **Result:** Failed/Success
- **Why:** [explanation]
```

For 3+ problems, prefer table format:
```markdown
| Problem | Solution |
|---------|----------|
| Issue 1 | Fix 1 |
| Issue 2 | Fix 2 |
```

**Important:** Only write Problems & Solutions once. Check if section already has content.

**2. Update Milestones checkboxes**

**3. Fill in Conclusion section**

**4. Update header (line 2):**

Use the Edit tool to replace line 2:

**Same-day session:**
```
FROM: **Date:** YYYY-MM-DD | **Start:** HH:MM
TO:   **Date:** YYYY-MM-DD | **Start:** HH:MM | **End:** HH:MM | **Duration:** Xh Ym
```

**Cross-midnight session:**
```
FROM: **Date:** YYYY-MM-DD | **Start:** HH:MM
TO:   **Date:** YYYY-MM-DD ~ MM-DD | **Start:** HH:MM | **End:** HH:MM (+1d) | **Duration:** Xh Ym
```

- ⚠️ DO NOT append to file bottom - MUST edit line 2 only
- Verify the update by reading line 2 back
- If verification fails, retry once, then ask user to manually edit

---

## Update TIME.md

**1. Add new row to the table:**

| Column | Value |
|--------|-------|
| # | Session number |
| Date | YYYY-MM-DD (or YYYY-MM-DD~DD for cross-midnight) |
| Duration | Xh Ym (exact format, no ~) |
| Cumulative | Previous + Duration (1 decimal place, e.g., 61.5h) |
| Focus | Brief summary from goals (10-15 words) |

**2. Update Total Time line:**
```
**Total Time: XX.Xh** (or **Total Time: XX hours**)
```

**Cumulative calculation:**
- Read previous row's Cumulative value
- Convert Duration to decimal hours: "7h 30m" = 7.5h
- New Cumulative = Previous + Duration
- Round to 1 decimal place

---

## Confirm Session Ended

Display:
- Session number
- Duration (exact)
- New total project time
- Brief accomplishments summary

Example:
```
✅ Session #17 ended

Duration: 7h 0m
Total project time: 61.4h

Accomplishments:
- Fixed packaging serialization error
- Fixed CanvasManager gradient bug
- MOD-002 Phase 1-3 completed
```
