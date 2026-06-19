return {
  "coder/claudecode.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.diffopt:append { "linematch:60", "algorithm:histogram" }
  end,
  opts = {
    diff_opts = {
      layout = "vertical",
      open_in_new_tab = true,
      on_new_file_reject = "close_window",
    },
  },
  keys = {
    { "<leader>a",  nil,                             desc = "AI/Claude Code" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>",       mode = "v", desc = "Send selection to Claude" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",      desc = "Add current buffer to Claude" },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny Claude diff" },
  },
}