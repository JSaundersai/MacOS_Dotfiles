# Yazi File Manager Shortcuts & Guide

## Opening Yazi

```bash
yazi                    # Open yazi
yazi /path/to/dir       # Open specific directory
```

## Navigation

| Shortcut | Action |
|----------|--------|
| `k` / `↑` | Move up |
| `j` / `↓` | Move down |
| `h` / `←` | Go to parent directory |
| `l` / `→` | Enter directory / open file |
| `g` then `h` | Go to home directory |
| `g` then `r` | Go to root directory |
| `g` then `c` | Go to config directory |
| `g` then `d` | Go to downloads directory |
| `G` | Jump to bottom |
| `gg` | Jump to top |

## File Operations

| Shortcut | Action |
|----------|--------|
| `o` | Open file with default app |
| `O` | Open file with selected app |
| `Enter` | Open file / enter directory |
| `e` | Edit file with $EDITOR |
| `c` | Copy file/directory |
| `x` | Cut file/directory |
| `v` | Paste file/directory |
| `d` | Delete file/directory |
| `a` | Create new file |
| `A` | Create new directory |
| `r` | Rename file/directory |
| `u` | Undo last operation |
| `U` | Redo operation |

## Selection

| Shortcut | Action |
|----------|--------|
| `Space` | Toggle selection |
| `Ctrl+a` | Select all |
| `Ctrl+u` | Deselect all |
| `Ctrl+i` | Invert selection |

## Search & Filter

| Shortcut | Action |
|----------|--------|
| `/` | Search files |
| `?` | Search backwards |
| `n` | Next search result |
| `N` | Previous search result |
| `f` | Filter files |
| `s` | Sort files |

## View Options

| Shortcut | Action |
|----------|--------|
| `z` | Toggle hidden files |
| `Z` | Toggle symlink display |
| `m` | Toggle line mode |
| `~` | Toggle preview |
| `w` | Toggle preview wrap |

## Tabs

| Shortcut | Action |
|----------|--------|
| `t` | Create new tab |
| `1-9` | Switch to tab number |
| `[` | Previous tab |
| `]` | Next tab |
| `w` | Close current tab |

## Misc

| Shortcut | Action |
|----------|--------|
| `?` | Show help |
| `:` | Enter command mode |
| `q` | Quit yazi |
| `Ctrl+c` | Cancel operation |

## Command Mode

Enter command mode with `:` and use these commands:

```bash
:help               # Show help
:quit               # Quit
:cd /path           # Change directory
:reveal             # Reveal in Finder (macOS)
:extract            # Extract archive
:archive            # Create archive
```

## Configuration Files

- **yazi.toml** - Main configuration
- **keymap.toml** - Keyboard shortcuts
- **theme.toml** - Color theme

Location: `~/.config/yazi/` → `~/dotfiles_new/yazi/`

## Current Configuration

### Manager Settings
- **Ratio**: 1:4:3 (parent:current:preview)
- **Sort**: By modified date (newest first)
- **Show hidden**: Off (toggle with `z`)
- **Mouse**: Enabled (click and scroll)
- **Scrolloff**: 5 lines

### Preview Settings
- **Image quality**: 75%
- **Image filter**: Triangle (high quality)
- **Tab size**: 2 spaces
- **Max width**: 600px
- **Max height**: 900px

### Openers
- **Edit**: Opens with `$EDITOR` (nvim)
- **Open**: Uses `open` command (macOS)
- **Reveal**: Shows in Finder (macOS)
- **Extract**: Extracts archives

## Tips & Tricks

### Create Shell Wrapper
Add to your `.zshrc` for auto-cd on exit:

```bash
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
```

Then use `y` instead of `yazi` to auto-navigate to the directory you were in.

### Quick File Operations
```bash
c               # Copy selected
v               # Paste
d               # Delete
r               # Rename
```

### Bulk Operations
```bash
Space           # Select file
Space           # Select another file
c               # Copy all selected
v               # Paste all
```

### Search & Find
```bash
/pattern        # Search for files
n               # Next match
N               # Previous match
```

### View Different Perspectives
```bash
z               # Toggle hidden files
m               # Toggle line mode (details)
~               # Toggle preview pane
w               # Toggle preview wrap
```

## Keyboard Shortcuts by Category

### Movement
- `k/j` - Up/Down
- `h/l` - Parent/Child
- `gg/G` - Top/Bottom
- `g` + `h/r/c/d` - Jump to special dirs

### File Ops
- `c/x/v` - Copy/Cut/Paste
- `d` - Delete
- `a/A` - New file/dir
- `r` - Rename
- `e` - Edit
- `o/O` - Open

### Selection
- `Space` - Toggle
- `Ctrl+a` - Select all
- `Ctrl+u` - Deselect all
- `Ctrl+i` - Invert

### View
- `z` - Hidden
- `m` - Line mode
- `~` - Preview
- `w` - Wrap

### Tabs
- `t` - New tab
- `[/]` - Prev/Next
- `1-9` - Jump to tab

## Troubleshooting

### Images Not Showing
- Check `image_delay` setting (default 30ms)
- Try `yazi --clear-cache` to clear image cache
- Ensure terminal supports image protocol (Kitty does!)

### Slow Performance
- Reduce `image_quality` in config
- Disable preview with `~`
- Check file system performance

### Keybindings Not Working
- Check `keymap.toml` for conflicts
- Ensure terminal passes key to yazi
- Try `yazi --clear-cache`

### Files Not Showing
- Toggle hidden files with `z`
- Check filter with `f`
- Verify permissions

## Integration with Other Tools

### Open with Vim
```bash
e               # Opens file in $EDITOR (nvim)
```

### Open with External App
```bash
o               # Opens with default app
O               # Choose app to open with
```

### Reveal in Finder (macOS)
```bash
:reveal         # Shows file in Finder
```

## Resources

- Official Docs: https://yazi-rs.github.io/
- GitHub: https://github.com/sxyazi/yazi
- Configuration: https://yazi-rs.github.io/docs/configuration/overview/
- Themes: https://github.com/yazi-rs/flavors

## Performance Tips

1. **Disable unnecessary previews**: Use `~` to toggle
2. **Reduce image quality**: Lower `image_quality` in config
3. **Clear cache regularly**: `yazi --clear-cache`
4. **Use fast file systems**: SSD recommended
5. **Limit preview size**: Adjust `max_width` and `max_height`

## Common Workflows

### Browse and Edit
```bash
yazi                # Open yazi
j/k                 # Navigate
e                   # Edit file
```

### Copy Files
```bash
Space               # Select file 1
j                   # Move down
Space               # Select file 2
c                   # Copy both
l                   # Enter destination
v                   # Paste
```

### Organize Downloads
```bash
y ~/Downloads       # Open downloads
s                   # Sort by type
a                   # Create folders
c/v                 # Move files
```

### Search and Edit
```bash
/pattern            # Search
e                   # Edit found file
n                   # Next match
```
