return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = { "cpp", "python", "lua", "css", },
      highlight = { enable = true },
      fold = { enable = true },
    })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'cpp', 'python' },
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
