return {
  "nvim-treesitter/nvim-treesitter-context",
  lazy = false,
  config = function()
    local context = require("treesitter-context")
    context.setup({
      enable = true,
      max_lines = 3,
      trim_scope = "outer",
    })
  end,
}
