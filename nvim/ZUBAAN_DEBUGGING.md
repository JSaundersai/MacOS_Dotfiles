# Zubaan LSP & Python Debugging Guide

## What is Zubaan?

**Zubaan** is a high-performance Python Language Server and type checker written in Rust by the author of Jedi.

### Key Features
- **20-200× faster** than Mypy
- **50% less memory** than Pyright
- **Rust-based** - Blazing fast performance
- **PyRight-like mode** - Full type checking
- **Mypy-compatible mode** - Alternative checking
- **LSP support** - Full Neovim integration

### Why Zubaan over Pyright?
- ✅ Faster startup and response time
- ✅ Lower memory usage
- ✅ Better for large codebases
- ✅ Written in Rust (modern, performant)
- ✅ No hangs or freezes (unlike Pyright sometimes)

---

## Installation

### 1. Install Zubaan
```bash
pip install zuban
```

### 2. Verify Installation
```bash
zuban --version
zuban server --help
```

### 3. Install Debugpy (for debugging)
```bash
pip install debugpy
```

### 4. Install Delve (for Go debugging)
```bash
brew install delve  # macOS
# or
go install github.com/go-delve/delve/cmd/dlv@latest
```

---

## Zubaan Configuration

### In Neovim
Your config automatically uses Zubaan for Python LSP:

**File**: `lua/core/lsp.lua`
```lua
lspconfig.zubaan.setup({
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
      },
    },
  },
})
```

### Mason Installation
When you open Neovim:
```
:Mason
```

Install these tools:
- `zubaan` - Python LSP (auto-installed via pip)
- `debugpy` - Python debugger
- `black` - Code formatter
- `pylint` - Linter
- `delve` - Go debugger

---

## Python Debugging

### What's Included
- **nvim-dap** - Debug Adapter Protocol
- **nvim-dap-python** - Python debugging
- **nvim-dap-ui** - Visual debugging interface

### Debugging Keybindings

| Shortcut | Action |
|----------|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Set conditional breakpoint |
| `<leader>dc` | Continue execution |
| `<leader>dn` | Step over |
| `<leader>di` | Step into |
| `<leader>do` | Step out |
| `<leader>dr` | Open REPL |
| `<leader>dl` | Run last |
| `<leader>dq` | Terminate debugger |
| `<leader>du` | Toggle DAP UI |

### Debug Configurations

Your config includes these Python debug modes:

#### 1. Launch File
```
<leader>dc  # Continue after setting breakpoints
```
Debugs the current file directly.

#### 2. Launch with Arguments
```
<leader>dc  # Then enter arguments when prompted
```
Debug with command-line arguments.

#### 3. Django
```
<leader>dc
```
Debug Django development server.

#### 4. Flask
```
<leader>dc
```
Debug Flask development server.

#### 5. Pytest
```
<leader>dc
```
Debug pytest tests.

---

## Debugging Workflow

### Step 1: Set Breakpoint
```
1. Navigate to line in Python file
2. Press <leader>db to toggle breakpoint
3. Red dot (🔴) appears on line
```

### Step 2: Start Debugging
```
1. Press <leader>dc to continue/start
2. DAP UI opens on right side
3. Execution pauses at breakpoint
```

### Step 3: Navigate Execution
```
<leader>dn  # Step over (next line)
<leader>di  # Step into (enter function)
<leader>do  # Step out (exit function)
```

### Step 4: Inspect Variables
```
Hover over variables to see values
Use <leader>dr to open REPL for evaluation
```

### Step 5: Continue or Stop
```
<leader>dc  # Continue execution
<leader>dq  # Terminate debugger
```

---

## Conditional Breakpoints

### Set Condition
```
<leader>dB
# Enter condition: x > 10
```

Breakpoint only triggers when condition is true.

### Example Conditions
```
x > 10              # Value check
len(items) == 0     # Length check
name == "admin"     # String check
```

---

## REPL (Read-Eval-Print Loop)

### Open REPL
```
<leader>dr
```

### Evaluate Expressions
```
# In REPL, type:
x + y
len(my_list)
my_dict.keys()
```

### Print Variables
```
print(variable_name)
```

---

## DAP UI Layout

