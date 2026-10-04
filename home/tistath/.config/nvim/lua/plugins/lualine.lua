return {
        "nvim-lualine/lualine.nvim",

        lazy         = false,

        dependencies = {
                "nvim-tree/nvim-web-devicons",
        },

        config       = function()
                local lualine = require("lualine")

                lualine.setup({
                        options           = {
                                theme                = "auto",
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
