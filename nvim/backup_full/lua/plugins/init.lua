-- Minimal NvChad Plugin Configuration
-- Backend focused: Python, Go, C/C++, React/TypeScript, DevOps
-- Only essentials included - add more as needed

return {
  -- ===== LSP & Completion (Core) =====
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("core.lsp")
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = {
      ensure_installed = {
        -- Python
        "pyright",
        "black",
        "pylint",
        -- Go
        "gopls",
        "gofumpt",
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
      ensure_installed = { "pyright", "gopls", "clangd", "ts_ls" },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opts = function()
      return require("nvchad.configs.cmp")
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
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
    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
    config = function(_, opts)
      require("luasnip").config.set_config(opts)
      require("nvchad.configs.luasnip")
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
    opts = function()
      return require("nvchad.configs.treesitter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
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
    opts = function()
      return require("nvchad.configs.telescope")
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
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
    opts = function()
      return require("nvchad.configs.nvimtree")
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
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
    opts = function()
      return require("nvchad.configs.gitsigns")
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
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
    opts = function()
      return require("nvchad.configs.whichkey")
    end,
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },

  {
    "nvim-notify/nvim-notify",
    init = function()
      require("core.utils").load_mappings("notify")
    end,
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
    opts = {},
  },

  -- ===== Icons =====
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      return { override = require("nvchad.icons.devicons") }
    end,
    config = function(_, opts)
      require("nvim-web-devicons").setup(opts)
    end,
  },
}
