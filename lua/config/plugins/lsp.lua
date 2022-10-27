local M = {}

function M.setup_mason(ma)
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
end

lsp_server = {
    "sumneko_lua",
    "rust_analyzer",
    "gopls"

}

function M.setup_mason_cfg(macfg)

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
end

return M