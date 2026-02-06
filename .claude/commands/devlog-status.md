# Devlog Status

## Natural Language Triggers

This command MUST be invoked when the user says any of these (case-insensitive):
- "how much time?" / "total time" / "session status"
- "多少时间" / "时间统计" / "进度"
- "devlog status" / "check progress"
- Or directly: `/devlog-status`

**When triggered, execute the FULL workflow below. Do NOT skip any step.**

---

## Data Validation First

**1. Check TIME.md exists and is valid:**
- If not found: "ERROR: TIME.md not found. Run `/devlog-start` to initialize."
- If empty (only header): "Project initialized but no sessions recorded yet."

**2. Validate TIME.md format:**
- Check table has correct columns: #, Date, Duration, Cumulative, Focus
- Check Duration format is `Xh Ym` (warn if `~Xh` approximations found)
- Check Cumulative is monotonically increasing
- If issues found, display warnings (don't block)

**3. Check logs/ directory:**
- If not found or empty: "No session logs found."
- Count session files and compare to TIME.md row count
- If mismatch: "WARNING: TIME.md shows X sessions, but found Y log files"

---

## Detect Active Session

**Robust detection logic:**

1. Find the 3 most recent session files (by filename date)
2. For each, read line 2 and check:
   - Does it have `**End:**` field? → Closed
   - Does it have `**Duration:**` field? → Closed
   - Only `**Start:**` with valid HH:MM? → **Active**
   - `**Start:** --` or missing? → **Incomplete** (needs repair)

3. **Cross-midnight handling:**
   - If Date field contains `~` (e.g., `2026-01-29 ~ 01-30`), it's cross-midnight
   - Check if today matches either date in the range

**Active session criteria:**
- File date is today OR yesterday (for cross-midnight)
- Has valid Start time (HH:MM format)
- Does NOT have End time or Duration

---

## Display Output

### If Active Session Found:

```
=== DEVLOG STATUS ===

🟢 ACTIVE SESSION

Session #17 | Started at 16:00
Date: 2026-02-04

Goals:
- [ ] Fix packaging crash
- [ ] Debug CanvasManager gradient

Elapsed: 3h 15m (as of now)

[If elapsed > 8h]
⚠️ Long session (8h+). Consider taking a break.

[If elapsed > 12h]
⚠️ Very long session (12h+). Remember to end with `/devlog-end`.
```

### If No Active Session:

```
=== DEVLOG STATUS ===

⚪ No active session

Last session: #17 on 2026-02-04 (7h 0m)

Start a new session with `/devlog-start`
```

### Project Summary (always show):

```
--- PROJECT SUMMARY ---

Total Sessions: 17
Total Time: 61.4h
Average Session: 3.6h

--- RECENT SESSIONS ---

| # | Date | Duration | Focus |
|---|------|----------|-------|
| 17 | 2026-02-04 | 7h 0m | Packaging fix, Canvas gradient |
| 16 | 2026-02-03 | 7h 0m | Spawn rotation, Niagara collision |
| 15 | 2026-01-30 | 10h 0m | DPI fix, ImGui, Virtual Waterfall |
```

### If Data Issues Found:

```
--- ⚠️ DATA WARNINGS ---

- TIME.md row 14: Duration "~4h" should be exact (e.g., "4h 0m")
- TIME.md row 15: Duration "~10h" should be exact
- Session #5 log file missing (TIME.md has entry)

Run `/devlog-end` on incomplete sessions to fix.
```

---

## Statistics Calculation

**Total Time:**
- Read from TIME.md's "Total Time" line
- Or calculate: Sum of all Duration values

**Average Session:**
- Total Time / Number of Sessions
- Display as `X.Xh`

**Elapsed Time (for active session):**
- Get current time (via `date "+%H:%M"` or ask user)
- Calculate: Current Time - Start Time
- Handle cross-midnight if needed
