return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    return {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
        },
      },
    }
  end,
}
