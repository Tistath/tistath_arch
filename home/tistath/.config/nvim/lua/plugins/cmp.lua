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
      snippet = { -- 代码片段补全（比单个词长）
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"]  = cmp.mapping.select_next_item(),         -- 下一候选词
        ["<C-k>"]  = cmp.mapping.select_prev_item(),         -- 上一候选词
        ["<C-CR>"] = cmp.mapping.confirm({ select = true }), -- 接受建议
        ["<C-u>"]  = cmp.mapping.abort(),                    -- 取消建议
      }),
      sources = cmp.config.sources({ -- 按次序补全文件中出现过的词，lsp提供的名称，文件路径
        { name = "buffer"   },
        { name = "nvim_lsp" },
        { name = "path"     },
      }),
    })
  end,
}
