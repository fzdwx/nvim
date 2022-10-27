local tok, ma = pcall(require, "mason")

if not tok then
    return
end

ma.setup({
    keymaps = {
        toggle_package_expand = "<CR>",
        install_package = "i",
        update_package = "u",
        check_package_version = "c",
        update_all_packages = "U",
        check_outdated_packages = "C",
        uninstall_package = "X",
        cancel_installation = "<C-c>",
        apply_language_filter = "<C-f>",
    },

})

local tok2, macfg = pcall(require, "mason-lspconfig")

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
    function(server_name)
        -- default handler (optional)
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("lspconfig")[server_name].setup {
            capabilities = capabilities
        }
    end,

    ["rust_analyzer"] = function()
        local rt = require("rust-tools")
        rt.setup({
            server = {
                on_attach = function(_, bufnr)
                    vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                end,
            },
        })
    end,
}