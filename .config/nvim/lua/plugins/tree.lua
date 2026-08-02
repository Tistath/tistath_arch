return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = function()
    local tree = require("nvim-tree")
    tree.setup({})
  end,
}
