# Screenshot Setup (Claude Executable)

This command sets up the clipboard screenshot functionality. Run when:
- First session creation (if screenshots not configured)
- User requests screenshot setup anytime

## Prerequisites Check

```bash
# Check Node.js
node --version  # Requires 18+

# Check npm
npm --version
```

If missing, inform user to install Node.js first.

## Setup Steps (Windows)

### 1. Install MCP Clipboard Server

```bash
cd ~/AppData/Local
git clone https://github.com/marco-jardim/mcp-windows-clipboard.git
cd mcp-windows-clipboard
npm install
npm run build
```

### 2. Add to Claude Code

```bash
claude mcp add --transport stdio windows-clipboard -- node ~/AppData/Local/mcp-windows-clipboard/dist/index.js
```

### 3. Verify Connection

```bash
claude mcp list
# Expected: windows-clipboard - ✓ Connected
```

### 4. Create Media Folder

```bash
mkdir -p devlog/media
```

### 5. Create PowerShell Helper Script

Create `devlog/save_clipboard.ps1`:
```powershell
param(
    [string]$OutputPath
)

Add-Type -AssemblyName System.Windows.Forms
$img = [System.Windows.Forms.Clipboard]::GetImage()

if ($img) {
    $img.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Output "Image saved to: $OutputPath"
} else {
    Write-Output "No image in clipboard"
    exit 1
}
```

### 6. Update devlog/README.md

Set screenshots path:
```
- **Screenshots:** devlog/media/
```

## Post-Setup

Confirm to user:
- MCP server connected
- Media folder created
- Ready to use `screenshot: [description]` command

## Troubleshooting

If MCP fails to connect:
1. Check Node.js version (18+)
2. Verify build completed without errors
3. Try: `claude mcp remove windows-clipboard` then re-add

If clipboard capture fails:
1. Ensure image is in clipboard before command
2. Check PowerShell execution policy: `Set-ExecutionPolicy -Scope CurrentUser Bypass`
