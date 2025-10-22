# yt-x Shortcuts & Commands

## Opening yt-x

```bash
yt-x                    # Launch interactive TUI
yt-x -S "search term"   # Search directly
yt-x --search "query"   # Alternative search syntax
```

## Main Menu Navigation

- **↑/↓** - Navigate menu items
- **Enter** - Select item
- **q** - Quit
- **?** - Help menu

## Search & Browse

```bash
yt-x -S "linux tutorials"      # Search for videos
yt-x -S "music"                # Search music
yt-x --search "programming"    # Alternative syntax
```

## Video Playback

- **Enter** - Play selected video
- **Space** - Pause/Resume
- **f** - Fullscreen (in mpv)
- **q** - Quit player
- **j/k** - Seek backward/forward
- **< >** - Previous/Next video

## Download Videos

```bash
# Via UI:
# Main Menu → Download → Select video → Choose quality

# Downloaded to: ~/Videos/yt-x/
```

## Configuration

```bash
yt-x -e                 # Edit configuration
yt-x --edit-config      # Alternative syntax
```

Config files:
- `~/.config/yt-x/config.json` - Main settings
- `~/.config/yt-x/yt-x.conf` - Extended configuration

## Extensions

```bash
yt-x -x mix             # Load mix extension
yt-x -x downloads       # Load downloads extension
yt-x --extension name   # Alternative syntax
```

Available extensions in: `~/.config/yt-x/extensions/`

## Player & Selector Options

```bash
yt-x --player mpv       # Use mpv player
yt-x --player vlc       # Use VLC player
yt-x -p mpv             # Short form

yt-x -s fzf             # Use fzf selector
yt-x -s rofi            # Use rofi selector
yt-x --preferred-selector fzf
```

## Preview Options

```bash
yt-x --preview          # Enable preview window
yt-x --no-preview       # Disable preview window
```

## Utilities

```bash
yt-x --version          # Show version
yt-x --update           # Update script
yt-x --help             # Show help
yt-x -h                 # Short help
```

## Shell Completions

```bash
yt-x completions --zsh  # Generate zsh completions
yt-x completions --bash # Generate bash completions
yt-x completions --fish # Generate fish completions
```

## Desktop Integration

```bash
yt-x -E                 # Print desktop entry
yt-x --generate-desktop-entry > ~/.local/share/applications/yt-x.desktop
```

## Custom Features

### Recent Videos
- **Main Menu → Recent** - View recently watched videos
- Stored in: `~/.cache/yt-x/recent.json`
- Limit: 30 videos (configurable)

### Saved Videos
- **Main Menu → Saved** - View saved videos
- Stored in: `~/.config/yt-x/saved_videos.json`

### Custom Playlists
- **Main Menu → Custom Playlists**
- Edit: `~/.config/yt-x/custom_playlists.json`

### Custom Commands
- **Main Menu → Miscellaneous → Custom Commands**
- Edit: `~/.config/yt-x/custom_cmds.json`

## Advanced Usage

### Subscribe to Channels
```bash
# Main Menu → Subscriptions → Sync YouTube Subscriptions
# Requires browser cookies (Firefox/Chrome/Edge)
# Stored in: ~/.config/yt-x/subscriptions.json
```

### YouTube Mixes
```bash
# Main Menu → Mixes
# Generate and play YouTube algorithm mixes
```

### Extended Search
```bash
# Main Menu → Search → Extended Search
# Advanced search filters and options
```

## Tips

- **Keyboard-driven**: Navigate entirely with keyboard
- **Fzf integration**: Fuzzy search through results
- **Image previews**: Thumbnails shown in preview window
- **Browser cookies**: Enable access to private playlists/subscriptions
- **Download tracking**: Archive prevents re-downloading
- **Search history**: Automatically saved for quick access

## Configuration Reference

| Setting | Value | Description |
|---------|-------|-------------|
| `player` | mpv/vlc | Video player to use |
| `video_quality` | 1080/720/480 | Download quality |
| `audio_quality` | 192/128/256 | Audio bitrate |
| `download_directory` | ~/Videos/yt-x | Where to save videos |
| `enable_preview` | true/false | Show preview window |
| `image_renderer` | chafa/icat | Terminal image renderer |
| `preferred_selector` | fzf/rofi | Fuzzy finder tool |
| `editor` | nvim/vim | Text editor for config |
| `preferred_browser` | firefox/chrome | Browser for cookies |

## Common Workflows

**Watch YouTube:**
```bash
yt-x                    # Launch
# Search or browse
# Select video
# Press Enter to play
```

**Download Video:**
```bash
yt-x
# Search for video
# Select video
# Main Menu → Download
# Choose quality
# Wait for download
```

**Search & Play:**
```bash
yt-x -S "music"         # Search
# Select from results
# Press Enter to play
```

**Edit Config:**
```bash
yt-x -e                 # Opens in nvim
# Make changes
# Save and exit
# Changes apply immediately
```

## Troubleshooting

**No preview showing:**
- Check `enable_preview` is `true`
- Ensure `chafa` or `icat` is installed
- Try: `yt-x --preview`

**Downloads not working:**
- Check `download_directory` exists
- Ensure write permissions
- Try: `mkdir -p ~/Videos/yt-x`

**Player not starting:**
- Verify mpv is installed: `which mpv`
- Try: `yt-x --player mpv`

**Search not working:**
- Check internet connection
- Try: `yt-x --update` to update script
- Check: `REGION_CODE` and `LANGUAGE` settings

## Resources

- GitHub: https://github.com/Benexl/yt-x
- Dependencies: yt-dlp, mpv, fzf, chafa
- Config location: `~/.config/yt-x/`
- Cache location: `~/.cache/yt-x/`
