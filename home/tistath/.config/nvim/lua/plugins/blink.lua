-- 补全引擎
return {
        "saghen/blink.cmp",

        event        = {
                "BufReadPost",
                "BufNewFile",
        },

        build        = function()
                local blink = require("blink.cmp")

                blink.build():pwait()
        end,

        dependencies = {
                {
                        "xzbdmw/colorful-menu.nvim",
                        opts = {},
                },
                "saghen/blink.lib",
                "L3MON4D3/LuaSnip",
        },
        
        opts         = {
                sources = {
                        default = { -- 补全来源顺序
                                "snippets",
                                "buffer",
                                "lsp",
                                "path",
                        },
                },
                completion = {
                        documentation = {
                                auto_show = true,
                                auto_show_delay_ms = 190,
                        },
                        menu          = {
                                draw = {
                                        columns    = { -- 菜单内容
                                                {
                                                        "kind_icon",
                                                },
                                                {
                                                        "label",
                                                        gap = 1,
                                                },
                                        },
                                        components = { -- 补全菜单上色
                                                label = {
                                                        text      = function(ctx)
                                                                local menu = require("colorful-menu")

                                                                return menu.blink_components_text(ctx)
                                                        end,
                                                        highlight = function(ctx)
                                                                local menu = require("colorful-menu")

                                                                return menu.blink_components_highlight(ctx)
                                                        end,
                                                },
                                        },
                                },
                        },
                },
                keymap     = {
                        ["<C-j>"]  = {
                                "select_next",
                                "fallback",
                        },
                        ["<C-k>"]  = {
                                "select_prev",
                                "fallback",
                        },
                        ["<C-CR>"] = {
                                "accept",
                                "fallback",
                        },
                        ["<C-q>"]  = {
                                "hide",
                                "fallback",
                        },
                        ["<C-u>"]  = {
                                "scroll_documentation_up",
                                "fallback",
                        },
                        ["<C-d>"]  = {
                                "scroll_documentation_down",
                                "fallback",
                        },
                },
                snippets   = { -- 代码片段引擎
                        preset = "luasnip",
                },
                signature  = { -- 显示函数参数列表
                        enabled = true,
                },
                cmdline    = {
                        completion = {
                                menu = {
                                        auto_show = true,
                                },
                        },
                        keymap     = {
                                ["<C-j>"]  = {
                                        "select_next",
                                        "fallback",
                                },
                                ["<C-k>"]  = {
                                        "select_prev",
                                        "fallback",
                                },
                                ["<C-CR>"] = {
                                        "accept",
                                        "fallback",
                                },
                                ["<C-q>"]  = {
                                        "hide",
                                        "fallback",
                                },
                        },
                },

        },
}
