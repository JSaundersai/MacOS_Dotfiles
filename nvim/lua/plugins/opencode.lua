-- OpenCode AI Agent Integration
-- Terminal-based AI coding agent with Neovim integration

return {
  {
    "NickvanDyke/opencode.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/snacks.nvim",
    },
    config = function()
      vim.g.opencode_opts = {
        -- Auto-reload buffers when opencode edits files
        auto_reload = true,
        -- Auto-register completion sources
        auto_register_cmp_sources = true,
      }

      -- Keybindings for OpenCode
      local keymap = vim.keymap

      -- Ask about selected code
      keymap.set({ "n", "x" }, "<leader>oa", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask about this" })

      -- Select from prompt library
      keymap.set({ "n", "x" }, "<leader>os", function()
        require("opencode").select()
      end, { desc = "Select prompt" })

      -- Add current code to context
      keymap.set({ "n", "x" }, "<leader>o+", function()
        require("opencode").prompt("@this")
      end, { desc = "Add this to context" })

      -- Toggle embedded OpenCode terminal
      keymap.set("n", "<leader>ot", function()
        require("opencode").toggle()
      end, { desc = "Toggle embedded OpenCode" })

      -- Select command
      keymap.set("n", "<leader>oc", function()
        require("opencode").command()
      end, { desc = "Select command" })

      -- New session
      keymap.set("n", "<leader>on", function()
        require("opencode").command("session_new")
      end, { desc = "New OpenCode session" })

      -- Interrupt session
      keymap.set("n", "<leader>oi", function()
        require("opencode").command("session_interrupt")
      end, { desc = "Interrupt session" })

      -- Cycle agent
      keymap.set("n", "<leader>oA", function()
        require("opencode").command("agent_cycle")
      end, { desc = "Cycle agent" })

      -- Messages navigation
      keymap.set("n", "<S-C-u>", function()
        require("opencode").command("messages_half_page_up")
      end, { desc = "Messages half page up" })

      keymap.set("n", "<S-C-d>", function()
        require("opencode").command("messages_half_page_down")
      end, { desc = "Messages half page down" })

      -- Convenience: Explain this code
      keymap.set({ "n", "x" }, "<leader>oe", function()
        local explain = require("opencode.config").opts.prompts.explain
        require("opencode").prompt(explain.prompt, explain)
      end, { desc = "Explain this" })

      -- Convenience: Optimize this code
      keymap.set({ "n", "x" }, "<leader>oo", function()
        local optimize = require("opencode.config").opts.prompts.optimize
        require("opencode").prompt(optimize.prompt, optimize)
      end, { desc = "Optimize this" })

      -- Convenience: Document this code
      keymap.set({ "n", "x" }, "<leader>od", function()
        local document = require("opencode.config").opts.prompts.document
        require("opencode").prompt(document.prompt, document)
      end, { desc = "Document this" })

      -- Convenience: Test this code
      keymap.set({ "n", "x" }, "<leader>ot", function()
        local test = require("opencode.config").opts.prompts.test
        require("opencode").prompt(test.prompt, test)
      end, { desc = "Test this" })

      -- Convenience: Review this code
      keymap.set({ "n", "x" }, "<leader>or", function()
        local review = require("opencode.config").opts.prompts.review
        require("opencode").prompt(review.prompt, review)
      end, { desc = "Review this" })

      -- Convenience: Fix diagnostics
      keymap.set("n", "<leader>of", function()
        local fix = require("opencode.config").opts.prompts.fix
        require("opencode").prompt(fix.prompt, fix)
      end, { desc = "Fix diagnostics" })
    end,
  },
}
