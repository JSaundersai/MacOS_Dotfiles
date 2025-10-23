# NvChad Default Plugins & Features

## What NvChad Provides Out-of-the-Box

NvChad is a **lightweight framework** (~900 LOC) built on top of Neovim with lazy.nvim. It provides:

### Core Philosophy
- **Fast startup** - ~0.02-0.07 seconds
- **95% lazy loaded** - Plugins only load when needed
- **Beautiful UI** - Custom statusline, bufferline, themes
- **Highly customizable** - Override/extend everything
- **Lua-based** - Clean, modern configuration

---

## NvChad Default Plugins (Built-in)

### UI & Theme (NvChad Managed)
1. **base46** - NvChad's theming system (68 themes)
2. **nvchad/ui** - Custom statusline, bufferline, tabufline
3. **nvchad/base46** - Color scheme management

### Essential Plugins (Always Included)
1. **lazy.nvim** - Plugin manager
2. **plenary.nvim** - Lua utility library (dependency)
3. **nvim-web-devicons** - File icons

### LSP & Completion (Included)
1. **nvim-lspconfig** - LSP configuration
2. **nvim-cmp** - Completion engine
3. **cmp-nvim-lsp** - LSP source for cmp
4. **cmp-buffer** - Buffer source
5. **cmp-path** - Path source
6. **cmp-nvim-lua** - Lua source
7. **LuaSnip** - Snippet engine
8. **friendly-snippets** - Pre-made snippets
9. **cmp_luasnip** - LuaSnip source

### Syntax & Parsing (Included)
1. **nvim-treesitter** - Syntax highlighting & parsing
2. **nvim-ts-autotag** - Auto-close HTML/JSX tags

### Navigation (Included)
1. **telescope.nvim** - Fuzzy finder
2. **telescope-fzf-native.nvim** - Native fzf backend
3. **nvim-tree.lua** - File explorer

### Utilities (Included)
1. **nvim-autopairs** - Auto-close brackets
2. **Comment.nvim** - Toggle comments
3. **nvim-surround** - Surround text objects
4. **gitsigns.nvim** - Git signs in gutter
5. **which-key.nvim** - Keybinding help
6. **nvim-notify** - Notification system
7. **dressing.nvim** - Better UI dialogs

### Debugging (Optional, Not Enabled by Default)
- nvim-dap - Debug adapter protocol

---

## What Your Current Config Has EXTRA (Not in Default NvChad)

### AI Tools (4 plugins)
- Copilot.vim
- Avante.nvim
- Minuet-ai.nvim
- Tabnine-nvim

### Language-Specific
- typescript-tools.nvim
- nvim-dap-python
- nvim-dap-ui
- nvim-dap-virtual-text

### Productivity
- Harpoon - Quick marks
- Undotree - Visual undo
- Vim-maximizer - Pane maximize
- Lazygit.nvim - Git UI
- Codesnap.nvim - Screenshot code
- Devcontainer.nvim - Dev container support
- Todo-comments.nvim - TODO highlighting
- Snacks.nvim - Utility functions
- Barbecue.nvim - Breadcrumb nav
- Nvim-navic - Navigation context
- Nvim-lint - Linter integration
- Conform.nvim - Formatter
- Trouble.nvim - Diagnostics
- Vim-tmux-navigator - Tmux integration

### Formatting & Linting
- conform.nvim
- nvim-lint

---

## Minimal NvChad Setup Strategy

### Phase 1: Core Only (This Phase)
Keep:
- ✅ NvChad framework (base46, ui, lazy.nvim)
- ✅ LSP & Completion (lspconfig, cmp, LuaSnip)
- ✅ Treesitter (syntax highlighting)
- ✅ Telescope (fuzzy finding)
- ✅ Nvim-tree (file explorer)
- ✅ Autopairs, Comment, Surround (essentials)
- ✅ Gitsigns (git integration)
- ✅ Which-key (help)
- ✅ Notify (notifications)

