return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = function()
    local tree = require("nvim-tree")
    tree.setup({
    })
    vim.keymap.set("n", "<Leader>to", ":NvimTreeOpen<CR>",                   { noremap = true, silent = true, desc = "打开文件树", })
    vim.keymap.set("n", "<Leader>tc", ":NvimTreeClose<CR>",                   { noremap = true, silent = true, desc = "关闭文件树", })
  end,
}
