return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = function()
    local tree = require("nvim-tree")
    tree.setup({
    })
    vim.keymap.set("n", "<Leader>tr", ":NvimTreeOpen<CR>",                   { noremap = true, silent = true, desc = "打开文件树", })
  end,
}
