require("nvchad.configs.lspconfig").defaults()

-- vim.lsp.config("ty", {
--   settings = {
--     ty = {
--       experimental = {
--         autoImport = true,
--       },
--       inlayHints = {
--         variableTypes = false,
--         callArgumentNames = false,
--       },
--     },
--   },
-- })

vim.lsp.config("zubanls", {
  name = "ZubanLS",
  cmd = { "zuban", "server" },
  root_markers = { "pyproject.toml", ".git" },
  filetypes = { "python" },
})

local servers = { "html", "cssls", "zubanls", "vtsls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
