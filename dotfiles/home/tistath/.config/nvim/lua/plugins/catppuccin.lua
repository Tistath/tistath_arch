-- Catppuccin颜色主题
return {
        "catppuccin/nvim",

        priority = 1024,

        config   = function()

                local catppuccin          = require("catppuccin")
                -- 调色板
                local catppuccin_palettes = require("catppuccin.palettes").get_palette("mocha")

                catppuccin.setup({
                        -- 口味
                        flavour                = "mocha",
                        background             = {
                                light = "mocha",
                                dark  = "mocha",
                        },

                        -- 全局透明背景
                        transparent_background = true,

                        -- 集成
                        integrations           = {
                                blink_cmp = {
                                        -- 补全菜单圆角
                                        style = 'bordered',
                                },
                                lualine            = {
                                        normal   = {
                                                a = { bg = catppuccin_palettes.blue,     fg = catppuccin_palettes.mantle,   gui = "bold" },
                                                b = { bg = catppuccin_palettes.surface0, fg = catppuccin_palettes.blue                   },
                                                c = { bg = transparent_bg,               fg = catppuccin_palettes.text                   },
                                        },
                                        insert   = {
                                                a = { bg = catppuccin_palettes.green,    fg = catppuccin_palettes.base,     gui = "bold" },
                                                b = { bg = catppuccin_palettes.surface0, fg = catppuccin_palettes.green                  },
                                        },
                                        terminal = {
                                                a = { bg = catppuccin_palettes.green,    fg = catppuccin_palettes.base,     gui = "bold" },
                                                b = { bg = catppuccin_palettes.surface0, fg = catppuccin_palettes.green                  },
                                        },
                                        command  = {
                                                a = { bg = catppuccin_palettes.peach,    fg = catppuccin_palettes.base,     gui = "bold" },
                                                b = { bg = catppuccin_palettes.surface0, fg = catppuccin_palettes.peach                  },
                                        },
                                        visual   = {
                                                a = { bg = catppuccin_palettes.mauve,    fg = catppuccin_palettes.base,     gui = "bold" },
                                                b = { bg = catppuccin_palettes.surface0, fg = catppuccin_palettes.mauve                  },
                                        },
                                        replace  = {
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
                                dap                = true,
                                dap_ui             = true,
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

                -- 设置主题
                vim.cmd.colorscheme("catppuccin-nvim")
        end,
}
