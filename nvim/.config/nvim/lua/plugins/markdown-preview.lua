return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  ft = "markdown",
  config = function() -- Markdown Preview
    vim.g.mkdp_auto_start = 1
  end,
}
