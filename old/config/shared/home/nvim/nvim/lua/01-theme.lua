-- rose-pine/neovim --
require("rose-pine").setup({
    disable_italics = true,
    highlight_groups = {
        DiagnosticUnderlineInfo = { undercurl = false, underline = true },
        DiagnosticUnderlineHint = { undercurl = false, underline = true },
        DiagnosticUnderlineWarn = { undercurl = false, underline = true },
        DiagnosticUnderlineError = { undercurl = false, underline = true },
        TelescopeNormal = { bg = "base" },
        TelescopeBorder = { bg = "base" },
        TelescopePromptNormal = { bg = "base" },
    },
})
vim.cmd.colorscheme("rose-pine")

-- nvim-lualine/lualine.nvim --
require("lualine").setup({
    options = {
        theme = "rose-pine",
        icons_enabled = false,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
    },
})
