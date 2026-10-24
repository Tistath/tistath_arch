-- 语法解析树
return {
        "nvim-treesitter/nvim-treesitter",

        lazy   = false,

        -- 更新parser
        build  = ":TSUpdate",

        config = function()
                local treesitter = require("nvim-treesitter")

                treesitter.setup({
                        -- 确保安装的parser列表
                        ensure_installed = {
                                -- 狭义编程语言
                                "c",
                                "cpp",
                                "python",
                                "lua",

                                -- 标记语言
                                "html",
                                "xml",

                                -- 层叠样式表
                                "css",

                                -- 构建文件
                                "make",
                                "cmake",

                                -- 文本渲染
                                "latex",
                                "markdown",
                                "markdown_inline",

                                -- Shell语言
                                "bash",
                                "zsh",

                                -- 配置语言
                                "json",
                                "ini",
                                "kdl",
                                "toml",
                                "yaml",
                                "kitty",

                                -- 正则表达式
                                "regex",

                                -- Neovim相关
                                "vim",
                                "vimdoc",

                                -- Git相关
                                "gitcommit",
                                "gitignore",
                        },
                        -- 启用高亮
                        highlight        = {
                                enable = true,
                        },
                        -- 按语法折叠
                        fold             = {
                                enable = true,
                        },
                })

                -- 确保启动
                vim.api.nvim_create_autocmd("FileType", {
                        pattern  = {
                                -- 狭义编程语言
                                "c",
                                "cpp",
                                "python",
                                "lua",

                                -- 标记语言
                                "html",
                                "xml",

                                -- 层叠样式表
                                "css",

                                -- 构建文件
                                "make",
                                "cmake",

                                -- 文本渲染
                                "latex",
                                "markdown",
                                "markdown_inline",

                                -- Shell语言
                                "bash",
                                "zsh",

                                -- 配置语言
                                "json",
                                "ini",
                                "kdl",
                                "toml",
                                "yaml",
                                "kitty",

                                -- 正则表达式
                                "regex",

                                -- Neovim相关
                                "vim",
                                "vimdoc",

                                -- Git相关
                                "gitcommit",
                                "gitignore",
                        },

                        callback = function()
                                pcall(vim.treesitter.start)
                        end,
                })
        end,
}
