return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({})
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files,               { desc = "查找文件" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep,                { desc = "实时 grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers,                  { desc = "查找缓冲区" })
    vim.keymap.set("n", "<leader>fn", builtin.lsp_document_symbols,     { desc = "查找 LSP 符号" })
  end,
}
