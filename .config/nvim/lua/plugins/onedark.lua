-- lua/plugins/onedark.lua
return {
  "navarasu/onedark.nvim",
  priority = 1000,
  config = function()
    require("onedark").setup({
      style = "deep",
      transparent = true,  -- 启用透明背景
    })
    vim.cmd("colorscheme onedark")
  end,
}
