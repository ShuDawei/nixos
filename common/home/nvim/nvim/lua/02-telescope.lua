require("telescope").setup({
    defaults = {
        border = {},
        borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
        file_ignore_patterns = {
            "build",
            "bin",
        }
    },
})

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fi", ":Telescope current_buffer_fuzzy_find<cr>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")
