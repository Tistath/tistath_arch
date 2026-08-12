return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    lualine.setup({
      options = {
        theme = "auto",
      },
      sections = {
        lualine_x = {'encoding', 'filetype'},
      },
      inactive_sections = {
        lualine_x = {'branch'},
      },
    })
  end,
}
