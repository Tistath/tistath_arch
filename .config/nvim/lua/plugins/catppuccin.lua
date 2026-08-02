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
      transparent_background = true,
      no_italic = true,
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
