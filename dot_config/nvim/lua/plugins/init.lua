return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "python",
        "cpp", "c",
        "markdown", "markdown_inline",
        "yaml", "json",
        "gitcommit", "gitignore", "diff",
      })
      return opts
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.git = vim.tbl_extend("force", opts.git or {}, {
        enable = true,
        show_on_dirs = true,
      })
      opts.filesystem_watchers = vim.tbl_extend("force", opts.filesystem_watchers or {}, {
        enable = true,
      })
      opts.auto_reload_on_write = true
      opts.reload_on_bufenter = true
      return opts
    end,
  },
}
