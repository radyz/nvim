return {
    {
        "nvim-tree/nvim-tree.lua",
        tag = "v1.14.0",
        lazy = false,
        dependencies = {
            { "nvim-tree/nvim-web-devicons", commit = "8dcb311b0c92d460fac00eac706abd43d94d68af" },
        },
        opts = {
            view = {
                adaptive_size = true,
            },
            actions = {
                open_file = {
                    resize_window = false,
                    quit_on_open = true,
                },
            },
            filters = {
                dotfiles = true,
            },
            diagnostics = {
                enable = true,
            },
            renderer = {
                indent_markers = {
                    enable = true,
                },
            },
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                local function wrap_cwd_context(f)
                    return function(node, ...)
                        node = node or api.tree.get_node_under_cursor()

                        local cwd = "."
                        if node.type == "directory" then
                            cwd = node.absolute_path
                        elseif node.type == "file" then
                            cwd = vim.fn.fnamemodify(node.absolute_path, ":h")
                        end

                        f(cwd, node, ...)
                    end
                end

                api.config.mappings.default_on_attach(bufnr)

                -- CUSTOM
                vim.keymap.set("n", "<C-o>", api.node.run.system, opts("Run System"), { noremap = true })
                vim.keymap.set(
                    "n",
                    "f",
                    wrap_cwd_context(function(cwd)
                        require("telescope.builtin").find_files(
                            require("telescope.themes").get_dropdown({ cwd = cwd, previewer = false })
                        )
                    end),
                    opts("Find file")
                )
                vim.keymap.set(
                    "n",
                    "s",
                    wrap_cwd_context(function(cwd)
                        require("telescope.builtin").live_grep({ cwd = cwd })
                    end),
                    opts("Search text")
                )

                vim.keymap.set(
                    "n",
                    "S",
                    wrap_cwd_context(function(cwd)
                        api.tree.close()
                        require("spectre").open_visual({ cwd = cwd })
                    end),
                    opts("Search & Replace")
                )
            end,
        },
        keys = {
            { "<leader>nt", ":NvimTreeToggle<CR>", desc = "[Tree] Toggle tree", mode = "n", noremap = true },
            { "<leader>nf", ":NvimTreeFindFile<CR>", desc = "[Tree] Find file", mode = "n", noremap = true },
        },
    },
}
