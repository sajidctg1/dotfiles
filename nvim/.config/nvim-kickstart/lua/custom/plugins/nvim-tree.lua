return {
  {
    'nvim-tree/nvim-tree.lua',
    enable = false,
    lazy = true,
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    init = function()
      vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })
      vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'nvimtree focus window' })
    end,
    opts = function()
      return {
        filters = { dotfiles = false },
        disable_netrw = true,
        hijack_cursor = true,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        view = {
          width = 35,
          preserve_window_proportions = true,
        },
        renderer = {
          root_folder_label = false,
          highlight_git = true,
          indent_markers = { enable = true },
          icons = {
            glyphs = {
              default = '󰈚',
              folder = {
                default = '',
                empty = '',
                empty_open = '',
                open = '',
                symlink = '',
              },
              git = { unmerged = '' },
            },
          },
        },
      }
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    opts = function()
      return {
        default_icon = { icon = '󰈚', name = 'Default' },
        js = { icon = '󰌞', name = 'js' },
        ts = { icon = '󰛦', name = 'ts' },
        lock = { icon = '󰌾', name = 'lock' },
        ['robots.txt'] = { icon = '󰚩', name = 'robots' },
      }
    end,
  },
}
