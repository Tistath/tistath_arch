return {
  "nvim-treesitter/nvim-treesitter-context",
  lazy = false,
  config = function()
    require("treesitter-context").setup({
      enable = true,
      max_lines = 3,
      trim_scope = "outer",
    })
   -- vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#1e2030", fg = "Gray" })
    --vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = "#1e2030", fg = "Gray" })
  end,
}
