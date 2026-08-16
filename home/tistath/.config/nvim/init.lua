-- Leader键
vim.g.mapleader         = " "
vim.g.maplocalleader    = " "

-- 基础设置
vim.opt.tabstop         = 8             --缩进显示为8
vim.opt.softtabstop     = 8             --tab输出8
vim.opt.shiftwidth      = 8             -->>,<<输出8
vim.opt.expandtab       = true          --存储为8空格 
vim.opt.smarttab        = true          --行首shiftwidth，其他tabstop
vim.opt.smartindent     = true          --回车继承上一行缩进
vim.opt.clipboard       = "unnamedplus" --使用系统剪切板
vim.opt.number          = true          --显示行号
vim.opt.cursorline      = true          --高亮当前行
vim.opt.termguicolors   = true          --启用真彩色
vim.opt.hlsearch        = true          --高亮搜索结果
vim.opt.incsearch       = true          --实时搜索
vim.opt.ignorecase      = true          --忽略大小写
vim.opt.smartcase       = true          --输入含大写时不忽略

-- 键位映射
vim.keymap.set("n", "j",          "h",                                { noremap = true, silent = true,                    })
vim.keymap.set("n", "k",          "j",                                { noremap = true, silent = true,                    })
vim.keymap.set("n", "l",          "k",                                { noremap = true, silent = true,                    })
vim.keymap.set("n", ";",          "l",                                { noremap = true, silent = true,                    })
vim.keymap.set("n", "'",          ":",                                { noremap = true, silent = true,                    })
vim.keymap.set("n", ":",          ";",                                { noremap = true, silent = true,                    })

vim.keymap.set("v", "j",          "h",                                { noremap = true, silent = true,                    })
vim.keymap.set("v", "k",          "j",                                { noremap = true, silent = true,                    })
vim.keymap.set("v", "l",          "k",                                { noremap = true, silent = true,                    })
vim.keymap.set("v", ";",          "l",                                { noremap = true, silent = true,                    })

vim.keymap.set("o", "j",          "h",                                { noremap = true, silent = true,                    })
vim.keymap.set("o", "k",          "j",                                { noremap = true, silent = true,                    })
vim.keymap.set("o", "l",          "k",                                { noremap = true, silent = true,                    })
vim.keymap.set("o", ";",          "l",                                { noremap = true, silent = true,                    })

vim.keymap.set("i", "jk",         "<Esc>",                            { noremap = true, silent = true,                    })

vim.keymap.set("n", "<Leader>ms", ":messages<CR>",                    { noremap = true, silent = true, desc = "消息记录", })
vim.keymap.set("n", "<Leader>tm", ":belowright split | terminal<CR>", { noremap = true, silent = true, desc = "终端小窗", })
vim.keymap.set("t", "<Esc>",      "<C-\\><C-N>",                      { noremap = true, silent = true,                    })

vim.opt.guicursor =  "n-v-c-ve:block,"
                  .. "i-ci:block-blinkwait0-blinkon1-blinkoff1,"
                  .. "r-cr-o:hor1"

-- 加载 lazy.nvim
require("config.lazy")

--关闭浮窗背景
vim.api.nvim_set_hl(0, "NormalFloat",       { bg = "NONE" })

-- 修复 :: 的缩进和高亮问题
vim.api.nvim_create_autocmd("FileType",{
  pattern = "cpp",
  callback = function()
    vim.bo.cinkeys = "0{,0},0),:,0#,!^F,o,O,e"
    vim.bo.cinwords = "if,else,while,do,for,switch"
  end,
})

