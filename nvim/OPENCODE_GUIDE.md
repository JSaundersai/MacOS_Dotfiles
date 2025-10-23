# OpenCode AI Agent Integration Guide

## What is OpenCode?

**OpenCode** is a terminal-based AI coding agent built for developers. It provides:
- AI-powered code analysis and generation
- Terminal-first workflow
- Integration with Neovim via `opencode.nvim`
- Support for multiple AI models
- Real-time code editing

**opencode.nvim** bridges OpenCode and Neovim, allowing you to:
- Send code to OpenCode for analysis
- Get AI suggestions directly in editor
- Auto-reload files edited by OpenCode
- Use prompts with context injection

---

## Installation

### Step 1: Install OpenCode CLI
```bash
# Using npm
npm install -g @opencode/cli

# Or using Homebrew (if available)
brew install opencode
```

### Step 2: Verify Installation
```bash
opencode --version
opencode --help
```

### Step 3: Configure OpenCode
```bash
# Initialize OpenCode
opencode init

# Set your API key (Claude, OpenAI, etc.)
opencode config set api_key YOUR_KEY
```

### Step 4: Neovim Plugin
Already included in your config! Just run:
```
:Lazy sync
```

---

## Quick Start

### 1. Start OpenCode Terminal
```vim
<leader>ot  " Toggle embedded OpenCode terminal
```

### 2. Ask About Code
```vim
<leader>oa  " Ask about selected code
```

### 3. Select Prompt
```vim
<leader>os  " Choose from prompt library
```

### 4. Get Suggestions
OpenCode analyzes and provides suggestions in the terminal.

---

## Keybindings

### Main Commands

| Shortcut | Action |
|----------|--------|
| `<leader>oa` | Ask about this code |
| `<leader>os` | Select prompt from library |
| `<leader>o+` | Add this code to context |
| `<leader>ot` | Toggle embedded OpenCode |
| `<leader>oc` | Select command |
| `<leader>on` | New session |
| `<leader>oi` | Interrupt session |
| `<leader>oA` | Cycle agent/model |

### Convenience Shortcuts

| Shortcut | Action |
|----------|--------|
| `<leader>oe` | Explain this code |
| `<leader>oo` | Optimize this code |
| `<leader>od` | Document this code |
| `<leader>ot` | Test this code |
| `<leader>or` | Review this code |
| `<leader>of` | Fix diagnostics |

### Navigation

| Shortcut | Action |
|----------|--------|
| `<S-C-u>` | Messages half page up |
| `<S-C-d>` | Messages half page down |

---

## Context Placeholders

When using prompts, these placeholders are replaced with actual context:

| Placeholder | Content |
|-------------|---------|
| `@this` | Current function/class |
| `@buffer` | Entire current buffer |
| `@buffers` | All open buffers |
| `@cursor` | Code around cursor |
| `@selection` | Selected text |
| `@visible` | Visible code in viewport |
| `@diagnostics` | LSP diagnostics |
| `@quickfix` | Quickfix list |
| `@diff` | Git diff |

### Example Prompts
```
"Explain @this"           # Explain current function
"Optimize @selection"     # Optimize selected code
"Fix @diagnostics"        # Fix errors from LSP
"Test @buffer"            # Write tests for file
"Review @this"            # Code review
```

---

## Built-in Prompts

### Explain
```
Explain @this
```
Provides detailed explanation of code.

### Optimize
```
Optimize @this
```
Suggests performance improvements.

### Document
```
Document @this
```
Generates documentation/comments.

### Test
```
Test @this
```
Generates test cases.

### Review
```
Review @this
```
Performs code review.

### Fix
```
Fix @diagnostics
```
Fixes errors from LSP diagnostics.

### Diff
```
Diff @diff
```
Analyzes git changes.

---

## Workflow Examples

### Example 1: Explain a Function
```
1. Navigate to function
2. Press <leader>oe (Explain)
3. OpenCode analyzes and explains
4. Read explanation in terminal
```

### Example 2: Optimize Code
```
1. Select code block
2. Press <leader>oo (Optimize)
3. Get optimization suggestions
4. Apply changes manually or let OpenCode edit
```

### Example 3: Fix Errors
```
1. LSP shows errors
2. Press <leader>of (Fix diagnostics)
3. OpenCode suggests fixes
4. Auto-reload when OpenCode edits
```

