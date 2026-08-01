-- lua/plugins/icons.lua
return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  config = function()
    vim.keymap.set("n", "<leader>tf", ":Trouble diagnostics filter.buf=0 toggle<CR>", { noremap = true, silent = true, desc = "当前文件诊断" })
    vim.keymap.set("n", "<leader>td", ":Trouble qflist toggle<CR>", { noremap = true, silent = true, desc = "快速修复列表" })
  end,
}
