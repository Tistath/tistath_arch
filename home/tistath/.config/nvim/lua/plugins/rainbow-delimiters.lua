return {
  "HiPhish/rainbow-delimiters.nvim",
--  event = "BufReadPost",
  lazy = false,
  config = function()
    local rainbow = require("rainbow-delimiters.setup")
    rainbow.setup({
    })
  end,
}
