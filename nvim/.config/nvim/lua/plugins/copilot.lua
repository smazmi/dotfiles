---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestions = { enabled = false },
        -- panel = { enabled = false },
        -- You can add copilot specific configuration here if needed
      }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim", -- Add lspkind.nvim as a dependency
      {
        "zbirenbaum/copilot-cmp",
        config = function() require("copilot_cmp").setup() end,
      },
    },
    opts = function(_, opts)
      local lspkind = require "lspkind"
      opts.formatting = {
        format = lspkind.cmp_format {
          mode = "symbol",
          max_width = 50,
          symbol_map = { Copilot = "" },
        },
      }
      opts.sources = {
        { name = "copilot", group_index = 2 },
        { name = "nvim_lsp", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      }
      return opts
    end,
  },
}
