-- Minimal NvChad Plugin Configuration
-- Backend focused: Python, Go, C/C++, React/TypeScript, DevOps
-- Only essentials included - add more as needed

return {
  -- ===== LSP & Completion (Core) =====
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require("core.lsp")
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = {
      ensure_installed = {
        -- Python (Zubaan - high-performance LSP in Rust)
        "debugpy",
        "black",
        "pylint",
        -- Go
        "gopls",
        "gofumpt",
        "delve",
        -- C/C++
        "clangd",
        -- TypeScript/JavaScript
        "typescript-language-server",
        "prettier",
        -- YAML/JSON
        "yaml-language-server",
        "json-lsp",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = { "zubaan", "gopls", "clangd", "ts_ls" },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  {
    "hrsh7th/cmp-nvim-lsp",
    event = "InsertEnter",
  },

  {
    "hrsh7th/cmp-buffer",
    event = "InsertEnter",
  },

  {
    "hrsh7th/cmp-path",
    event = "InsertEnter",
  },

  {
    "hrsh7th/cmp-nvim-lua",
    event = "InsertEnter",
  },

  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    build = "make install_jsregexp",
    config = function()
      require("luasnip").config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })
    end,
  },

  {
    "saadparwaiz1/cmp_luasnip",
    event = "InsertEnter",
  },

  {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  },

  -- ===== Syntax & Parsing =====
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "go", "c", "cpp", "typescript", "javascript", "yaml", "json", "lua", "vim", "bash" },
        highlight = {
          enable = true,
          use_languagetree = true,
        },
        indent = { enable = true },
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },

  -- ===== Navigation & Search =====
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
      })
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        renderer = { icons = { show = { git = true } } },
      })
    end,
  },

  -- ===== Editor Enhancements =====
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      fast_wrap = {},
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = "v", desc = "Comment toggle linewise" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = "v", desc = "Comment toggle blockwise" },
    },
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    version = "*",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- ===== Git Integration =====
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- ===== UI & Utilities =====
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>" },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 400
    end,
    config = function()
      require("which-key").setup({
        preset = "helix",
      })
    end,
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
      vim.notify = require("notify")
    end,
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require("dressing").setup({})
    end,
  },

  -- ===== Debugging (Python) =====
  {
    "mfussenegger/nvim-dap",
    cmd = { "DapContinue", "DapToggleBreakpoint", "DapStepOver", "DapStepInto", "DapStepOut" },
    config = function()
      require("core.dap")
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap_python = require("dap-python")
      dap_python.setup("python")
      dap_python.test_runner = "pytest"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
      local dap = require("dap")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        require("dapui").open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        require("dapui").close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        require("dapui").close()
      end
    end,
  },

  -- ===== AI Agent (OpenCode) =====
  {
    "NickvanDyke/opencode.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/snacks.nvim",
    },
    config = function()
      require("plugins.opencode")
    end,
  },

  -- ===== Icons =====
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },
}