### Example 4: Generate Tests
```
1. Open test file
2. Press <leader>ot (Test)
3. OpenCode generates test cases
4. Review and refine
```

### Example 5: Code Review
```
1. Select code to review
2. Press <leader>or (Review)
3. Get detailed review feedback
4. Address suggestions
```

---

## Commands

### Session Management

| Command | Action |
|---------|--------|
| `session_new` | Start new session |
| `session_share` | Share session |
| `session_interrupt` | Stop current operation |
| `session_compact` | Compact session |

### Navigation

| Command | Action |
|---------|--------|
| `messages_page_up` | Scroll up |
| `messages_page_down` | Scroll down |
| `messages_half_page_up` | Scroll up half |
| `messages_half_page_down` | Scroll down half |
| `messages_first` | Jump to first |
| `messages_last` | Jump to last |

### Editing

| Command | Action |
|---------|--------|
| `messages_copy` | Copy message |
| `messages_undo` | Undo |
| `messages_redo` | Redo |

### Models

| Command | Action |
|---------|--------|
| `agent_cycle` | Switch AI model |

---

## Configuration

### In lua/plugins/opencode.lua

```lua
vim.g.opencode_opts = {
  -- Auto-reload files when OpenCode edits them
  auto_reload = true,
  
  -- Auto-register completion sources
  auto_register_cmp_sources = true,
  
  -- Custom prompts
  prompts = {
    custom_prompt = {
      prompt = "Your custom prompt with @this",
    },
  },
}
```

---

## Auto-Reload

When OpenCode edits files, Neovim automatically reloads them:

```lua
vim.g.opencode_opts = {
  auto_reload = true,  -- Enable auto-reload
}
```

This requires:
```lua
vim.o.autoread = true  -- Already set in config
```

---

## Integration with Other Tools

### With LSP
OpenCode can fix LSP diagnostics:
```vim
<leader>of  " Fix @diagnostics
```

### With Git
OpenCode can analyze diffs:
```vim
<leader>oa  " Ask about @diff
```

### With Telescope
Use Telescope to select prompts:
```vim
<leader>os  " Select from prompt library
```

---

## Troubleshooting

### OpenCode Not Found
```bash
# Check installation
which opencode
opencode --version

# If not found, install:
npm install -g @opencode/cli
```

### Plugin Not Loading
```vim
:Lazy sync
:checkhealth opencode
```

### Terminal Not Showing
```vim
<leader>ot  " Toggle terminal
```

### Auto-reload Not Working
```lua
-- Check in lua/plugins/opencode.lua:
vim.o.autoread = true
vim.g.opencode_opts.auto_reload = true
```

---

## Tips & Tricks

### Tip 1: Custom Prompts
Create custom prompts for your workflow:
```lua
prompts = {
  refactor = {
    prompt = "Refactor @this for readability",
  },
}
```

### Tip 2: Quick Explanations
```vim
<leader>oe  " Instant explanation
```

### Tip 3: Batch Operations
```vim
<leader>os  " Select prompt
# Multiple files can be processed
```

### Tip 4: Session Sharing
```vim
<leader>on  " New session
<leader>oc  " Select session_share
```

### Tip 5: Model Switching
```vim
<leader>oA  " Cycle through available models
```

---

## Workflow Integration

### Python Development
```
1. Write function
2. <leader>oe to explain
3. <leader>oo to optimize
4. <leader>ot to generate tests
5. <leader>or for code review
```

### Bug Fixing
```
1. LSP shows errors
2. <leader>of to fix diagnostics
3. Review changes
4. <leader>on for new session if needed
```

### Documentation
```
1. Select code
2. <leader>od to generate docs
3. Review and refine
4. Commit changes
```

---

## Resources

- **OpenCode Docs**: https://opencode.ai/docs
- **opencode.nvim**: https://github.com/NickvanDyke/opencode.nvim
- **OpenCode CLI**: https://github.com/sst/opencode

---

## Summary

✅ Terminal-based AI coding agent
✅ Integrated with Neovim
✅ Context-aware prompts
✅ Auto-reload edited files
✅ Multiple AI models supported
✅ Rich keybindings for quick access

Your Neovim now has professional AI-assisted development!
