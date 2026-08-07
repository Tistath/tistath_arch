return {
  "catppuccin/nvim",
  priority = 1024,
  config = function()
    local catppuccin = require("catppuccin")
    catppuccin.setup({
      flavour = "mocha",
      background = {
        dark = "mocha",
      },
      transparent_background = true,--透明背景
      no_italic = true,--无斜体
      integrations = {
        barbar = true,
        noice = true,
        notify = true,
        lsp_trouble = true,
      },
    })
    vim.cmd.colorscheme "catppuccin-nvim"
  end,
}
