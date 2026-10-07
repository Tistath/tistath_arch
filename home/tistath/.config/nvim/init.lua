-- 行号

-- 显示行号
vim.opt.number         = true
-- 相对行号
vim.opt.relativenumber = true

-- 高亮当前行
vim.opt.cursorline     = true

-- 光标上下留8行
vim.opt.scrolloff      = 8

-- 缩进

-- Tab显示宽度
vim.opt.tabstop        = 8
-- 自动缩进宽度
vim.opt.shiftwidth     = 8
-- 插入模式Tab宽度
vim.opt.softtabstop    = 8

-- Tab转空格
vim.opt.expandtab      = true

-- 继承上一行缩进
vim.opt.autoindent     = true
-- 根据语法缩进
vim.opt.smartindent    = true
-- 缩进对齐到shiftwidth的倍数
vim.opt.shiftround     = true
-- 行首shiftwidth，其他tabstop
vim.opt.smarttab       = true

-- 搜索

-- 忽略大小写
vim.opt.ignorecase     = true
-- 有大写时区分大小写
vim.opt.smartcase      = true

-- 边输边搜
vim.opt.incsearch      = true

-- 高亮匹配
vim.opt.hlsearch       = true

-- 搜到末尾回到开头
vim.opt.wrapscan       = true

-- 界面

-- 真彩色
vim.opt.termguicolors  = true

-- dark/light
vim.opt.background     = "dark"

-- 编辑行为

-- 用系统剪贴板
vim.opt.clipboard      = "unnamedplus"

-- 所有模式启用鼠标
vim.opt.mouse          = "a"

-- 退格可删除缩进、行首尾
vim.opt.backspace      = "indent,eol,start"

-- 允许跨行的键
vim.opt.whichwrap      = "b,s,<,>,[,],h,l"

-- 把-当作词的一部分
vim.opt.iskeyword:append("-")

-- 块选择可超出行尾
vim.opt.virtualedit    = "block"
-- 块选择包含末字符
vim.opt.selection      = "inclusive"

-- 文件与编码

--内部编码
vim.opt.encoding       = "utf-8"
-- 读取编码
vim.opt.fileencoding   = "utf-8"

-- 依次识别存储格式
vim.opt.fileformats    = "unix,dos,mac"
-- 存储格式
vim.opt.fileformat     = "unix"

-- 持久化撤销
vim.opt.undofile       = true

-- 折叠

-- 按语法折叠
vim.opt.foldmethod     = "expr"
-- 根据语法树折叠
vim.opt.foldexpr       = "v:lua.vim.treesitter.foldexpr()"

-- 当前层级折叠阈值
vim.opt.foldlevel      = 99
-- 打开文件时折叠阈值
vim.opt.foldlevelstart = 99

-- 命令行历史

-- 历史存储条数
vim.opt.history        = 1024

-- 其他

-- 全局Leader键
vim.g.mapleader        = " "
-- 当前缓冲区Leader键
vim.g.maplocalleader   = " "

-- 启用Nerd Font
vim.g.have_nerd_font   = true

-- 读取语法规范文件自动设置
vim.g.editorconfig     = true

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

