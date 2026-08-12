return {
  "catppuccin/nvim",
  priority = 1024,
  config = function()
    local catppuccin = require("catppuccin")
    catppuccin.setup({
      flavour = "mocha",
      background = {
        light   = "mocha",
        dark    = "mocha",
      },
      transparent_background = true,--透明背景
      no_italic = true,--无斜体
      integrations = {
        barbar                  = true,
        noice                   = true,
        notify                  = true,
        cmp                     = true,
        dap                     = true,
        dap_ui                  = true,
        nvimtree                = true,
        treesitter_context      = true,
        rainbow_delimiters      = true,
        render_markdown         = true,
        telescope               = true,
        lsp_trouble             = true,
        which_key               = true,
      },
    })
    vim.cmd.colorscheme "catppuccin-nvim"
  end,
}
