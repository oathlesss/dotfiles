return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>G', '<cmd>G<cr>', { noremap = true, silent = true, desc = 'Git' })
    vim.keymap.set('n', '<leader>gs', '<cmd>G status<cr>', { noremap = true, silent = true, desc = 'Git Status' })
    vim.keymap.set('n', '<leader>gf', '<cmd>G fetch<cr>', { noremap = true, silent = true, desc = 'Git Fetch' })
    vim.keymap.set('n', '<leader>gp', '<cmd>G pull --rebase<cr>', { noremap = true, silent = true, desc = 'Git Pull' })
    vim.keymap.set('n', '<leader>gP', '<cmd>G push<cr>', { noremap = true, silent = true, desc = 'Git Push' })
    vim.keymap.set('n', '<leader>gl', '<cmd>G log --oneline --graph --decorate --all<cr>', { noremap = true, silent = true, desc = 'Git Log' })
    vim.keymap.set('n', '<leader>gL', '<cmd>G log --oneline --graph --decorate --all %<cr>', { noremap = true, silent = true, desc = 'Git Log File' })
    vim.keymap.set('n', '<leader>gb', '<cmd>G blame<cr>', { noremap = true, silent = true, desc = 'Git Blame' })
    vim.keymap.set('n', '<leader>grm', '<cmd>G rebase origin/main<cr>', { noremap = true, silent = true, desc = 'Git Rebase Main' })
  end,
}
