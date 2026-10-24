-- 调试时显示信息
return {
        "theHamsta/nvim-dap-virtual-text",

        event        = {
                "BufReadPost",
                "BufNewFile",
        },

        dependencies = {
                -- 调试本体
                "mfussenegger/nvim-dap",
        },

        config       = function()
                local daptext = require("nvim-dap-virtual-text")

                daptext.setup({
                        -- 启用变量悬浮面板
                        enabled                     = true,

                        -- 高亮发生变化的变量
                        highlight_changed_variables = true,
                        -- 高亮新变量
                        highlight_new_as_changed    = true,

                        -- 显示停止原因
                        show_stop_reason            = true,

                        -- 显示在行尾
                        virt_text_pos               = "eol",
                        virt_lines                  = false,
                        -- 自动调整列位置
                        virt_text_win_col           = nil,
                })
        end,
}
