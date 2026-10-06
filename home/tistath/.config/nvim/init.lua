-- 行号

vim.opt.number         = true                              -- 显示行号
vim.opt.relativenumber = true                              -- 相对行号
vim.opt.cursorline     = true                              -- 高亮当前行
vim.opt.linebreak      = true                              -- 折行时按词断
vim.opt.scrolloff      = 8                                 -- 光标上下留8行

-- 缩进

vim.opt.tabstop        = 8                                 -- Tab显示宽度
vim.opt.shiftwidth     = 8                                 -- 自动缩进宽度
vim.opt.softtabstop    = 8                                 -- 插入模式Tab宽度
vim.opt.expandtab      = true                              -- Tab转空格
vim.opt.autoindent     = true                              -- 继承上一行缩进
vim.opt.smartindent    = true                              -- 根据语法缩进
vim.opt.shiftround     = true                              -- 缩进对齐到shiftwidth的倍数
vim.opt.smarttab       = true                              -- 行首shiftwidth，其他tabstop

-- 搜索

vim.opt.ignorecase     = true                              -- 忽略大小写
vim.opt.smartcase      = true                              -- 有大写时区分大小写
vim.opt.incsearch      = true                              -- 边输边搜
vim.opt.hlsearch       = true                              -- 高亮匹配
vim.opt.wrapscan       = true                              -- 搜到末尾回到开头

-- 界面

vim.opt.termguicolors  = true                              -- 真彩色
vim.opt.background     = "dark"                            -- dark/light

-- 编辑行为

vim.opt.clipboard      = "unnamedplus"                     -- 用系统剪贴板
vim.opt.mouse          = "a"                               -- 所有模式启用鼠标
vim.opt.backspace      = "indent,eol,start"                -- 退格可删除缩进、行首尾
vim.opt.whichwrap      = "b,s,<,>,[,],h,l"                 -- 允许跨行的键
vim.opt.iskeyword:append("-")                              -- 把-当作词的一部分
vim.opt.virtualedit    = "block"                           -- 块选择可超出行尾
vim.opt.selection      = "inclusive"                       -- 选择包含末字符

-- 文件与编码

vim.opt.encoding       = "utf-8"                           --内部编码
vim.opt.fileencoding   = "utf-8"                           -- 读取编码
vim.opt.fileformats    = "unix,dos,mac"                    -- 依次识别存储格式
vim.opt.fileformat     = "unix"                            -- 存储格式
vim.opt.undofile       = true                              -- 持久化撤销

-- 折叠

vim.opt.foldmethod     = "expr"                            -- 按语法折叠
vim.opt.foldexpr       = "v:lua.vim.treesitter.foldexpr()" -- 根据语法树折叠
vim.opt.foldlevel      = 99                                -- 当前层级折叠阈值
vim.opt.foldlevelstart = 99                                -- 打开文件时折叠阈值

 -- 命令行历史

vim.opt.history        = 1024                              -- 历史存储条数

-- 其他

vim.g.mapleader        = " "                               -- 全局Leader键
vim.g.maplocalleader   = " "                               -- 当前缓冲区Leader键
vim.g.have_nerd_font   = true                              -- 启用Nerd Font
vim.g.editorconfig     = true                              -- 读取语法规范文件自动设置

-- 光标样式
vim.opt.guicursor      = "n-v-c-ve:block,"
                      .. "i-ci:block-blinkwait0-blinkon1-blinkoff1,"
                      .. "r-cr-o:hor1"

-- 加载lazy.nvim
require("config.lazy")

-- 关闭浮窗背景
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })

-- 修复::的缩进和高亮问题
vim.api.nvim_create_autocmd("FileType",{
        pattern = "cpp",
        callback = function()
                vim.bo.cinkeys = "0{,0},0),:,0#,!^F,o,O,e"
                vim.bo.cinwords = "if,else,while,do,for,switch"
        end,
})

