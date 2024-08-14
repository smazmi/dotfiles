return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>x"] = { name = "Noice" },
          ["<Leader>xd"] = { "<cmd>NoiceDismiss<cr>", desc = "NoiceDismiss" },

          -- GitHub Copilot keybindings
          ["<Leader>G"] = {
            name = " Github Copilot",
            a = { ":lua require('copilot.suggestion').accept()<cr>", "Accept" },
            n = { ":lua require('copilot.suggestion').next()<cr>", "Next" },
            N = { ":lua require('copilot.suggestion').prev()<cr>", "Prev" },
            d = { ":lua require('copilot.suggestion').dismiss()<cr>", "Dismiss" },
            t = { ":lua require('copilot.suggestion').toggle_auto_trigger()<cr>", "Toggle Auto Trigger" },
          },
        },
      },
    },
  },
}
