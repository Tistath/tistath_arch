return {
  "catppuccin/nvim",
  priority = 1024,
  config = function()
    local catppuccin = require("catppuccin")
    local catppuccin_palettes = require("catppuccin.palettes").get_palette("mocha")
    local transparent_bg = "NONE"

    catppuccin.setup({
      flavour = "mocha",
      background = {
        light = "mocha",
        dark  = "mocha",
      },

      transparent_background = true,
      integrations = {
        barbar             = true,
        lualine = {
          normal = {
            a = { bg = catppuccin_palettes.blue,     fg = catppuccin_palettes.mantle,   gui = "bold" },
            b = { bg = catppuccin_palettes.surface0, fg = catppuccin_palettes.blue                   },
            c = { bg = transparent_bg,               fg = catppuccin_palettes.text                   },
          },
          insert = {
            a = { bg = catppuccin_palettes.green,    fg = catppuccin_palettes.base,     gui = "bold" },
            b = { bg = catppuccin_palettes.surface0, fg = catppuccin_palettes.green                  },
          },
          terminal = {
            a = { bg = catppuccin_palettes.green,    fg = catppuccin_palettes.base,     gui = "bold" },
            b = { bg = catppuccin_palettes.surface0, fg = catppuccin_palettes.green                  },
          },
          command = {
            a = { bg = catppuccin_palettes.peach,    fg = catppuccin_palettes.base,     gui = "bold" },
            b = { bg = catppuccin_palettes.surface0, fg = catppuccin_palettes.peach                  },
          },
          visual = {
            a = { bg = catppuccin_palettes.mauve,    fg = catppuccin_palettes.base,     gui = "bold" },
            b = { bg = catppuccin_palettes.surface0, fg = catppuccin_palettes.mauve                  },
          },
          replace = {
            a = { bg = catppuccin_palettes.red,      fg = catppuccin_palettes.base,     gui = "bold" },
            b = { bg = catppuccin_palettes.surface0, fg = catppuccin_palettes.red                    },
          },
          inactive = {
            a = { bg = transparent_bg,               fg = catppuccin_palettes.blue                   },
            b = { bg = transparent_bg,               fg = catppuccin_palettes.surface1, gui = "bold" },
            c = { bg = transparent_bg,               fg = catppuccin_palettes.overlay0               },
          },
        },
        noice              = true,
        notify             = true,
        cmp                = true,
        dap                = true,
        dap_ui             = true,
        nvimtree           = true,
        treesitter_context = true,
        rainbow_delimiters = true,
        render_markdown    = true,
        telescope          = {
          enabled = true,
        },
        lsp_trouble        = true,
        which_key          = true,
      },
    })

    vim.cmd.colorscheme("catppuccin-nvim")
  end,
}
