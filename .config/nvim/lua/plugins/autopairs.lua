return {
  "windwp/nvim-autopairs",
  event = "BufReadPost",
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
    })
  end,
}
