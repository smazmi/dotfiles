return {
  "folke/todo-comments.nvim",
  event = "BufRead",
  config = function() require("todo-comments").setup() end,
}
