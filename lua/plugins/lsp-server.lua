return {
    {
        "neovim/nvim-lspconfig",
        commit = "ad95655ec5d13ff7c728d731eb9fd39f34395a03",
        init = function()
            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set(
                        "n",
                        "gd",
                        ":Telescope lsp_definitions show_line=false theme=ivy initial_mode=normal jump_type=never<CR>",
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "gi",
                        ":Telescope lsp_implementations show_line=false theme=ivy initial_mode=normal jump_type=never<CR>",
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "gt",
                        ":Telescope lsp_type_definitions show_line=false theme=ivy initial_mode=normal jump_type=never<CR>",
                        opts
                    )
                    vim.keymap.set(
                        "n",
                        "gr",
                        ":Telescope lsp_references include_declaration=false show_line=false theme=ivy initial_mode=normal<CR>",
                        opts
                    )
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "fa", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
                end,
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lsp_servers = {
                ts_ls = {},
                pyright = {},
                ruff = {
                    on_attach = function(client, _)
                        -- Disable hover in favor of Pyright
                        client.server_capabilities.hoverProvider = false
                    end,
                },
                terraformls = {},
                lua_ls = {},
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            check = {
                                command = "clippy",
                                extraArgs = {
                                    "--",
                                    "--no-deps",
                                    "-Wclippy::all",
                                },
                            },
                        },
                    },
                },
            }

            for server, opts in pairs(lsp_servers) do
                opts.capabilities = capabilities
                vim.lsp.config(server, opts)
                vim.lsp.enable(server)
            end
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        commit = "7d3bb0a641f516f1c7fd2e47852580dadbd7a430",
        event = "InsertEnter",
        opts = {},
    },
}
