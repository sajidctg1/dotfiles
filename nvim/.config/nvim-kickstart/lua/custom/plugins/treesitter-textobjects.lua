return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  init = function()
    local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)
  end,
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter',
      opts = {
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['a='] = { query = '@assignment.outer', desc = 'outer assignment' },
              ['i='] = { query = '@assignment.inner', desc = 'inner assignment' },
              ['l='] = { query = '@assignment.lhs', desc = 'left hand side of an assignment' },
              ['r='] = { query = '@assignment.rhs', desc = 'right hand side of an assignment' },

              ['ac'] = { query = '@class.outer', desc = 'outer class' },
              ['ic'] = { query = '@class.inner', desc = 'inner class' },
              ['af'] = { query = '@function.outer', desc = 'outer method/function' },
              ['if'] = { query = '@function.inner', desc = 'inner method/function' },
              ['au'] = { query = '@call.outer', desc = 'outer function call' },
              ['iu'] = { query = '@call.inner', desc = 'inner function call' },
              ['ai'] = { query = '@conditional.outer', desc = 'outer conditional' },
              ['ii'] = { query = '@conditional.inner', desc = 'inner conditional' },
              ['aa'] = { query = '@parameter.outer', desc = 'outer argument/parameter' },
              ['ia'] = { query = '@parameter.inner', desc = 'inner argument/parameter' },
              ['al'] = { query = '@loop.outer', desc = 'outer loop' },
              ['il'] = { query = '@loop.inner', desc = 'inner loop' },

              ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>ran'] = '@parameter.inner', -- swap parameters/argument with next
              ['<leader>rmn'] = '@function.outer', -- swap function with next
            },
            swap_previous = {
              ['<leader>rap'] = '@parameter.inner', -- swap parameters/argument with prev
              ['<leader>rmp'] = '@function.outer', -- swap function with previous
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = { query = '@function.outer', desc = 'Next method/function def start' },
              [']c'] = { query = '@class.outer', desc = 'Next class start' },
              [']i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
              [']l'] = { query = '@loop.outer', desc = 'Next loop start' },

              -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
              -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
              [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
              [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
            },
            goto_next_end = {
              [']M'] = { query = '@function.outer', desc = 'Next method/function def end' },
              [']C'] = { query = '@class.outer', desc = 'Next class end' },
              [']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
              [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
            },
            goto_previous_start = {
              ['[m'] = { query = '@function.outer', desc = 'Prev method/function def start' },
              ['[c'] = { query = '@class.outer', desc = 'Prev class start' },
              ['[i'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
              ['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
            },
            goto_previous_end = {
              ['[M'] = { query = '@function.outer', desc = 'Prev method/function def end' },
              ['[C'] = { query = '@class.outer', desc = 'Prev class end' },
              ['[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
              ['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
            },
          },
        },
      },
    },
  },
}
