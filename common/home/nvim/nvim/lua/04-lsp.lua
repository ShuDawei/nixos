local lib = require("lib.lsp")

require("neodev").setup()
require("fidget").setup({
    progress = {
        display = {
            progress_icon = { pattern = { ".  ", ".. ", "..." }, period = 2 },
            done_icon = "[done]",
        },
    },
})

lib.setupls("rust_analyzer")
lib.setupls("jdtls")
lib.setupls("lua_ls", {
    Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
    }
})
lib.setupls("tsserver")

require("jdtls").start_or_attach({
    cmd = { "/etc/profiles/per-user/shudawei/bin/jdtls" },
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1])
})

local cmp = require("cmp")
cmp.setup({
    mapping = {
        ["<c-space>"] = cmp.mapping.complete(),
        ["<c-j>"] = cmp.mapping.select_next_item(),
        ["<c-k>"] = cmp.mapping.select_prev_item(),
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
