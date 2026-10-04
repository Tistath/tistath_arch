return {
        "romgrk/barbar.nvim",

        lazy         = false,

        dependencies = {
                "lewis6991/gitsigns.nvim",
                "nvim-tree/nvim-web-devicons",
        },

        config       = function()
                local barbar = require("barbar")

                barbar.setup({
                        icons = {
                                separator = {
                                        left  = '',
                                        right = '',
                                },
                                current   = {
                                        separator = {
                                                left  = '',
                                                right = '',
                                        },
                                },
                                visible   = { 
                                        separator = {
                                                left  = '',
                                                right = '',
                                        }
                                },
                                inactive  = { 
                                        separator = {
                                                left  = '',
                                                right = '',
                                        }
                                },
                                alternate = { 
                                        separator = {
                                                left  = '',
                                                right = '',
                                        }
                                },
                                separator_at_end = false,
                        },
                })

                vim.api.nvim_set_hl(0, "BufferCurrentSign",    { fg = "#89b4fa", bg = "NONE"    }) -- catppuccin-mocha-Blue
                vim.api.nvim_set_hl(0, "BufferCurrentIcon",    { fg = "#181825", bg = "#89b4fa" }) -- catppuccin-mocha-Mantle
                vim.api.nvim_set_hl(0, "BufferCurrentIndex",   { fg = "#181825", bg = "#89b4fa" })
                vim.api.nvim_set_hl(0, "BufferCurrent",        { fg = "#181825", bg = "#89b4fa" })
                vim.api.nvim_set_hl(0, "BufferCurrentMod",     { fg = "#181825", bg = "#89b4fa" })
                vim.api.nvim_set_hl(0, "BufferCurrentBtn",     { fg = "#181825", bg = "#89b4fa" })

                vim.api.nvim_set_hl(0, "BufferVisibleSign",    { fg = "#181825", bg = "NONE"    })
                vim.api.nvim_set_hl(0, "BufferVisibleIcon",    { fg = "#6c7086", bg = "#181825" }) -- catppuccin-mocha-Overlay0
                vim.api.nvim_set_hl(0, "BufferVisibleIndex",   { fg = "#6c7086", bg = "#181825" })
                vim.api.nvim_set_hl(0, "BufferVisible",        { fg = "#6c7086", bg = "#181825" })
                vim.api.nvim_set_hl(0, "BufferVisibleMod",     { fg = "#6c7086", bg = "#181825" })
                vim.api.nvim_set_hl(0, "BufferVisibleBtn",     { fg = "#6c7086", bg = "#181825" })

                vim.api.nvim_set_hl(0, "BufferInactiveSign",   { fg = "#181825", bg = "NONE"    })
                vim.api.nvim_set_hl(0, "BufferInactiveIcon",   { fg = "#6c7086", bg = "#181825" })
                vim.api.nvim_set_hl(0, "BufferInactiveIndex",  { fg = "#6c7086", bg = "#181825" })
                vim.api.nvim_set_hl(0, "BufferInactive",       { fg = "#6c7086", bg = "#181825" })
                vim.api.nvim_set_hl(0, "BufferInactiveMod",    { fg = "#6c7086", bg = "#181825" })
                vim.api.nvim_set_hl(0, "BufferInactiveBtn",    { fg = "#6c7086", bg = "#181825" })

                vim.api.nvim_set_hl(0, "BufferAlternateSign",  { fg = "#181825", bg = "NONE"    })
                vim.api.nvim_set_hl(0, "BufferAlternateIcon",  { fg = "#6c7086", bg = "#181825" })
                vim.api.nvim_set_hl(0, "BufferAlternateIndex", { fg = "#6c7086", bg = "#181825" })
                vim.api.nvim_set_hl(0, "BufferAlternate",      { fg = "#6c7086", bg = "#181825" })
                vim.api.nvim_set_hl(0, "BufferAlternateMod",   { fg = "#6c7086", bg = "#181825" })
                vim.api.nvim_set_hl(0, "BufferAlternateBtn",   { fg = "#6c7086", bg = "#181825" })

                vim.keymap.set('n', "<Leader>bj", ":BufferNext<CR>",        { noremap = true, silent = true, desc = "下一标签页", })
                vim.keymap.set('n', "<Leader>bk", ":BufferPrevious<CR>",    { noremap = true, silent = true, desc = "上一标签页", })
                vim.keymap.set('n', "<Leader>bq", ":BufferClose<CR>",       { noremap = true, silent = true, desc = "关闭标签页", })
                vim.keymap.set('n', "<Leader>bf", "<Cmd>BufferPick<CR>",    { noremap = true, silent = true, desc = "查找标签页", })
                vim.keymap.set('n', "<Leader>bu", "<Cmd>BufferRestore<CR>", { noremap = true, silent = true, desc = "恢复标签页", })
        end,
}
