local on_attach = function(_, buf)
    local bufmap = function(mode, keys, fn)
        vim.keymap.set(mode, keys, fn, { buffer = buf })
    end
    bufmap("n", "gd", vim.lsp.buf.definition)
    bufmap("n", "gD", vim.lsp.buf.declaration)
    bufmap("n", "gi", vim.lsp.buf.implementation)
    bufmap("n", "gr", vim.lsp.buf.references)
    bufmap("n", "K", vim.lsp.buf.hover)
    bufmap("i", "<c-k>", vim.lsp.buf.signature_help)
    bufmap("n", "<leader>ce", vim.diagnostic.open_float)
    bufmap("n", "gn", vim.diagnostic.goto_next)
    bufmap("n", "gp", vim.diagnostic.goto_prev)
    bufmap("n", "<leader>cr", vim.lsp.buf.rename)
    bufmap("n", "<leader>ca", vim.lsp.buf.code_action)
    bufmap("n", "<leader>fd", ":Telescope diagnostics<cr>")
    bufmap("n", "<leader>fs", ":Telescope lsp_document_symbols<cr>")
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = buf,
        callback = function()
            vim.lsp.buf.format({ async = false })
        end
    })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lspconfig = require("lspconfig")

return {
    setupls = function(name, settings)
        lspconfig[name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = settings
        })
    end,
}
