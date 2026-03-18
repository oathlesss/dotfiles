require("nvim-treesitter.config").setup({
  ensure_installed = {
    "lua", "python", "typescript", "javascript",
    "bash", "json", "yaml", "markdown", "html", "css"
  },
  highlight = { enable = true },
  indent    = { enable = true },
})
