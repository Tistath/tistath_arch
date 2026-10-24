-- 信息栏
return {
        "nvim-lualine/lualine.nvim",

        lazy         = false,

        config       = function()
                local lualine = require("lualine")

                lualine.setup({
                        options           = {
                                -- 分隔符
                                component_separators = {
                                        left  = '',
                                        right = '',
                                },
                                section_separators   = {
                                        left  = '',
                                        right = '',
                                },
                        },
                        -- 显示项
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
