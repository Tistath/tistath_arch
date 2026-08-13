return {
  "MeanderingProgrammer/render-markdown.nvim",
  event = "BufReadPost",
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  config = function()
    local markdown = require("render-markdown")
    markdown.setup({
      completions = { lsp = { enabled = true } },
      code = {  --代码块左对齐
        sign = false,
        width = 'block',
        min_width = 80,
        left_pad = 1,
        right_pad = 1,
        language_pad = 2,
        border = 'thin',
      },
      heading = {
      sign = false,
      icons = { " 󰼏 ", " 󰎨 ", " 󰼑 ", " 󰎲 ", " 󰼓 ", " 󰎴 " },
      backgrounds = {nil, nil, nil, nil, nil, nil, },
      },
      pipe_table = {
	alignment_indicator = "─",
	border = { "╭", "┬", "╮",
                   "├", "┼", "┤",
                   "╰", "┴", "╯", 
                   "│", "─" },
      },
      indent = {
        enabled = true,           -- 启用缩进线
        per_level = 4,            -- 每级缩进的空格数（通常为 2 或 4）
        skip_level = 1,           -- 从第几级标题开始显示缩进线
        skip_heading = false,     -- 标题自身不缩进，标题下的内容缩进
        icon = '│',               -- 缩进线图标
      },
    })
  end,
  opts = {},
}
