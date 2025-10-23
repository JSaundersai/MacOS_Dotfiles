-- DAP (Debug Adapter Protocol) Configuration
-- Python debugging with debugpy

local dap = require("dap")
local dap_python = require("dap-python")

-- Configure Python debugging with debugpy
-- Install: pip install debugpy
dap_python.setup("python")
dap_python.test_runner = "pytest"

-- Keybindings for debugging
local keymap = vim.keymap

-- Debugging keybindings
keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Set conditional breakpoint" })
keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue execution" })
keymap.set("n", "<leader>dn", dap.step_over, { desc = "Step over" })
keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
keymap.set("n", "<leader>do", dap.step_out, { desc = "Step out" })
keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run last" })
keymap.set("n", "<leader>dq", dap.terminate, { desc = "Terminate debugger" })

-- DAP UI keybindings
local dapui = require("dapui")
keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })

-- DAP signs
vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🟡", texthl = "DapBreakpointCondition" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🟠", texthl = "DapBreakpointRejected" })
vim.fn.sign_define("DapLogPoint", { text = "📍", texthl = "DapLogPoint" })
vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "DapStopped" })

-- DAP configurations
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return "python"
    end,
  },
  {
    type = "python",
    request = "launch",
    name = "Launch with arguments",
    program = "${file}",
    args = function()
      local args_string = vim.fn.input("Arguments: ")
      return vim.split(args_string, " +")
    end,
    pythonPath = function()
      return "python"
    end,
  },
  {
    type = "python",
    request = "launch",
    name = "Django",
    program = "${workspaceFolder}/manage.py",
    args = { "runserver" },
    pythonPath = function()
      return "python"
    end,
  },
  {
    type = "python",
    request = "launch",
    name = "Flask",
    program = "${file}",
    env = { FLASK_APP = "${file}", FLASK_ENV = "development" },
    pythonPath = function()
      return "python"
    end,
  },
  {
    type = "python",
    request = "launch",
    name = "Pytest",
    module = "pytest",
    args = { "${file}" },
    pythonPath = function()
      return "python"
    end,
  },
}

-- Go debugging with delve
dap.adapters.go = {
  type = "executable",
  command = "dlv",
  args = { "dap" },
}

dap.configurations.go = {
  {
    type = "go",
    name = "Attach",
    mode = "local",
    request = "attach",
    processId = require("dap.utils").pick_process,
    showLog = false,
  },
  {
    type = "go",
    name = "Launch file",
    request = "launch",
    program = "${file}",
    showLog = false,
  },
  {
    type = "go",
    name = "Launch package",
    request = "launch",
    program = "${fileDirname}",
    showLog = false,
  },
  {
    type = "go",
    name = "Launch test",
    request = "launch",
    mode = "test",
    program = "${fileDirname}",
    showLog = false,
  },
}
