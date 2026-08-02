return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    vim.lsp.enable("clangd")
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        spacing = 4,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
    vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition,           { desc = "跳转到定义" })
    vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration,          { desc = "跳转到声明" })
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references,           { desc = "查找引用" })
    vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation,       { desc = "跳转到实现" })
    vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition,      { desc = "跳转到类型定义" })
    vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover,                { desc = "显示悬浮文档" })
    vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help,       { desc = "显示函数签名" })
    vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename,               { desc = "重命名符号" })
    vim.keymap.set("n", "<leader>lm", vim.lsp.buf.code_action,          { desc = "代码操作" })
    vim.keymap.set("n", "<leader>ll", vim.diagnostic.open_float,        { desc = "查看当前行诊断" })
    vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_prev,         { desc = "上一个诊断" })
    vim.keymap.set("n", "<leader>l;", vim.diagnostic.goto_next,         { desc = "下一个诊断" })
  end,
}
