return {
  'romgrk/barbar.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false

    vim.keymap.set('n', '<S-l>', '<cmd>BufferNext<cr>', { desc = 'Next Buffer' })
    vim.keymap.set('n', '<S-h>', '<cmd>BufferPrevious<cr>', { desc = 'Prev Buffer' })
    vim.keymap.set('n', '<Tab>', '<cmd>BufferNext<cr>', { desc = 'Next Buffer' })
    vim.keymap.set('n', '<S-Tab>', '<cmd>BufferPrevious<cr>', { desc = 'Prev Buffer' })
    vim.keymap.set('n', '<leader>bc', '<cmd>BufferClose<cr>', { desc = '[b]uffer [c]lose' })
    vim.keymap.set('n', '<leader>bn', '<Cmd>BufferMoveNext<CR>', { desc = '[b]uffer move [n]ext' })
    vim.keymap.set('n', '<leader>bp', '<Cmd>BufferMovePrevious<CR>', { desc = '[b]uffer move [p]revious' })
    vim.keymap.set('n', '<leader>bo', '<cmd>BufferCloseAllButCurrent<cr>', { desc = '[b]uffer close [o]thers' })
  end,
  opts = {
    animation = true,
  },
}
