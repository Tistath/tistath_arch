return {
  "folke/which-key.nvim",
  lazy = false,
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require("which-key").setup({
      win = {
        width = 0.5,
        title = false,
        border = "rounded",
      },
    })
    vim.api.nvim_set_hl(0, "WhichKeyBorder",    { bg = "NONE" })
  end,
}
