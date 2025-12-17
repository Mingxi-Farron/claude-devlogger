# devlog-kit

Session logging toolkit for AI-assisted development with Claude Code.

## Features

- **Session Tracking** - Log goals, plans, problems, solutions, and milestones
- **Time Tracking** - Automatic duration calculation and cumulative time
- **Slash Commands** - `/devlog-start`, `/devlog-end`, `/devlog-status`, `/devlog-final`
- **Natural Language** - Also works with "start logging", "end session", etc.
- **Final Assessment** - Generate comprehensive project reflection when done

## Quick Setup

```bash
# Clone into your project
cd your-project
git clone https://github.com/Mingxi-Farron/devlog-kit.git

# Run setup (bash)
./devlog-kit/setup.sh

# Or PowerShell
./devlog-kit/setup.ps1
```

## What Setup Does

1. Copies `.claude/commands/` to your project root
2. Copies `devlog/` folder to your project root
3. Adds devlog section to your `CLAUDE.md` (creates if needed)

## After Setup

```
your-project/
├── CLAUDE.md              (with devlog instructions)
├── .claude/
│   └── commands/
│       ├── devlog-start.md
│       ├── devlog-end.md
│       ├── devlog-status.md
│       └── devlog-final.md
├── devlog/
│   ├── README.md          (project info - edit this)
│   ├── TIME.md            (time tracker)
│   ├── logs/              (session logs)
│   └── media/             (screenshots)
└── devlog-kit/            (can delete)
```

## Usage

### Start a Session
```
/devlog-start
```
Or say: "start logging", "begin session"

### End a Session
```
/devlog-end
```
Or say: "end session", "stop logging"

### Check Status
```
/devlog-status
```
Or say: "how much time?", "session status"

### Final Assessment (end of project)
```
/devlog-final
```
Or say: "finalize project", "generate assessment"

## Session Log Structure

Each session captures:
- **Goals** - What you're trying to achieve
- **Plan** - Your approach
- **Problems & Solutions** - What went wrong, what you tried, what worked
- **Milestones** - Progress checkpoints
- **Conclusion** - Summary and carry-over items

## License

MIT
