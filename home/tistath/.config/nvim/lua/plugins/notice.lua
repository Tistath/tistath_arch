-- UI美化
return {
        "folke/noice.nvim",

        event        = {
                "VeryLazy",
        },

        dependencies = {
                -- UI组件库
                "MunifTanjim/nui.nvim",
                -- 通知系统
                "rcarriga/nvim-notify",
        },

        config       = function()
                local noice = require("noice")

                noice.setup({
                        -- 覆盖LSP函数以美化渲染
                        lsp       = {
                                override = {
                                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                                        ["vim.lsp.util.stylize_markdown"]                = true,
                                        ["cmp.entry.get_documentation"]                  = true,
                                },
                        },
                        presets   = {
                                -- 命令行悬浮显示
                                command_palette       = true,

                                -- 长消息分屏显示
                                long_message_to_split = true,
                        },
                        messages  = {
                                -- 启用消息美化
                                enabled      = true,

                                -- 普通消息
                                view         = "notify",
                                -- 错误信息
                                view_error   = "notify",
                                -- 警告信息
                                view_warn    = "notify",
                                -- 历史消息用传统显示
                                view_history = "messages",
                                -- 搜索时行内虚拟文本提示匹配数目
                                view_search  = "virtualtext",
                        },
                        notify    = {
                                -- 启用通知系统
                                enabled = true,
                                -- 用nvim-notify显示
                                view    = "notify",
                                -- 消失ms
                                timeout = 3000,
                        },
                })
        end,
}
