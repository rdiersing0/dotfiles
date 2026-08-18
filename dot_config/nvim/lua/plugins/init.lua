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
      -- WSL/DrvFs fix: nvim-tree's built-in file_exists() (utils.lua) compares
      -- directory names case-SENSITIVELY against what scandir returns. On /mnt/c
      -- the kernel reports the canonical Windows casing (e.g. "Users"), so a path
      -- carried as lowercase "/mnt/c/users/..." is judged non-existent. create-file
      -- then tries to mkdir an already-existing folder -> "Could not create folder
      -- /mnt/c/users". DrvFs is case-insensitive, so fs_stat is the correct check.
      local ok_utils, nt_utils = pcall(require, "nvim-tree.utils")
      if ok_utils then
        nt_utils.file_exists = function(path)
          return vim.uv.fs_stat(path) ~= nil
        end
      end

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
