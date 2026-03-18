local servers  = require("lsp.servers")
local lsp_keys = require("lsp.keymaps")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    lsp_keys.attach(client, args.buf)
  end,
})

for server, config in pairs(servers) do
  vim.lsp.config(server, config)
end

vim.lsp.enable(vim.tbl_keys(servers))
