-- 通知系统
return {
        "rcarriga/nvim-notify",

        event  = {
                "VeryLazy",
        },

        config = function()
                local notify = require("notify")

                notify.setup({
                        -- 动画帧率
                        fps           = 60,

                        -- 消息图标
                        icons         = {
                                DEBUG = '',
                                ERROR = '',
                                INFO  = '',
                                TRACE = '✎',
                                WARN  = '',
                        },

                        -- 消息等级：不显示详细轨迹和调试信息
                        level         = 2,

                        -- 最小宽度
                        minimum_width = 50,

                        -- 淡入滑出
                        stages        = "fade_in_slide_out",

                        -- 消失ms
                        timeout       = 5000,

                        -- 新消息在底部
                        top_down      = true,
                })
        end,
}
