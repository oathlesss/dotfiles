local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add({ source = 'vague2k/vague.nvim' })
  add({ source = 'rose-pine/neovim' })

  vim.cmd('colorscheme vague')
end)
