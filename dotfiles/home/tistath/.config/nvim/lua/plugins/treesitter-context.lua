-- 粘滞滚动
return {
        "nvim-treesitter/nvim-treesitter-context",

        event  = {
                "BufReadPost",
                "BufNewFile",
        },

        config = function()
                local context = require("treesitter-context")

                context.setup({
                        -- 启用粘滞滚动
                        enable     = true,
                        -- 最大行数
                        max_lines  = 8,
                        -- 截断内层保留外层
                        trim_scope = "outer",
                })
        end,
}
