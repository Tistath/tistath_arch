-- 语法解析树
return {
        "nvim-treesitter/nvim-treesitter",

        lazy   = false,

        build  = ":TSUpdate",

        config = function()
                local treesitter = require("nvim-treesitter")

                treesitter.setup({
                        ensure_installed = {
                                "c",               
                                "cpp",             
                                "css",             
                                "python",          
                                "lua",             
                                "html",            
                                "xml",             
                                "bash",            
                                "make",            
                                "cmake",           
                                "latex",           
                                "markdown",        
                                "markdown_inline", 
                                "zsh",             
                                "json",            
                                "ini",             
                                "kdl",             
                                "toml",            
                                "yaml",            
                                "regex",           
                                "vim",             
                                "vimdoc",          
                                "query",           
                                "gitcommit",       
                                "gitignore",       
                        },
                        highlight        = {
                                enable = true,
                        },
                        fold             = {
                                enable = true,
                        },
                })

                vim.api.nvim_create_autocmd("FileType", {
                        pattern  = {
                                "c",
                                "cpp",
                                "css",
                                "python",
                                "lua",
                                "html",
                                "xml",
                                "bash",
                                "make",
                                "cmake",
                                "latex",
                                "markdown",
                                "markdown_inline",
                                "zsh",
                                "json",
                                "ini",
                                "kdl",
                                "toml",
                                "yaml",
                                "regex",
                                "vim",
                                "vimdoc",
                                "query",
                                "gitcommit",
                                "gitignore",
                        },
                        callback = function()
                                pcall(vim.treesitter.start)
                        end,
                })
        end,
}
