return {
  'akinsho/toggleterm.nvim',
  lazy = true,
  init = function()
    -- for which key desc
    vim.keymap.set({ 'n', 't' }, '<leader>tt', '', { desc = '[t]oggle [t]erminal' })

    vim.keymap.set({ 'n', 't' }, '<leader>tth', '<cmd>ToggleTerm direction=horizontal <cr>', { desc = 'terminal horizontal' })
    vim.keymap.set({ 'n', 't' }, '<leader>ttv', '<cmd>ToggleTerm direction=vertical <cr>', { desc = 'terminal vertical' })
    vim.keymap.set({ 'n', 't' }, '<leader>ttf', '<cmd>ToggleTerm direction=float <cr>', { desc = 'terminal floating' })
  end,
  opts = {
    float_opts = {
      border = 'curved',
    },
  },
}
