local M = {}

M.attach = function(_, bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
  end
  map("gd",         vim.lsp.buf.definition,                              "Go to Definition")
  map("gD",         vim.lsp.buf.declaration,                             "Go to Declaration")
  map("gr",         vim.lsp.buf.references,                              "Go to References")
  map("gi",         vim.lsp.buf.implementation,                          "Go to Implementation")
  map("K",          vim.lsp.buf.hover,                                   "Hover Docs")
  map("<leader>rn", vim.lsp.buf.rename,                                  "Rename")
  map("<leader>ca", vim.lsp.buf.code_action,                             "Code Action")
  map("<leader>F",  function() vim.lsp.buf.format({ async = true }) end, "Format")
  map("[d",         vim.diagnostic.goto_prev,                            "Prev Diagnostic")
  map("]d",         vim.diagnostic.goto_next,                            "Next Diagnostic")
end

return M
