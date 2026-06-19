require "nvchad.autocmds"

local function set_diff_hls()
  vim.api.nvim_set_hl(0, "DiffAdd",    { bg = "#2d5a38" })
  vim.api.nvim_set_hl(0, "DiffChange", { bg = "#2d5a38" })
  vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#5a2a2d", fg = "#8a4548" })
  vim.api.nvim_set_hl(0, "DiffText",   { bg = "#4a8a48", bold = true })
end

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter", "BufWinEnter" }, {
  callback = set_diff_hls,
})
set_diff_hls()

-- WSL safety net: inotify is unreliable across the /mnt/c boundary, so
-- nudge nvim-tree to refresh whenever focus or buffer changes.
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  callback = function()
    local ok, api = pcall(require, "nvim-tree.api")
    if ok then pcall(api.tree.reload) end
  end,
})
