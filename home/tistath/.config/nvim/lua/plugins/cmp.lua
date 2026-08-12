return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {--代码片段补全（比单个词长）
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Up>"]        = cmp.mapping(function(fallback) fallback() end, { "i", "s" }),--防止覆盖i模式的移动
        ["<Down>"]      = cmp.mapping(function(fallback) fallback() end, { "i", "s" }),
        ["<C-k>"]       = cmp.mapping.select_next_item(),--替换用上下移动
        ["<C-l>"]       = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({--按次序补全lsp提供的名称，文件中出现过的词，文件路径
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
