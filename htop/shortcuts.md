# Htop Keyboard Shortcuts

## Opening Htop
```bash
htop
```

## Navigation
- **↑/↓** - Scroll up/down through processes
- **PgUp/PgDn** - Scroll page up/down
- **Home** - Jump to top
- **End** - Jump to bottom

## Sorting
- **<** - Sort by previous column
- **>** - Sort by next column
- **F6** - Choose sort column (interactive)
- **I** - Invert sort order

## Filtering & Searching
- **F3** - Search for process by name
- **F4** - Filter processes (show only matching)
- **Backspace** - Clear search/filter
- **L** - Show open files for selected process

## Process Management
- **F9** - Kill selected process (choose signal)
- **K** - Send SIGKILL to process
- **T** - Trace system calls (strace)
- **U** - Show only processes from selected user

## Display Options
- **F1** - Help menu
- **F2** - Setup/Configuration
- **F5** - Tree view (show process hierarchy)
- **F10** - Quit
- **H** - Toggle user threads
- **K** - Toggle kernel threads
- **Z** - Toggle color scheme
- **M** - Sort by memory usage
- **P** - Sort by CPU usage
- **T** - Sort by time

## View Modes
- **F5** - Toggle tree view (hierarchical)
- **Ctrl+L** - Lock/unlock column header
- **Shift+M** - Sort by memory
- **Shift+P** - Sort by CPU
- **Shift+T** - Sort by time

## Common Tasks

**Find a process:**
```
F3 → type process name
```

**Kill a process:**
```
Select process → F9 → choose signal (9 for SIGKILL)
```

**View process tree:**
```
F5 (toggle tree view)
```

**Monitor specific user:**
```
U → select user
```

**See system load:**
- Check right side meters: Load Average, Uptime
- Check left side: CPU and Memory usage

## Configuration
Config file: `~/.config/htop/htoprc`

To customize:
- Press F2 in htop to open setup menu
- Changes are saved automatically
