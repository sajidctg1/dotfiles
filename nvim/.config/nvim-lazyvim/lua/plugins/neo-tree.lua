return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  opts = {
    window = {
      width = 35,
      mappings = {
        ["Y"] = "none",
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
          ".DS_Store",
        },
        always_show = {
          ".env",
        },
      },
    },
  },
}
