-- stevearc/oil.nvim --
require("oil").setup({
    default_file_explorer = true,
    view_options = {
        show_hidden = true,
    },
})
vim.keymap.set("n", "<leader>fe", ":Oil<cr>")

-- windwp/nvim-autopairs --
require("nvim-autopairs").setup()

-- stevearc/dressing.nvim --
-- require("dressing").setup()

-- lewis6991/gitsigns.nvim --
-- require("gitsigns").setup({
--     signs = {
--         add          = { text = "+" },
--         change       = { text = '_' },
--         delete       = { text = '-' },
--         topdelete    = { text = '-' },
--         changedelete = { text = '~' },
--         untracked    = { text = '?' },
--     },
-- })

-- nvchad/nvim-colorizer.lua --
require("colorizer").setup({
    user_default_options = {
        names = false,
    },
})

require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    indent = { enable = true },
})
