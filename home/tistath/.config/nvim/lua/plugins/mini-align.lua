-- 字符对齐
return {
        "nvim-mini/mini.align",

        event = {
                "BufReadPost",
                "BufNewFile",
        },

        config = function()
                local align = require("mini.align")

                align.setup({
                })
        end,
}
