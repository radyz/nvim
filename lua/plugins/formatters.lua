return {
    {
        "mhartington/formatter.nvim",
        commit = "b9d7f853da1197b83b8edb4cc4952f7ad3a42e41",
        cmd = { "FormatWrite" },
        -- Unless a function is returned, the plugin is not loaded.
        opts = function()
            return {
                filetype = {
                    typescript = {
                        require("formatter.filetypes.typescript").prettier,
                    },
                    typescriptreact = {
                        require("formatter.filetypes.typescriptreact").prettier,
                    },
                    javascript = {
                        require("formatter.filetypes.javascript").prettier,
                    },
                    javascriptreact = {
                        require("formatter.filetypes.javascriptreact").prettier,
                    },
                    python = {
                        require("formatter.filetypes.python").black,
                    },
                    lua = {
                        require("formatter.filetypes.lua").stylua,
                    },
                    json = {
                        require("formatter.filetypes.json").prettier,
                    },
                    jsonc = {
                        require("formatter.filetypes.json").prettier,
                    },
                    toml = {
                        require("formatter.filetypes.toml"),
                    },
                    yaml = {
                        require("formatter.filetypes.yaml").prettier,
                    },
                    markdown = {
                        require("formatter.filetypes.markdown").prettier,
                    },
                    htmldjango = {
                        function()
                            local current_path = vim.fn.expand("%:p")
                            local djlintrc = vim.fn.findfile(".djlintrc", current_path .. ";")

                            return {
                                exe = "djlint",
                                args = {
                                    "-",
                                    "--reformat",
                                    "--profile",
                                    "django",
                                    "--configuration",
                                    djlintrc,
                                },
                                stdin = true,
                            }
                        end,
                    },
                    terraform = {
                        function()
                            return {
                                exe = "terraform",
                                args = {
                                    "fmt",
                                    "-",
                                },
                                stdin = true,
                            }
                        end,
                    },
                    rust = {
                        require("formatter.filetypes.rust").rustfmt,
                    },
                },
            }
        end,
        init = function()
            vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = {
                    "*.js",
                    "*.jsx",
                    "*.ts",
                    "*.tsx",
                    "*.json",
                    "*.py",
                    "*.lua",
                    "*.toml",
                    "*.yaml",
                    "*.md",
                    "*.html",
                    "*.tf",
                    "*.rs",
                },
                group = vim.api.nvim_create_augroup("FormatAutogroup", {}),
                command = "FormatWrite",
            })
        end,
    },
}
