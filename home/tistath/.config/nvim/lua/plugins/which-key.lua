return {
        "folke/which-key.nvim",

        lazy         = false,

        dependencies = {
                "nvim-tree/nvim-web-devicons",
        },

        event        = "VeryLazy",

        init         = function() --按键后提示快捷键延迟
                vim.o.timeout    = true
                vim.o.timeoutlen = 300
        end,

        config = function()
                local which = require("which-key")

                which.setup({
                        win = {
                        col    = -1,
                        width  = 0.5,
                        border = "rounded",
                        title  = false,
                        },
                })

                vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "NONE" })
        end,
}
