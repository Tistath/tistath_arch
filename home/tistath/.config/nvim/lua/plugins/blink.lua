-- 补全引擎
return {
        "saghen/blink.cmp",

        event        = {
                "BufReadPost",
                "BufNewFile",
        },

        build        = function()
                local blink = require("blink.cmp")

                -- 构建组件
                blink.build():pwait()
        end,

        dependencies = {
                {
                        "xzbdmw/colorful-menu.nvim",
                        opts = {
                        },
                },
                "saghen/blink.lib",
                "L3MON4D3/LuaSnip",
        },

        opts         = {
                sources = {
                        -- 补全来源顺序
                        default = {
                                "snippets",
                                "buffer",
                                "lsp",
                                "path",
                        },
                },
                completion = {
                        documentation = {
                                -- 显示选中项文档
                                auto_show = true,
                                -- 延迟
                                auto_show_delay_ms = 190,
                        },
                        menu          = {
                                draw = {
                                        -- 菜单内容
                                        columns    = {
                                                {
                                                        -- 图标
                                                        "kind_icon",
                                                },
                                                {
                                                        -- 补全项文字
                                                        "label",
                                                        -- 间隔
                                                        gap = 1,
                                                },
                                        },
                                        -- 补全菜单上色
                                        components = {
                                                label = {
                                                        text      = function(ctx)
                                                                local menu = require("colorful-menu")

                                                                -- 文字
                                                                return menu.blink_components_text(ctx)
                                                        end,
                                                        highlight = function(ctx)
                                                                local menu = require("colorful-menu")

                                                                -- 高亮组
                                                                return menu.blink_components_highlight(ctx)
                                                        end,
                                                },
                                        },
                                },
                        },
                },
                keymap     = {
                        preset     = "none",
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
                -- 代码片段引擎
                snippets   = {
                        preset = "luasnip",
                },
                -- 显示函数参数列表
                signature  = {
                        enabled = true,
                },
                cmdline    = {
                        completion = {
                                menu = {
                                        auto_show = true,
                                },
                        },
                        keymap     = {
                                preset     = "none",
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
