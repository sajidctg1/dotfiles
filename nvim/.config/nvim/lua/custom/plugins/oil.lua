return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
  keys = {
    -- stylua: ignore
    { '-', function() require('oil').toggle_float('') end, desc = 'Open Oil in parent dir', },
  },
  init = function()
    vim.keymap.set('n', '<leader>-', require('oil').toggle_float, { desc = 'Open Oil in a float' })
  end,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ['<Esc>'] = { callback = 'actions.close', mode = 'n' },
    },
  },
}
