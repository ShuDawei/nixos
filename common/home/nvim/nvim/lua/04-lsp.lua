local lib = require("lib.lsp")

require("neodev").setup()
require("fidget").setup({
    progress = {
        display = {
            progress_icon = { ".  ", ".. ", "..." },
            done_icon = "[done]",
        },
    },
})

lib.setupls("rust_analyzer")
lib.setupls("lua_ls", {
    Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
    }
})
lib.setupls("tsserver")
lib.setupls("rnix")

local cmp = require("cmp")
cmp.setup({
    mapping = {
        ["<c-space>"] = cmp.mapping.complete(),
        ["<tab>"] = cmp.mapping.select_next_item(),
        ["<s-tab>"] = cmp.mapping.select_prev_item(),
        ["<cr>"] = cmp.mapping.confirm({ select = true }),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
})
