-- 自动切换输入法
return {
        "pysan3/fcitx5.nvim",

        event  = {
                "ModeChanged",
        },

        config = function()
                local fcitx5 = require("fcitx5")

                fcitx5.setup({
                        --各模式下设为的输入法（nil为记忆退出时的输入法）
                        imname           = {
                                norm = "keyboard-us",
                                ins  = nil,
                                cmd  = "keyboard-us",
                                vis  = "keyboard-us",
                                opr  = "keyboard-us",
                                term = "keyboard-us",
                        },
                        -- 退出时记住模式
                        remember_prior   = true,
                        -- 在自动切换模式
                        define_autocmd   = true,
                        -- fcitx5未运行时自动启动
                        autostart_fcitx5 = true,
                })
        end,
}
