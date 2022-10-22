local tok,ma = pcall(require,"mason")

if not tok then
    return
end

ma.setup()

local tok2,macfg = pcall(require,"mason-lspconfig")

if not tok2 then
    return
end


lsp_server = {
    "sumneko_lua",
    "rust_analyzer",
    "gopls"

}

macfg.setup({

     ensure_installed = lsp_server

})

macfg.setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("lspconfig")[server_name].setup {
                capabilities = capabilities
            }
        end,
        -- Next, you can provide targeted overrides for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["rust_analyzer"] = function ()
           -- require("rust-tools").setup {}
        end
    }
