return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  opts = {
    at_edge = "stop",
    multiplexer_integration = "tmux",
  },
  config = function(_, opts)
    local ss = require "smart-splits"
    ss.setup(opts)
    local map = vim.keymap.set
    map({ "n", "t" }, "<M-Left>",  ss.move_cursor_left,  { desc = "Move to left split/pane" })
    map({ "n", "t" }, "<M-Down>",  ss.move_cursor_down,  { desc = "Move to down split/pane" })
    map({ "n", "t" }, "<M-Up>",    ss.move_cursor_up,    { desc = "Move to up split/pane" })
    map({ "n", "t" }, "<M-Right>", ss.move_cursor_right, { desc = "Move to right split/pane" })
  end,
}
