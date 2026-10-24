-- 代码调试
return {
        "mfussenegger/nvim-dap",

        event  = {
                "BufReadPost",
                "BufNewFile",
        },

        config = function()
                local dap              = require("dap")

                -- GNU Debugger适配器
                dap.adapters.gdb       = {
                        -- 执行外部命令
                        type    = "executable",

                        -- 使用gdb
                        command = "gdb",

                        args    = {
                                -- GDB的dap模式
                                "--interpreter=dap",
                                -- 执行命令：格式化结构体打印
                                "--eval-command", "set print pretty on",
                        },
                }
                -- C++适配器
                dap.configurations.cpp = {
                        {
                                -- 配置名称
                                name                            = "Launch",

                                -- 启用以上gdb适配器
                                type                            = "gdb",

                                -- 请求启动新程序
                                request                         = "launch",

                                -- 输入可执行文件
                                program                         = function()
                                        return vim.fn.input("Path: ", vim.fn.getcwd() .. '/', "file")
                                end,


                                -- 运行目录为项目根目录
                                cwd                             = "${workspaceFolder}",

                                -- 不在main()开头停
                                stopAtBeginningOfMainSubprogram = false,
                        },
                }

                -- 定义高亮组
                vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0 })
                vim.api.nvim_set_hl(0, "DapLogPoint",   { ctermbg = 0 })
                vim.api.nvim_set_hl(0, "DapStopped",    { ctermbg = 0 })
                -- 定义图标
                local dap_breakpoint   = {
                        error     = {
                                text   = '●',
                                texthl = "DapBreakpoint",
                                linehl = "DapBreakpoint",
                                numhl  = "DapBreakpoint",
                        },
                        condition = {
                                text   = '󰟃',
                                texthl = "DapBreakpoint",
                                linehl = "DapBreakpoint",
                                numhl  = "DapBreakpoint",
                        },
                        rejected  = {
                                text   = '󰃤',
                                texthl = "DapBreakpoint",
                                linehl = "DapBreakpoint",
                                numhl  = "DapBreakpoint",
                        },
                        logpoint  = {
                                text   = '',
                                texthl = "DapLogPoint",
                                linehl = "DapLogPoint",
                                numhl  = "DapLogPoint",
                        },
                        stopped   = {
                                text   = '󰜴',
                                texthl = "DapStopped",
                                linehl = "DapStopped",
                                numhl  = "DapStopped",
                        },
                }
                -- 注册图标
                vim.fn.sign_define("DapBreakpoint",          dap_breakpoint.error    )
                vim.fn.sign_define("DapBreakpointCondition", dap_breakpoint.condition)
                vim.fn.sign_define("DapBreakpointRejected",  dap_breakpoint.rejected )
                vim.fn.sign_define("DapLogPoint",            dap_breakpoint.logpoint )
                vim.fn.sign_define("DapStopped",             dap_breakpoint.stopped  )

                vim.keymap.set('n', "<Leader>dk", dap.continue,                                              { desc = "继续执行"     })
                vim.keymap.set('n', "<Leader>dl", dap.step_over,                                             { desc = "单步跳过"     })
                vim.keymap.set('n', "<Leader>di", dap.step_into,                                             { desc = "单步进入"     })
                vim.keymap.set('n', "<Leader>do", dap.step_out,                                              { desc = "单步跳出"     })
                vim.keymap.set('n', "<Leader>db", dap.toggle_breakpoint,                                     { desc = "开/关断点"    })
                vim.keymap.set('n', "<Leader>dB", function() dap.set_breakpoint(vim.fn.input("Cond: ")) end, { desc = "条件断点"     })
                vim.keymap.set('n', "<Leader>dr", dap.repl.open,                                             { desc = "打开交互面板" })
                vim.keymap.set('n', "<Leader>dc", dap.run_to_cursor,                                         { desc = "运行到光标"   })
                vim.keymap.set('n', "<Leader>dv", function() require("dap.ui.widgets").hover() end,          { desc = "查看变量"     })
                vim.keymap.set('n', "<Leader>dq", dap.disconnect,                                            { desc = "停止调试"     })
        end,
}