The DAP UI shows:
- **Left**: Scopes (local variables, globals)
- **Center**: Breakpoints, watches
- **Right**: Call stack, threads

### Toggle UI
```
<leader>du
```

---

## Go Debugging

Your config also includes Go debugging with Delve:

### Go Debug Keybindings
Same as Python:
- `<leader>db` - Toggle breakpoint
- `<leader>dc` - Continue
- `<leader>dn` - Step over
- `<leader>di` - Step into
- `<leader>do` - Step out

### Go Debug Configurations
1. **Attach** - Attach to running process
2. **Launch file** - Debug single file
3. **Launch package** - Debug package
4. **Launch test** - Debug tests

---

## Troubleshooting

### Zubaan Not Found
```bash
# Check installation
which zuban
zuban --version

# If not found, install:
pip install zuban
```

### Debugpy Not Found
```bash
# Install debugpy
pip install debugpy

# Verify
python -m debugpy --version
```

### Breakpoints Not Working
```
1. Check file is saved
2. Verify debugpy is installed
3. Try: <leader>dc to start debugging
4. Check DAP UI for errors
```

### DAP UI Not Opening
```
1. Try: <leader>du to toggle
2. Check: :DapInfo
3. Restart: :DapTerminate then <leader>dc
```

### Slow Debugging
```
1. Zubaan is fast for LSP
2. Debugging speed depends on debugpy
3. Try: <leader>dn (step over) instead of <leader>di (step into)
```

---

## Performance Comparison

### Zubaan vs Pyright

| Metric | Zubaan | Pyright |
|--------|--------|---------|
| Startup | <100ms | 200-500ms |
| Memory | ~50MB | ~100MB |
| Type Checking | 20-200× faster | Baseline |
| Hangs | Rare | Occasional |
| Language | Rust | Python |

---

## Advanced: Virtual Environments

### Using Project Virtual Environment
```bash
# Activate your project venv
source venv/bin/activate

# Start Neovim
nvim
```

Zubaan will automatically pick up dependencies from the active venv.

### Using Specific Python
```lua
-- In lua/core/dap.lua, modify:
pythonPath = function()
  return "/path/to/venv/bin/python"
end,
```

---

## Tips & Tricks

### Tip 1: Quick Debugging
```
1. Set breakpoint: <leader>db
2. Start: <leader>dc
3. Step: <leader>dn
4. Continue: <leader>dc
```

### Tip 2: Watch Expressions
In DAP UI, add watches for variables you want to monitor.

### Tip 3: Conditional Breakpoints
```
<leader>dB
# Enter: len(items) > 5
```
Only breaks when condition is true.

### Tip 4: Debug Tests
```
# Open test file
# Set breakpoint
# <leader>dc with "Launch test" config
```

### Tip 5: REPL Evaluation
```
<leader>dr  # Open REPL
# Type: my_var + 10
# Press Enter to evaluate
```

---

## Common Workflows

### Debugging a Script
```
1. Open script.py
2. <leader>db on line to debug
3. <leader>dc to start
4. <leader>dn to step
5. <leader>dr to inspect
```

### Debugging Django
```
1. Set breakpoint in view
2. <leader>dc with Django config
3. Make request to trigger breakpoint
4. Step through code
```

### Debugging Flask
```
1. Set breakpoint in route
2. <leader>dc with Flask config
3. Make request to trigger breakpoint
4. Inspect request/response
```

### Debugging Tests
```
1. Open test file
2. Set breakpoint in test
3. <leader>dc with Pytest config
4. Step through test
```

---

## Resources

- **Zubaan Docs**: https://docs.zubanls.com/
- **Zubaan GitHub**: https://github.com/zubanls/zuban
- **Debugpy Docs**: https://github.com/microsoft/debugpy
- **Delve Docs**: https://github.com/go-delve/delve
- **DAP Spec**: https://microsoft.github.io/debug-adapter-protocol/

---

## Summary

✅ **Zubaan** - Fast, modern Python LSP
✅ **Debugpy** - Python debugging
✅ **Delve** - Go debugging
✅ **DAP UI** - Visual debugging interface
✅ **REPL** - Interactive evaluation

Your Neovim is now configured for professional Python development with debugging!
