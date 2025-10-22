# Qutebrowser Keyboard Shortcuts

## Opening Qutebrowser

**From terminal:**
```bash
qutebrowser
```

**Open specific URL:**
```bash
qutebrowser https://www.perplexity.ai
```

**Open in new window:**
```bash
qutebrowser --new-instance
```

**Open private window:**
```bash
qutebrowser --private
```

**From Kitty:**
- Create an alias in your shell profile or use: `qutebrowser &`

## Navigation
- **h/j/k/l** - Left/Down/Up/Right (Vim-style)
- **gg** - Go to top of page
- **G** - Go to bottom of page
- **gh** - Go to home page
- **gH** - Go back
- **gl** - Go forward
- **H** - Back (history)
- **L** - Forward (history)

## Tabs
- **J** - Previous tab
- **K** - Next tab
- **gt** - Focus tab (number)
- **gT** - Focus previous tab
- **x** - Close tab
- **u** - Undo closed tab
- **U** - Undo closed window
- **t** - New tab
- **w** - New window

## Links & Hints
- **f** - Follow link (hints mode)
- **F** - Follow link in new tab
- **;i** - Hint images
- **;o** - Hint links to open
- **;y** - Hint links to yank

## Searching
- **/** - Search on page
- **?** - Search backwards
- **n** - Next search result
- **N** - Previous search result
- **\*** - Search word under cursor
- **#** - Search word under cursor backwards

## Yanking & Pasting
- **yy** - Yank URL
- **yY** - Yank selected text
- **pp** - Open clipboard URL
- **pP** - Open clipboard URL in new tab

## Zoom
- **zi** - Zoom in
- **zo** - Zoom out
- **z0** - Reset zoom

## View & Source
- **gf** - View source
- **gi** - Focus input field
- **;s** - Save page

## Custom Bindings
- **,m** - Play video in mpv
- **,p** - Play video in mpv (best quality)
- **,d** - Download
- **,s** - View source

## Search Engines
Type in address bar with prefix:
- **g** - Google (default)
- **gh** - GitHub search
- **yt** - YouTube
- **ddg** - DuckDuckGo
- **wiki** - Wikipedia

Example: `:open gh qutebrowser` searches GitHub for "qutebrowser"

## Command Mode
- **:** - Enter command mode
- **:set** - Open settings
- **:help** - Open help
- **:config-cycle** - Cycle setting values
- **:spawn** - Run external command

## Misc
- **Ctrl+L** - Select address bar
- **Ctrl+H** - Open history
- **Ctrl+B** - Open bookmarks
- **Ctrl+Shift+B** - Manage bookmarks
- **Ctrl+Shift+Del** - Clear browsing data
- **Ctrl+Q** - Quit

## Configuration
Config file: `~/.config/qutebrowser/config.py`

To reload config: `:config-source`

To bind custom keys: `:bind <key> <command>`
