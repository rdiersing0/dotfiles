require("nvchad.configs.lspconfig").defaults()

local servers = {
  "basedpyright",
  "ruff",
  "clangd",
  "marksman",
  "yamlls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
