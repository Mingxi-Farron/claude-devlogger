# claude-devlogger

A structured development logging system powered by Claude Code. Track your coding sessions, document problems and solutions, and build a complete history of your project journey.

## Why Use This?

When working with Claude Code on a project, you naturally discuss goals, encounter problems, and find solutions. claude-devlogger captures this process so you can:

- Remember what you tried and why it worked (or didn't)
- Track time spent across multiple coding sessions
- Review your problem-solving journey when the project ends
- Pick up exactly where you left off in future sessions

## Features

- **Development Logs** - Record goals, plans, problems, solutions, and milestones for each coding session
- **Time Tracking** - Automatically calculate session duration and total project time
- **Slash Commands** - Use `/devlog-start`, `/devlog-end`, `/devlog-status`, `/devlog-final`
- **Natural Language** - Or just say "start logging", "end session", "add this to the log"
- **Final Assessment** - Generate a comprehensive project reflection when you're done

## Quick Setup

```bash
# Clone into your project
cd your-project
git clone https://github.com/Mingxi-Farron/claude-devlogger.git

# Run setup (bash or git bash on Windows)
./claude-devlogger/setup.sh

# Or PowerShell
./claude-devlogger/setup.ps1
```

## What Setup Does

1. Adds Claude Code commands to `.claude/commands/`
2. Creates a `devlog/` folder for your logs
3. Updates your `CLAUDE.md` so Claude knows how to help with logging

## After Setup

```
your-project/
├── CLAUDE.md                  (Claude reads this for context)
├── .claude/commands/          (slash commands live here)
├── devlog/
│   ├── README.md              (your project info - edit this)
│   ├── TIME.md                (cumulative time tracker)
│   ├── logs/                  (one file per session)
│   └── media/                 (screenshots if needed)
└── claude-devlogger/          (safe to delete after setup)
```

## Usage

### Starting a Coding Session
```
/devlog-start
```
Or say: "let's start logging" or "begin a new session"

Claude will create a log file, ask for your goals, and note your plan.

### During a Session
Just talk naturally:
- "note this down" or "add to the log"
- "we solved the auth bug by..."
- "this approach failed because..."

### Ending a Session
```
/devlog-end
```
Or say: "let's wrap up" or "end the session"

Claude will ask what you accomplished, what problems you faced, and update the time tracker.

### Checking Progress
```
/devlog-status
```
Or say: "how much time have I spent?" or "show session status"

### Project Complete
```
/devlog-final
```
Or say: "generate final assessment" or "summarize the project"

Claude will read all your session logs and create a comprehensive reflection.

## What Gets Logged

Each session captures:
- **Goals** - What you set out to accomplish
- **Plan** - How you intended to approach it
- **Problems & Solutions** - What broke, what you tried, what worked
- **Milestones** - Key progress points reached
- **Conclusion** - Summary and items for next time

## License

MIT
