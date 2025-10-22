# Oh My Posh Configuration Guide

## What is Oh My Posh?

Oh My Posh is a cross-platform prompt theme engine that renders your shell prompt based on customizable blocks and segments. It displays information like:
- Current user and hostname
- Current directory
- Git status
- Programming language versions
- Time
- Exit codes

## Configuration Files

- **config.json** - Main theme configuration (in `~/.config/oh-my-posh/`)
- **Symlink**: `~/.config/oh-my-posh` → `~/dotfiles_new/oh-my-posh`

## Current Theme Features

Your oh-my-posh config includes:

### Left Prompt (Main Line)
1. **Session** - User@Computer (blue)
2. **Path** - Current directory (dark blue)
3. **Git** - Git branch and status (green)
4. **Node** - Node.js version (if in Node project)
5. **Python** - Python version (if in Python project)
6. **Go** - Go version (if in Go project)
7. **Rust** - Rust version (if in Rust project)
8. **Time** - Current time (gray)

### Right Prompt
- **Exit Code** - Shows error code if command failed (red)

### Second Line
- **Prompt Symbol** - `❯` (cyan)

## Editing Configuration

### Edit in Editor
```bash
n ~/.config/oh-my-posh/config.json
```

### View Current Config
```bash
cat ~/.config/oh-my-posh/config.json
```

### Export Current Theme
```bash
oh-my-posh config export --output ~/.config/oh-my-posh/custom.json
```

## Available Segments

You can add more segments to your prompt. Common ones:

```json
{
  "type": "docker",
  "style": "powerline",
  "foreground": "#ffffff",
  "background": "#0db7ed",
  "template": " \ue7b0 {{ .Context }} "
}
```

Other available segments:
- **docker** - Docker context
- **kubernetes** - K8s cluster info
- **aws** - AWS profile
- **azure** - Azure subscription
- **terraform** - Terraform workspace
- **battery** - Battery level
- **memory** - Memory usage
- **cpu** - CPU usage
- **command_duration** - How long last command took
- **status** - Command exit status

## Customization

### Change Colors

Edit the `background` and `foreground` values in config.json:
```json
"background": "#0077be",  // Background color (hex)
"foreground": "#ffffff"   // Text color (hex)
```

### Change Symbols

Edit the `template` field:
```json
"template": " \ue0a0 {{ .HEAD }} "  // Git symbol
"template": " \ue718 {{ .Full }} "  // Node symbol
```

### Add/Remove Segments

Add new segment objects to the `segments` array, or remove existing ones.

### Reorder Segments

Move segment objects up/down in the `segments` array to change order.

## Themes

### Use Built-in Theme
```bash
oh-my-posh init zsh --config powerlevel10k_modern
```

### List Available Themes
```bash
oh-my-posh config list
```

### Apply Theme
Update your zshrc:
```bash
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/powerlevel10k_modern.omp.json)"
```

## Troubleshooting

### Prompt Not Showing
- Reload zshrc: `source ~/.zshrc`
- Check oh-my-posh is installed: `which oh-my-posh`
- Check config path: `cat ~/.config/oh-my-posh/config.json`

### Symbols Not Displaying
- Install Nerd Font (already have Maple Mono NF)
- Ensure terminal supports Unicode
- Check font in kitty config

### Segments Not Showing
- Check if tool is installed (e.g., `which node` for Node segment)
- Verify segment is in config.json
- Check properties are correct

### Colors Look Wrong
- Check terminal color support: `echo $TERM`
- Verify hex colors are valid
- Try different color scheme

## Tips

- **Segments only show when relevant** - Python segment only shows in Python projects
- **Performance** - Disable slow segments if prompt is slow (git status, etc.)
- **Transient prompt** - Can configure different prompt for previous commands
- **Secondary prompt** - Can customize continuation prompt (for multi-line commands)

## Resources

- Official Docs: https://ohmyposh.dev/
- Theme Gallery: https://ohmyposh.dev/docs/themes
- Segment Reference: https://ohmyposh.dev/docs/segments/overview
- Color Palette: https://ohmyposh.dev/docs/configuration/colors

## Common Customizations

### Disable Git Status (for performance)
```json
"properties": {
  "fetch_status": false
}
```

### Show Full Path Instead of Folder
```json
"properties": {
  "style": "full"
}
```

### Change Time Format
```json
"template": " \ue017 {{ .CurrentDate | date \"2006-01-02 15:04\" }} "
```

### Add Custom Text
```json
{
  "type": "text",
  "style": "plain",
  "foreground": "#00ff00",
  "template": " 🚀 "
}
```

## Integration with Zshrc

Your zshrc already initializes oh-my-posh:
```bash
if command -v oh-my-posh &> /dev/null; then
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/powerlevel10k_modern.omp.json)"
fi
```

To use your custom config instead:
```bash
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.json)"
```

## Next Steps

1. Reload zshrc: `source ~/.zshrc`
2. Test prompt: Navigate to a git repo, Python project, etc.
3. Customize colors/segments as needed
4. Share your theme with others!
