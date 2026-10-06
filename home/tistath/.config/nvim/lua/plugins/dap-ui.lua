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
                        element_mappings = {
                                scopes      = {
                                        edit = 'e',
                                        repl = 'r',
                                },
                                watches     = {
                                        edit = 'e',
                                        repl = 'r',
                                },
                                stacks      = {
                                        open = 'o',
                                },
                                breakpoints = {
                                        open   = 'o',
                                        toggle = 't',
                                },
                        },
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
                                        elements = {
                                                "repl",
                                        },
                                        size     = 0.25,
                                        position = "bottom",
                                },
                                {
                                        elements = {
                                                "console",
                                        },
                                        size     = 0.2,
                                        position = "right",
                                },
                        },
                        floating         = {
                                max_height = nil,
                                max_width  = nil,
                                border     = "rounded",
                                mappings   = {
                                        close = {
                                                'q',
                                                "<Esc>",
                                        },
                                },
                        },
                })

                dap.listeners.after.event_initialized["dapui_config"] = function()
                        dapui.open()
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                        dapui.close()
                end
                dap.listeners.before.event_exited["dapui_config"]     = function()
                        dapui.close()
                end

                vim.keymap.set('n', "<Leader>du", dapui.toggle, { desc = "切换DAP UI" })
        end,
}
