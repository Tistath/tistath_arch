-- 自动补全括号
return {
        "windwp/nvim-autopairs",

        event  = {
                "BufReadPost",
                "BufNewFile",
        },

        config = function()
                local autopairs = require("nvim-autopairs")

                autopairs.setup({
                })
        end,
}
