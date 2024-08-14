---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local cmp_nvim_lsp = require "cmp_nvim_lsp"

      -- Extend default capabilities with nvim-cmp capabilities
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Ensure the existing `opts` table is maintained
      opts = opts or {}
      opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities or {}, capabilities)

      -- Define the on_attach function if it exists
      local on_attach = opts.on_attach

      -- Setup clangd with custom command and capabilities
      require("lspconfig").clangd.setup {
        on_attach = on_attach,
        capabilities = opts.capabilities,
        cmd = {
          "clangd",
          "--offset-encoding=utf-16",
        },
      }

      return opts
    end,
  },
}
