-- 断点调试界面
return {
        "rcarriga/nvim-dap-ui",

        event        = {
                "BufReadPost",
                "BufNewFile",
        },

        dependencies = {
                "mfussenegger/nvim-dap",
                "nvim-neotest/nvim-nio",
        },

        config       = function()
                local dapui = require("dapui")
                local dap   = require("dap")

                dapui.setup({
                        -- 各面板键位
                        element_mappings = {
                                -- 变量
                                scopes      = {
                                        -- 编辑变量值
                                        edit = 'e',
                                        -- 送到交互面板
                                        repl = 'r',
                                },
                                -- 栈
                                stacks      = {
                                        -- 跳转到栈帧
                                        open = 'o',
                                },
                                -- 断点
                                breakpoints = {
                                        -- 打开断点位置
                                        open   = 'o',
                                        -- 开/关断点
                                        toggle = 't',
                                },
                                -- 监视
                                watches     = {
                                        -- 编辑监视表达式
                                        edit = 'e',
                                        -- 送到交互面板
                                        repl = 'r',
                                },
                        },
                        -- 布局
                        layouts          = {
                                {
                                        elements = {
                                                "scopes",
                                                "stacks",
                                                "breakpoints",
                                                "watches",
                                        },
                                        size     = 0.2,
                                        position = "left",
                                },
                                {
                                        -- 交互面板
                                        elements = {
                                                "repl",
                                        },
                                        size     = 0.25,
                                        position = "bottom",
                                },
                                {
                                        -- 控制台
                                        elements = {
                                                "console",
                                        },
                                        size     = 0.2,
                                        position = "right",
                                },
                        },
                        -- 浮动窗口
                        floating         = {
                                -- 不限尺寸
                                max_height = nil,
                                max_width  = nil,
                                -- 圆角
                                border     = "rounded",
                                mappings   = {
                                        -- 关闭
                                        close = {
                                                'q',
                                                "<Esc>",
                                        },
                                },
                        },
                })

                -- 调试时打开
                dap.listeners.after.event_initialized["dapui_config"] = function()
                        dapui.open()
                end
                -- 调试结束时关闭
                dap.listeners.before.event_terminated["dapui_config"] = function()
                        dapui.close()
                end
                dap.listeners.before.event_exited["dapui_config"]     = function()
                        dapui.close()
                end

                vim.keymap.set('n', "<Leader>du", dapui.toggle, { desc = "开/关DAP UI" })
        end,
}
