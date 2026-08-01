return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    vim.notify = require("notify")
    require("notify").setup({
      background_colour = "#0088ff",
      fps = 60,
      icons = {
        DEBUG   = "",
        ERROR   = "",
        INFO    = "",
        TRACE   = "✎",
        WARN    = "",
      },
      level             = 2,
      minimum_width     = 50,
      render            = "default",
      stages            = "fade_in_slide_out",
      timeout           = 5000,
      top_down          = true,
    })
  end,
}
