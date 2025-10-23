# OpenCode & Theming - Added ✅

## What Was Added

### 1. OpenCode AI Agent Integration
- **opencode.nvim** plugin for Neovim
- Terminal-based AI coding agent
- Context-aware prompts with placeholders
- Auto-reload when OpenCode edits files
- Multiple AI models support

### 2. Theming Guide
- How to change themes in NvChad
- 68+ built-in themes available
- Custom highlight configuration
- Transparency settings

---

## OpenCode Installation

### Step 1: Install OpenCode CLI
```bash
npm install -g @opencode/cli
```

### Step 2: Configure
```bash
opencode init
opencode config set api_key YOUR_KEY
```

### Step 3: Ready to Use
Plugin is already in your Neovim config!

---

## OpenCode Keybindings

| Shortcut | Action |
|----------|--------|
| `<leader>oa` | Ask about this code |
| `<leader>os` | Select prompt |
| `<leader>o+` | Add to context |
| `<leader>ot` | Toggle terminal |
| `<leader>oe` | Explain |
| `<leader>oo` | Optimize |
| `<leader>od` | Document |
| `<leader>or` | Review |
| `<leader>of` | Fix diagnostics |

---

## Theming

### Change Theme
Edit `lua/chadrc.lua`:
```lua
M.base46 = {
  theme = "catppuccin",  -- Change this
  transparency = true,
}
```

### Popular Themes
- `catppuccin` - Pastel (default)
- `onedark` - Atom-inspired
- `dracula` - Dark vibrant
- `tokyonight` - Modern
- `gruvbox` - Retro
- `nord` - Arctic blue

### View All Themes
```vim
:Telescope themes
```

### Toggle Themes
```lua
M.base46 = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "onedark" },
}
```

---

## Files Created

1. **lua/plugins/opencode.lua** - OpenCode configuration
2. **OPENCODE_GUIDE.md** - Complete OpenCode guide
3. **THEMING_GUIDE.md** - Complete theming guide
4. **OPENCODE_THEMING_SUMMARY.md** - This file

---

## Configuration Files

### OpenCode Config
**File**: `lua/plugins/opencode.lua`
- Keybindings for all OpenCode commands
- Auto-reload configuration
- Prompt library setup

### Theme Config
**File**: `lua/chadrc.lua`
- Theme selection
- Transparency
- Highlight overrides

---

## Quick Start

### 1. Install OpenCode
```bash
npm install -g @opencode/cli
opencode init
```

### 2. Change Theme (Optional)
```lua
-- Edit lua/chadrc.lua
M.base46 = {
  theme = "dracula",  -- or any theme
}
```

### 3. Use OpenCode
```vim
<leader>oa  " Ask about code
<leader>oe  " Explain
<leader>oo  " Optimize
```

---

## OpenCode Context Placeholders

| Placeholder | Meaning |
|-------------|---------|
| `@this` | Current function/class |
| `@buffer` | Entire file |
| `@selection` | Selected text |
| `@diagnostics` | LSP errors |
| `@diff` | Git changes |
| `@cursor` | Code at cursor |

### Example
```vim
" Explain current function
<leader>oa
# Type: Explain @this
```

---

## Theming Customization

### Override Highlights
```lua
M.base46 = {
  theme = "catppuccin",
  hl_override = {
    ["@comment"] = { italic = true },
    ["@keyword"] = { bold = true },
  },
}
```

### Add Custom Highlights
```lua
hl_add = {
  MyCustom = { fg = "#ffffff", bg = "#000000" },
}
```

---

## Troubleshooting

### OpenCode Not Found
```bash
npm install -g @opencode/cli
```

### Theme Not Changing
1. Edit `lua/chadrc.lua`
2. Restart Neovim
3. Check: `:colorscheme`

### Plugin Not Loading
```vim
:Lazy sync
:checkhealth opencode
```

---

## Documentation

- **OPENCODE_GUIDE.md** - Full OpenCode documentation
- **THEMING_GUIDE.md** - Full theming documentation
- **shortcuts.md** - All keybindings

---

## Next Steps

### Phase 2: More Plugins
- [ ] Formatting (conform.nvim)
- [ ] Linting (nvim-lint)
- [ ] Git UI (lazygit.nvim)
- [ ] Navigation (harpoon)
- [ ] Undo (undotree)

### Phase 3: Customization
- [ ] Custom keybindings
- [ ] Custom prompts for OpenCode
- [ ] Theme customization
- [ ] LSP configuration

---

## Summary

✅ **OpenCode** - AI coding agent integrated
✅ **9 keybindings** - Quick access to AI features
✅ **Theming** - 68+ themes available
✅ **Auto-reload** - Files update when OpenCode edits
✅ **Context injection** - Smart prompt placeholders

Your Neovim now has:
- Professional AI assistance
- Beautiful theming
- Extensible configuration

Ready to add more plugins or customize further!
