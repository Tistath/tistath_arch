-- 代码片段补全
return {
        "L3MON4D3/LuaSnip",

        event        = {
                "BufReadPost",
                "BufNewFile",
        },

        -- 编译正则替换库
        build        = "make install_jsregexp",

        dependencies = {
                -- 代码片段
                "rafamadriz/friendly-snippets",

                -- 正则库
                "L3MON4D3/jsregexp",
        },

        config       = function()
                -- 加载VS Code格式代码片段
                local luasnip = require("luasnip.loaders.from_vscode")

                -- 只加载所打开的文件的语言的代码片段
                luasnip.lazy_load()
        end,
}
