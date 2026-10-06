-- 信息栏
return {
        "nvim-lualine/lualine.nvim",

        lazy         = false,

        config       = function()
                local lualine = require("lualine")

                lualine.setup({
                        options           = {
                                component_separators = {
                                        left  = '',
                                        right = '',
                                },
                                section_separators   = {
                                        left  = '',
                                        right = '',
                                },
                        },
                        sections          = {
                                lualine_x = {
                                        "encoding",
                                        "filetype",
                                },
                        },
                        inactive_sections = {
                                lualine_x = {
                                        "branch",
                                },
                        },
                })
        end,
}
