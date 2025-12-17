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
cd your-project
git clone https://github.com/Mingxi-Farron/claude-devlogger.git
./claude-devlogger/setup.sh
```

<details>
<summary><b>New to terminal? Click here for step-by-step instructions</b></summary>

### Step 1: Open your terminal

| Operating System | How to open |
|------------------|-------------|
| **Mac** | Press `Cmd + Space`, type "Terminal", press Enter |
| **Windows** | Press `Win + R`, type "powershell", press Enter |
| **Linux** | Press `Ctrl + Alt + T` |

### Step 2: Navigate to your project folder

Your project folder is where your code lives. Use the `cd` (change directory) command to get there.

```bash
# Example: if your project is in Documents/my-app
cd Documents/my-app
```

**Tips:**
- Use `ls` (Mac/Linux) or `dir` (Windows) to see what's in the current folder
- Use `cd ..` to go up one folder level
- Drag your folder into the terminal to auto-fill the path

### Step 3: Clone claude-devlogger

This downloads the devlogger files into your project:

```bash
git clone https://github.com/Mingxi-Farron/claude-devlogger.git
```

### Step 4: Run the setup script

**On Mac/Linux (or Git Bash on Windows):**
```bash
./claude-devlogger/setup.sh
```

**On Windows PowerShell:**
```powershell
./claude-devlogger/setup.ps1
```

The script will copy the necessary files and set everything up. You'll see a success message when it's done.

</details>

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
- "screenshot: the particle system working" (logs timestamp + description)

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
- **Screenshots** - Timestamped visual progress notes
- **Conclusion** - Summary and items for next time

## Screenshot Logging

For visual projects (games, interactive art, UI work), you can log screenshots without moving files around.

**Setup:** Add your screenshot folder path to `devlog/README.md`:
```
- **Screenshots:** D:/Screenshots/MyProject/
```

**Usage:** After taking a screenshot, just say:
```
screenshot: the lighting finally looks right
```

Claude logs the timestamp and your description. The actual files stay where your OS saves them.

## License

MIT
