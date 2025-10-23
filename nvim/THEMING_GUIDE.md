# NvChad Theming Guide

## How to Change Themes

### Method 1: Edit chadrc.lua (Permanent)

**File**: `lua/chadrc.lua`

```lua
---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",  -- Change this to your theme
  transparency = true,
}

return M
```

### Method 2: Change Theme at Runtime

Inside Neovim:
```vim
:Telescope themes
```

Or use the command:
```vim
:colorscheme theme_name
```

### Method 3: Theme Toggle

Set two themes to toggle between:

**File**: `lua/chadrc.lua`

```lua
M.base46 = {
  theme = "catppuccin",           -- Default theme
  theme_toggle = { "catppuccin", "onedark" },  -- Themes to toggle
  transparency = true,
}
```

Then in Neovim:
```vim
:Telescope themes
```
Or create a keybinding to toggle.

---

## Available Themes in NvChad

NvChad comes with **68+ built-in themes**. Popular ones:

### Dark Themes
- `catppuccin` - Pastel colors (default)
- `onedark` - Atom-inspired
- `nord` - Arctic, north-bluish
- `gruvbox` - Retro groove
- `dracula` - Dark with vibrant colors
- `tokyonight` - Tokyo night vibes
- `nightfox` - Fox-inspired dark
- `monokai_pro` - Professional dark
- `ayu_dark` - Modern dark
- `everforest` - Green forest theme
- `material` - Material design
- `one_nvim` - One theme variants

### Light Themes
- `catppuccin_latte` - Light Catppuccin
- `tokyonight_day` - Light Tokyo night
- `ayu_light` - Light Ayu

### View All Themes
```vim
:Telescope themes
```

---

## Customizing Your Theme

### Edit chadrc.lua

```lua
---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = true,
  
  -- Override specific highlight groups
  hl_override = {
    ["@comment"] = { italic = true },
    ["@keyword"] = { italic = true },
    ["LineNr"] = { fg = "#888888" },
  },
  
  -- Add custom highlights
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },
}

return M
```

### Transparency

Enable/disable background transparency:

```lua
M.base46 = {
  transparency = true,   -- Transparent background
  -- or
  transparency = false,  -- Opaque background
}
```

---

## Theme Configuration Options

### In chadrc.lua

```lua
M.base46 = {
  -- Theme name
  theme = "catppuccin",
  
  -- Transparency
  transparency = true,
  
  -- Toggle between two themes
  theme_toggle = { "catppuccin", "onedark" },
  
  -- Override highlight groups
  hl_override = {
    ["@comment"] = { italic = true },
  },
  
  -- Add new highlights
  hl_add = {
    MyCustomGroup = { fg = "#ffffff", bg = "#000000" },
  },
  
  -- Changed themes (for tracking)
  changed_themes = {},
  
  -- Integrations with other plugins
  integrations = {},
}
```

---

## Popular Theme Combinations

### Minimal & Clean
```lua
theme = "catppuccin",
transparency = true,
```

### Professional
```lua
theme = "onedark",
transparency = false,
```

### Vibrant
```lua
theme = "dracula",
transparency = true,
```

### Retro
```lua
theme = "gruvbox",
transparency = false,
```

### Modern
```lua
theme = "tokyonight",
transparency = true,
```

---

## Creating Custom Highlights

### Example: Custom Colors

```lua
M.base46 = {
  theme = "catppuccin",
  hl_override = {
    -- Make comments italic and dimmed
    ["@comment"] = { italic = true, fg = "#888888" },
    
    -- Make keywords bold
    ["@keyword"] = { bold = true },
    
    -- Custom line number color
    LineNr = { fg = "#666666" },
    
    -- Custom cursor line
    CursorLine = { bg = "#1e1e1e" },
  },
}
```

### Available Highlight Groups
- `@comment` - Comments
- `@keyword` - Keywords
- `@string` - Strings
- `@function` - Functions
- `@variable` - Variables
- `LineNr` - Line numbers
- `CursorLine` - Cursor line
- `StatusLine` - Status line
- `TabLine` - Tab line

---

## Keybinding for Theme Toggle

Add to `lua/core/mappings.lua`:

```lua
-- Theme toggle
vim.keymap.set("n", "<leader>tt", function()
  require("nvchad.themes").toggle()
end, { desc = "Toggle theme" })
```

Then use: `<leader>tt` to toggle between themes.

---

## Theme Persistence

Themes are automatically saved in:
```
~/.local/share/nvim/nvchad/
```

Your choice persists across sessions.

---

## Troubleshooting

### Theme Not Changing
1. Edit `lua/chadrc.lua`
2. Restart Neovim
3. Check: `:colorscheme` to see current theme

### Colors Look Wrong
1. Check terminal supports 256 colors: `echo $TERM`
2. Should be `xterm-256color` or `tmux-256color`
3. Try: `:set termguicolors`

### Transparency Not Working
1. Check terminal supports transparency
2. Kitty supports it by default
3. Try: `transparency = false` if issues

---

## Your Current Setup

**File**: `lua/chadrc.lua`

```lua
M.base46 = {
  theme = "ayu_dark",
  transparency = true,
  theme_toggle = { "ayu_dark", "onedark" },
}
```

### To Change:
1. Edit `lua/chadrc.lua`
2. Change `theme = "your_theme"`
3. Restart Neovim

### To Toggle:
```vim
:Telescope themes
```

---

## Resources

- **NvChad Themes**: https://nvchad.com/themes
- **NvChad Theming Docs**: https://nvchad.com/docs/config/theming/
- **Base46 Highlights**: `:h nvui.base46`

---

## Summary

✅ Change theme in `lua/chadrc.lua`
✅ 68+ built-in themes available
✅ Toggle between themes with `:Telescope themes`
✅ Customize with `hl_override` and `hl_add`
✅ Enable/disable transparency
✅ Themes persist across sessions