Remove:
- ❌ All AI tools (Copilot, Avante, Minuet, Tabnine)
- ❌ Debugging tools (DAP, DAP-UI, DAP-Python)
- ❌ Extra utilities (Harpoon, Undotree, Maximizer, Codesnap, etc.)
- ❌ Formatting/Linting (Conform, Nvim-lint, Trouble)
- ❌ Language-specific (TypeScript-tools)
- ❌ Lazygit, Devcontainer, Todo-comments, Snacks, Barbecue, Navic

### Phase 2: Add Back Selectively
Based on your workflow:
- **Backend Focus**: Python, Go, C/C++ LSPs
- **DevOps**: Docker, SSH, AWS/Azure tools
- **Frontend**: React, TypeScript, MongoDB
- **Debugging**: DAP for Python/Go
- **Formatting**: Conform for code style
- **Git**: Lazygit for workflow
- **Navigation**: Harpoon for quick marks

---

## Your Tech Stack & Recommended Plugins

### Backend (Python, Go, C/C++)
**Essential**:
- nvim-lspconfig (already included)
- mason.nvim (LSP installer)
- mason-tool-installer.nvim (auto-install)

**Add Later**:
- nvim-dap (debugging)
- nvim-dap-python (Python debugging)
- conform.nvim (formatting)
- nvim-lint (linting)

### Frontend (React, TypeScript)
**Essential**:
- nvim-lspconfig (already included)
- nvim-treesitter (already included)
- nvim-ts-autotag (already included)

**Add Later**:
- typescript-tools.nvim (TypeScript-specific)
- conform.nvim (formatting)

### DevOps (Docker, SSH, AWS/Azure)
**Essential**:
- telescope.nvim (file search)
- gitsigns.nvim (git integration)

**Add Later**:
- Lazygit.nvim (git UI)
- Custom keybindings for SSH/AWS

### Database (MongoDB)
**Essential**:
- telescope.nvim (search)
- nvim-cmp (completion)

**Add Later**:
- Custom snippets for queries
- LSP if available

---

## NvChad Configuration Files

### Default Structure
```
nvim/
├── init.lua              # Entry point
├── lua/
│   ├── config/           # NvChad config
│   │   ├── init.lua
│   │   ├── options.lua
│   │   └── mappings.lua
│   └── plugins/          # Your custom plugins
│       └── init.lua      # Plugin specs
```

### Key Files to Customize
1. **chadrc.lua** - Theme, UI, LSP settings
2. **options.lua** - Vim options
3. **mappings.lua** - Keybindings
4. **plugins/init.lua** - Plugin list

---

## Minimal Config Checklist

- [ ] Keep NvChad framework
- [ ] Keep lazy.nvim
- [ ] Keep LSP/Completion stack
- [ ] Keep Treesitter
- [ ] Keep Telescope
- [ ] Keep Nvim-tree
- [ ] Keep essentials (autopairs, comment, surround)
- [ ] Keep gitsigns
- [ ] Remove all AI tools
- [ ] Remove all DAP tools
- [ ] Remove extra utilities
- [ ] Remove formatting/linting (add back later)
- [ ] Add Mason for LSP installation
- [ ] Configure for Python, Go, C/C++, TypeScript

---

## Next Steps

1. **Backup current config** ✓
2. **Create minimal init.lua** - Keep NvChad structure
3. **Create minimal plugins/init.lua** - Only essentials
4. **Create chadrc.lua** - Theme & UI config
5. **Create options.lua** - Editor settings
6. **Create mappings.lua** - Keybindings
7. **Add Mason configuration** - LSP installer
8. **Test startup time** - Should be <100ms
9. **Add back plugins one-by-one** - As needed

---

## Performance Expectations

**Current Config**: ~40 plugins = slower startup
**Minimal Config**: ~15 plugins = <50ms startup
**Target**: Fast, focused, extensible
