-- 快捷键提示
return {
        "folke/which-key.nvim",

        event        = {
                "VeryLazy",
        },

        init         = function()
                -- 按键后提示快捷键延迟
                vim.o.timeout    = true
                -- 延迟ms 
                vim.o.timeoutlen = 300
        end,

        config       = function()
                local which = require("which-key")

                which.setup({
                        -- 禁用图标
                        icons= {
                                mappings = false,
                                rules = false
                        },
                        -- 窗口
                        win   = {
                                -- 右侧 
                                col    = -1,
                                -- 宽度
                                width  = 0.5,
                                -- 圆角
                                border = "rounded",
                                -- 无标题
                                title  = false,
                        },
                })

                -- 框线无背景
                vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "NONE" })
        end,
}
