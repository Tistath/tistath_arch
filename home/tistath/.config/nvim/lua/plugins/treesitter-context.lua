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
                        enable     = true,
                        max_lines  = 3,
                        trim_scope = "outer",
                })
        end,
}
