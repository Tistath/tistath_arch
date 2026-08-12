return{
  "shellRaining/hlchunk.nvim",
  event = "BufReadPost",
  config = function()
    local hlchunk = require("hlchunk")
    hlchunk.setup({
      chunk = {
        enable = true,
        delay = 0
      },
      indent = {
        enable = true,
      },
    })
  end,
}
