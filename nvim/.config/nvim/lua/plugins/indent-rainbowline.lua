return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = function(_, opts)
    local mocha = require("catppuccin.palettes").get_palette "mocha"

    return require("indent-rainbowline").make_opts(opts, {
      color_transparency = 0.15,
      colors = {
        tonumber(mocha.red:sub(2), 16),
        tonumber(mocha.green:sub(2), 16),
        tonumber(mocha.blue:sub(2), 16),
        tonumber(mocha.mauve:sub(2), 16),
      },
    })
  end,
  dependencies = {
    "TheGLander/indent-rainbowline.nvim",
    "catppuccin/nvim",
  },
}
