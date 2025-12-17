# devlog-kit setup script (PowerShell)
# Copies devlog files and Claude commands to parent project

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ParentDir = Split-Path -Parent $ScriptDir

Write-Host "=== devlog-kit setup ===" -ForegroundColor Cyan
Write-Host "Installing to: $ParentDir"
Write-Host ""

# Function to prompt for overwrite
function Prompt-Overwrite {
    param([string]$file)
    $response = Read-Host "  $file already exists. Overwrite? [y/N]"
    return $response -match '^[yY]'
}

# 1. Create .claude/commands/ if needed
Write-Host "Setting up Claude commands..."
$CommandsDir = Join-Path $ParentDir ".claude\commands"
if (-not (Test-Path $CommandsDir)) {
    New-Item -ItemType Directory -Path $CommandsDir -Force | Out-Null
}

# 2. Copy command files
$SourceCommands = Join-Path $ScriptDir ".claude\commands\*.md"
foreach ($cmd in Get-ChildItem $SourceCommands) {
    $target = Join-Path $CommandsDir $cmd.Name

    if (Test-Path $target) {
        if (Prompt-Overwrite ".claude\commands\$($cmd.Name)") {
            Copy-Item $cmd.FullName $target -Force
            Write-Host "  Overwrote: $($cmd.Name)"
        } else {
            Write-Host "  Skipped: $($cmd.Name)"
        }
    } else {
        Copy-Item $cmd.FullName $target
        Write-Host "  Copied: $($cmd.Name)"
    }
}

# 3. Copy devlog/ folder
Write-Host ""
Write-Host "Setting up devlog folder..."

$TargetDevlog = Join-Path $ParentDir "devlog"
$SourceDevlog = Join-Path $ScriptDir "devlog"

if (Test-Path $TargetDevlog) {
    if (Prompt-Overwrite "devlog\") {
        Remove-Item $TargetDevlog -Recurse -Force
        Copy-Item $SourceDevlog $TargetDevlog -Recurse
        Write-Host "  Overwrote: devlog\"
    } else {
        Write-Host "  Skipped: devlog\"
    }
} else {
    Copy-Item $SourceDevlog $TargetDevlog -Recurse
    Write-Host "  Copied: devlog\"
}

# 4. Append to CLAUDE.md
Write-Host ""
Write-Host "Setting up CLAUDE.md..."

$ClaudeMd = Join-Path $ParentDir "CLAUDE.md"
$Snippet = Join-Path $ScriptDir "CLAUDE.md.snippet"

if (Test-Path $ClaudeMd) {
    $content = Get-Content $ClaudeMd -Raw
    if ($content -match "## Devlog") {
        Write-Host "  CLAUDE.md already has Devlog section - skipped"
    } else {
        Add-Content $ClaudeMd "`n"
        Get-Content $Snippet | Add-Content $ClaudeMd
        Write-Host "  Appended devlog section to CLAUDE.md"
    }
} else {
    Copy-Item $Snippet $ClaudeMd
    Write-Host "  Created CLAUDE.md with devlog section"
}

Write-Host ""
Write-Host "=== Setup complete! ===" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Edit devlog\README.md with your project info"
Write-Host "  2. Clear devlog\TIME.md (keep header row)"
Write-Host "  3. Start logging with: /devlog-start"
Write-Host ""
Write-Host "You can now delete the devlog-kit folder if desired."
