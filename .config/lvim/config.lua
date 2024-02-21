reload('user.plugins')
reload('user.colorscheme')
reload('user.options')
reload('user.keymaps')
reload('user.which-key')
reload('user.statusline')
reload('user.lsp')
reload('user.dashboard')
-- reload('user.lsp-status')
reload('user.autocmds')



local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}
