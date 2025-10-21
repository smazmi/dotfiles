return {
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    -- include the default AstroNvim config
    require "astronvim.plugins.configs.luasnip"(plugin, opts)
    -- load snippets from your local `snippets` folder
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = { vim.fn.stdpath "config" .. "/snippets" },
    }
  end,
}
