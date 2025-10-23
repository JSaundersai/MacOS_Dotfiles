# Tmux Shortcuts & Commands

## Starting Tmux

```bash
tmux                    # Start new session
tmux new-session -s name  # Start named session
tmux attach             # Attach to last session
tmux attach -t name     # Attach to specific session
tmux list-sessions      # List all sessions
```

## Prefix Key

**Default prefix: `Ctrl+Space`** (instead of `Ctrl+B`)

All shortcuts below use `prefix` to mean `Ctrl+Space`

## Session Management

| Shortcut | Action |
|----------|--------|
| `prefix + d` | Detach from session |
| `prefix + s` | List sessions (interactive) |
| `prefix + $` | Rename current session |
| `prefix + (` | Switch to previous session |
| `prefix + )` | Switch to next session |

## Window Management

| Shortcut | Action |
|----------|--------|
| `prefix + c` | Create new window |
| `prefix + n` | Next window |
| `prefix + p` | Previous window |
| `prefix + 0-9` | Jump to window number |
| `prefix + w` | List windows (interactive) |
| `prefix + ,` | Rename current window |
| `prefix + &` | Kill current window |

## Pane Management

| Shortcut | Action |
|----------|--------|
| `prefix + \|` | Split pane vertically |
| `prefix + -` | Split pane horizontally |
| `prefix + h/j/k/l` | Navigate panes (Vim keys) |
| `prefix + Ctrl+h/j/k/l` | Resize panes (Vim keys) |
| `prefix + m` | Maximize/minimize pane |
| `prefix + z` | Toggle pane zoom |
| `prefix + x` | Kill current pane |
| `prefix + !` | Break pane into new window |

## Copy Mode (Vi Mode)

| Shortcut | Action |
|----------|--------|
| `prefix + [` | Enter copy mode |
| `v` | Begin selection |
| `C-v` | Toggle rectangle selection |
| `y` | Copy selection |
| `prefix + ]` | Paste |
| `q` | Exit copy mode |

## Search & Find

| Shortcut | Action |
|----------|--------|
| `prefix + f` | Find window by name |
| `prefix + /` | Search in copy mode |

## Configuration

### Reload Config
```bash
prefix + r              # Reload tmux.conf
```

### Plugin Management (TPM)
```bash
prefix + I              # Install plugins
prefix + U              # Update plugins
prefix + Alt+u          # Remove unused plugins
```

## Plugins Installed

1. **tpm** - Tmux Plugin Manager
2. **tmux-sensible** - Sensible defaults
3. **vim-tmux-navigator** - Seamless Vim/Tmux navigation
4. **tmux-yank** - Copy to system clipboard
5. **catppuccin/tmux** - Beautiful Catppuccin theme

## Vim-Tmux Navigator

Navigate seamlessly between Vim splits and Tmux panes:

```bash
Ctrl+h              # Move left
Ctrl+j              # Move down
Ctrl+k              # Move up
Ctrl+l              # Move right
```

Works in both Vim and Tmux!

## Useful Commands

```bash
# List all key bindings
prefix + ?

# Show time
prefix + t

# Show pane numbers
prefix + q

# Swap panes
prefix + {              # Swap with previous
prefix + }              # Swap with next

# Break/join panes
prefix + !              # Break pane into window
prefix + :join-pane -s session:window  # Join pane
```

## Configuration File

Location: `~/.config/tmux/tmux.conf` → `~/dotfiles_new/tmux/tmux.conf`

Key settings:
- **Prefix**: `Ctrl+Space`
- **Base index**: 1 (windows start at 1, not 0)
- **Mouse**: Enabled
- **Vi mode**: Enabled
- **Terminal**: 256 colors with RGB support
- **Theme**: Catppuccin Mocha

## Tips & Tricks

### Create a Development Session
```bash
tmux new-session -s dev -n editor
# Now split panes and arrange your workspace
```

### Persistent Sessions
Sessions persist even if you close the terminal. Reattach with:
```bash
tmux attach -t dev
```

### Rename Window by Path
Current config automatically shows the current directory in window names.

### Copy to System Clipboard
With `tmux-yank` plugin:
```bash
# In copy mode, press 'y' to copy to system clipboard
prefix + [
# Select text with v
y                   # Copies to clipboard
```

### Maximize Pane
```bash
prefix + m          # Toggle maximize
# Or
prefix + z          # Toggle zoom (newer tmux)
```

## Common Workflows

### Split Window for Coding
```bash
tmux new-session -s work
prefix + |          # Split vertically (editor on left, terminal on right)
prefix + -          # Split horizontally in right pane
```

### Navigate Between Panes
```bash
Ctrl+h              # Move to left pane
Ctrl+j              # Move to pane below
Ctrl+k              # Move to pane above
Ctrl+l              # Move to right pane
```

### Resize Panes
```bash
prefix + h          # Resize left (5 units)
prefix + j          # Resize down (5 units)
prefix + k          # Resize up (5 units)
prefix + l          # Resize right (5 units)
```

## Troubleshooting

### Colors Look Wrong
- Check terminal supports 256 colors: `echo $TERM`
- Should be `xterm-256color` or `tmux-256color`

### Plugins Not Loading
- Install TPM: `git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm`
- Press `prefix + I` to install plugins

### Mouse Not Working
- Ensure `set -g mouse on` is in config
- Try `prefix + m` to toggle mouse mode

### Vim-Tmux Navigator Not Working
- Ensure vim-tmux-navigator plugin is installed
- Check Vim has the plugin installed too
- Restart Tmux: `tmux kill-server && tmux`

## Resources

- Official Docs: https://github.com/tmux/tmux/wiki
- Awesome Tmux: https://github.com/rothgar/awesome-tmux
- Catppuccin Theme: https://github.com/catppuccin/tmux
- TPM: https://github.com/tmux-plugins/tpm
