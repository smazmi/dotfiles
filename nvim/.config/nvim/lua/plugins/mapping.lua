return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>x"] = { name = "Noice" },
          ["<Leader>xd"] = { "<cmd>NoiceDismiss<cr>", desc = "NoiceDismiss" },
        },
      },
    },
  },
}
