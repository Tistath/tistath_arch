-- Leader键
vim.g.mapleader         = " "
vim.g.maplocalleader    = " "
-- 基础设置
vim.opt.tabstop         = 8
vim.opt.softtabstop     = 8
vim.opt.shiftwidth      = 8
vim.opt.expandtab       = true
vim.opt.smarttab        = true
vim.opt.smartindent     = true
vim.opt.clipboard       = "unnamedplus"
vim.opt.number          = true
vim.opt.cursorline      = true
vim.opt.termguicolors   = true
vim.opt.hlsearch        = true
vim.opt.incsearch       = true
vim.opt.ignorecase      = true
vim.opt.smartcase       = true
-- 键位映射
vim.keymap.set("n", "j",                "h",                                    { noremap = true, silent = true })
vim.keymap.set("n", "k",                "j",                                    { noremap = true, silent = true })
vim.keymap.set("n", "l",                "k",                                    { noremap = true, silent = true })
vim.keymap.set("n", ";",                "l",                                    { noremap = true, silent = true })
vim.keymap.set("n", "'",                ":",                                    { noremap = true, silent = true })

vim.keymap.set("v", "j",                "h",                                    { noremap = true, silent = true })
vim.keymap.set("v", "k",                "j",                                    { noremap = true, silent = true })
vim.keymap.set("v", "l",                "k",                                    { noremap = true, silent = true })
vim.keymap.set("v", ";",                "l",                                    { noremap = true, silent = true })

vim.keymap.set("o", "j",                "h",                                    { noremap = true, silent = true })
vim.keymap.set("o", "k",                "j",                                    { noremap = true, silent = true })
vim.keymap.set("o", "l",                "k",                                    { noremap = true, silent = true })
vim.keymap.set("o", ";",                "l",                                    { noremap = true, silent = true })

vim.keymap.set("i", "jk",               "<Esc>",                                { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>ms",       ":messages<CR>",                        { noremap = true, silent = true, desc = "消息记录", })
vim.keymap.set("n", "<Leader>tm",       ":belowright split | terminal<CR>",     { noremap = true, silent = true, desc = "终端小窗", })
vim.keymap.set("t", "<Esc>",            "<C-\\><C-N>",                          { noremap = true, silent = true })
-- 光标设置
vim.opt.guicursor       = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait500-blinkoff200-blinkon300"
vim.opt.cursorline      = true
-- 加载 lazy.nvim
require("config.lazy")
-- 修复 :: 的缩进和高亮问题
vim.api.nvim_create_autocmd("FileType",{
  pattern = "cpp",
  callback = function()
    vim.bo.cinkeys = "0{,0},0),:,0#,!^F,o,O,e"
    vim.bo.cinwords = "if,else,while,do,for,switch"
  end,
})
