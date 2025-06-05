return {
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "lukas-reineke/cmp-under-comparator",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local kind_icons = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      local cmp = require("cmp")
      -- local cmplsp = require("cmp_nvim_lsp")
      local luasnip = require("luasnip")

      vim.api.nvim_set_hl(0, "MyNormal", { bg = "Black", fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "MyFloatBorder", { bg = "None", fg = "#888888" })

      cmp.setup({
        preselect = cmp.PreselectMode.None,
        completion = { keyword_length = 1, completeopt = "menu,menuone,noinsert" },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        experimental = { ghost_text = true },
        performance = {
          max_view_entries = 20,
          debounce = 200,
          throttle = 200,
          fetching_timeout = 5000,
          async_budget = 5000,
          confirm_resolve_timeout = 5000,
        },
        window = {
          completion = {
            -- col_offset = -3,
            winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder,CursorLine:CurSearch,Search:None",
            side_padding = 0,
            scrollbar = false,
            border = "rounded",
          },
          documentation = {
            border = "solid",
            winhighlight = "Normal:CmpDoc,FloatBorder:CmpDoc,Search:None",
            max_width = 80,
            max_height = 12,
          },
        },
        formatting = {
          expandable_indicator = true,
          fields = { "abbr", "kind", "menu" },
          format = function(entry, vim_item)
            local kind = vim_item.kind

            vim_item.kind = " " .. (kind_icons[kind] or "?") .. " "
            vim_item.menu = kind .. " [" .. entry.source.name .. "]"

            return vim_item
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-q>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", max_item_count = 10, keyword_length = 1 },
          { name = "luasnip", max_item_count = 10, keyword_length = 2 },
        }, {
          { name = "path", max_item_count = 10, keyword_length = 2 },
          { name = "buffer", max_item_count = 10, keyword_length = 3 },
        }),
      })
    end,
  },
  {
    "hrsh7th/cmp-cmdline",
    enabled = false,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "dmitmel/cmp-cmdline-history",
    },
    event = "CmdlineEnter",
    config = function()
      local cmp = require("cmp")
      local config = cmp.get_config()

      table.insert(config.sources, { name = "path" })
      table.insert(config.sources, { name = "cmdline" })
      table.insert(config.sources, { name = "cmdline_history" })

      config.mapping = cmp.mapping.preset.cmdline()

      cmp.setup.cmdline(":", config)
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { name = "buffer" },
      })

      cmp.setup(config)
    end,
  },
}
