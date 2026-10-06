-- 通知系统
return {
        "rcarriga/nvim-notify",

        event  = {
                "VeryLazy",
        },

        config = function()
                local notify = require("notify")

                notify.setup({
                        fps           = 60,
                        icons         = {
                                DEBUG = '',
                                ERROR = '',
                                INFO  = '',
                                TRACE = '✎',
                                WARN  = '',
                        },
                        level         = 2,
                        minimum_width = 50,
                        render        = "default",
                        stages        = "fade_in_slide_out",
                        timeout       = 5000,
                        top_down      = true,
                })
        end,
}
