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
                        chunk  = {
                                enable = true,
                                delay  = 0,
                        },
                        indent = {
                                enable = true,
                        },
                })
        end,
}
