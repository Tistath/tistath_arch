-- 代码片段补全
return {
        "L3MON4D3/LuaSnip",

        event        = {
                "BufReadPost",
                "BufNewFile",
        },

        build        = "make install_jsregexp",

        dependencies = {
                "rafamadriz/friendly-snippets",
                "L3MON4D3/jsregexp",
        },

        config       = function()
                local luasnip = require("luasnip.loaders.from_vscode")

                luasnip.lazy_load()
        end,
}
