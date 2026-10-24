-- 括号对上色
return {
        "HiPhish/rainbow-delimiters.nvim",

        event  = {
                "BufReadPost",
                "BufNewFile",
        },

        config = function()
                local rainbow = require("rainbow-delimiters.setup")

                rainbow.setup({
                })
        end,
}
