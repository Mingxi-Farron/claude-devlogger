#!/bin/bash

# devlog-kit setup script
# Copies devlog files and Claude commands to parent project

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== devlog-kit setup ==="
echo "Installing to: $PARENT_DIR"
echo ""

# Function to prompt for overwrite
prompt_overwrite() {
    local file="$1"
    read -p "  $file already exists. Overwrite? [y/N]: " response
    case "$response" in
        [yY][eE][sS]|[yY]) return 0 ;;
        *) return 1 ;;
    esac
}

# 1. Create .claude/commands/ if needed
echo "Setting up Claude commands..."
mkdir -p "$PARENT_DIR/.claude/commands"

# 2. Copy command files
for cmd in "$SCRIPT_DIR/.claude/commands"/*.md; do
    filename=$(basename "$cmd")
    target="$PARENT_DIR/.claude/commands/$filename"

    if [ -f "$target" ]; then
        if prompt_overwrite ".claude/commands/$filename"; then
            cp "$cmd" "$target"
            echo "  Overwrote: $filename"
        else
            echo "  Skipped: $filename"
        fi
    else
        cp "$cmd" "$target"
        echo "  Copied: $filename"
    fi
done

# 3. Copy devlog/ folder
echo ""
echo "Setting up devlog folder..."

if [ -d "$PARENT_DIR/devlog" ]; then
    if prompt_overwrite "devlog/"; then
        rm -rf "$PARENT_DIR/devlog"
        cp -r "$SCRIPT_DIR/devlog" "$PARENT_DIR/devlog"
        echo "  Overwrote: devlog/"
    else
        echo "  Skipped: devlog/"
    fi
else
    cp -r "$SCRIPT_DIR/devlog" "$PARENT_DIR/devlog"
    echo "  Copied: devlog/"
fi

# 4. Append to CLAUDE.md
echo ""
echo "Setting up CLAUDE.md..."

CLAUDE_MD="$PARENT_DIR/CLAUDE.md"
SNIPPET="$SCRIPT_DIR/CLAUDE.md.snippet"

if [ -f "$CLAUDE_MD" ]; then
    # Check if devlog section already exists
    if grep -q "## Devlog" "$CLAUDE_MD"; then
        echo "  CLAUDE.md already has Devlog section - skipped"
    else
        echo "" >> "$CLAUDE_MD"
        cat "$SNIPPET" >> "$CLAUDE_MD"
        echo "  Appended devlog section to CLAUDE.md"
    fi
else
    cat "$SNIPPET" > "$CLAUDE_MD"
    echo "  Created CLAUDE.md with devlog section"
fi

echo ""
echo "=== Setup complete! ==="
echo ""
echo "Next steps:"
echo "  1. Edit devlog/README.md with your project info"
echo "  2. Clear devlog/TIME.md (keep header row)"
echo "  3. Start logging with: /devlog-start"
echo ""
echo "You can now delete the devlog-kit folder if desired."
