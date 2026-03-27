local parsers = {
  "lua",
  "python",
  "typescript",
  "javascript",
  "bash",
  "json",
  "yaml",
  "markdown",
  "html",
  "css",
}

vim.cmd.packadd("nvim-treesitter")

require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

local installed = {}
for _, parser in ipairs(require("nvim-treesitter").get_installed()) do
  installed[parser] = true
end

local missing = {}
for _, parser in ipairs(parsers) do
  if not installed[parser] then
    table.insert(missing, parser)
  end
end

if #missing > 0 and vim.fn.executable("tree-sitter") == 1 then
  require("nvim-treesitter").install(missing)
elseif #missing > 0 then
  vim.schedule(function()
    vim.notify(
      "nvim-treesitter: install tree-sitter-cli to build missing parsers",
      vim.log.levels.WARN
    )
  end)
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
  callback = function(args)
    if not pcall(vim.treesitter.start, args.buf) then
      return
    end

    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
