return {
  'sindrets/diffview.nvim',
  config = function()
    vim.keymap.set('n', '<leader>gD', '<cmd>DiffviewOpen<cr>', { noremap = true, silent = true })
  end,
}
