-- 缩进、作用域线
return{
        "shellRaining/hlchunk.nvim",

        event  = {
                "BufReadPost",
                "BufNewFile",
        },

        config = function()
                local hlchunk = require("hlchunk")

                hlchunk.setup({
                        -- 代码块标注
                        chunk  = {
                                enable = true,
                                -- 禁用动画
                                delay  = 0,
                                style = {
                                        -- 正常色
                                        "#cba6f7", -- (catppuccin-mocha-Mauve)
                                        -- 错误提示色
                                        "#f38ba8", -- (catppuccin-mocha-Red)
                                },
                        },
                        -- 缩进线
                        indent = {
                                enable = true,
                        },
                })
        end,
}
