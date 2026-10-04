return {
        "nvim-telescope/telescope.nvim",

        lazy         = false,

        dependencies = {
                "nvim-lua/plenary.nvim",
        },

        config       = function()
                local telescope = require("telescope")
                local builtin   = require("telescope.builtin")

                telescope.setup({
                        pickers = {
                                find_files = {
                                        hidden    = true,
                                        no_ignore = true,
                                },
                                live_grep = {
                                        hidden    = true,
                                        no_ignore = true,
                                },
                        },
                })

                vim.keymap.set('n', "<Leader>ff", builtin.find_files,           { desc = "查找文件" })
                vim.keymap.set('n', "<Leader>fg", builtin.live_grep,            { desc = "实时 grep" })
                vim.keymap.set('n', "<Leader>fb", builtin.buffers,              { desc = "查找缓冲区" })
                vim.keymap.set('n', "<Leader>fs", builtin.lsp_document_symbols, { desc = "查找 LSP 符号"})
                vim.api.nvim_set_hl(0, "TelescopeTitle",  { bg = "NONE" })
                vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
        end,
}
