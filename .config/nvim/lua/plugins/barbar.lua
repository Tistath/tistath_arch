return {
  "romgrk/barbar.nvim",
  lazy = false,
  dependencies = { "lewis6991/gitsigns.nvim", "nvim-tree/nvim-web-devicons" },
  config = function()
    local barbar = require("barbar")
    barbar.setup({
      animation = true,
      insert_at_start = true,
    })
    vim.keymap.set("n", "<Leader>b;", ":BufferNext<CR>",              { noremap = true, silent = true, desc = "下一标签页", })
    vim.keymap.set("n", "<Leader>bj", ":BufferPrevious<CR>",          { noremap = true, silent = true, desc = "上一标签页", })
    vim.keymap.set("n", "<Leader>bc", ":BufferClose<CR>",             { noremap = true, silent = true, desc = "关闭标签页", })
    vim.keymap.set("n", "<Leader>bp", "<Cmd>BufferPick<CR>",          { noremap = true, silent = true, desc = "查找标签页", })
    vim.keymap.set("n", "<Leader>br", "<Cmd>BufferRestore<CR>",       { noremap = true, silent = true, desc = "恢复标签页", })
  end,
}
