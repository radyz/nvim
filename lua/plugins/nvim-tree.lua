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
                vim.keymap.set(
                    "n",
                    "<leader>ff",
                    wrap_cwd_context(function(cwd)
                        require("telescope.builtin").find_files(
                            require("telescope.themes").get_dropdown({ cwd = cwd, previewer = false })
                        )
                    end),
                    opts("Find file")
                )
                vim.keymap.set(
                    "n",
                    "<leader>fl",
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

                -- Git
                vim.keymap.set(
                    "n",
                    "<leader>gt",
                    wrap_cwd_context(function(cwd)
                        local git_dir = vim.fn.FugitiveExtractGitDir(cwd)
                        if git_dir == "" then
                            vim.notify("Git directory not found", vim.log.levels.ERROR)
                            return
                        end

                        local function git_branch_yank()
                            local action_state = require("telescope.actions.state")
                            local selection = action_state.get_selected_entry()

                            vim.fn.setreg("+", selection.name)
                        end

                        require("telescope.builtin").git_branches(require("telescope.themes").get_dropdown({
                            cwd = vim.fn.substitute(git_dir, ".git", "", ""),
                            initial_mode = "normal",
                            previewer = false,
                            layout_config = {
                                width = 0.75,
                            },
                            attach_mappings = function(_, map)
                                map("n", "yy", git_branch_yank)
                                return true
                            end,
                        }))
                    end),
                    opts("Git branch")
                )

                vim.keymap.set(
                    "n",
                    "<leader>gl",
                    wrap_cwd_context(function(cwd)
                        local git_dir = vim.fn.FugitiveExtractGitDir(cwd)
                        if git_dir == "" then
                            vim.notify("Git directory not found", vim.log.levels.ERROR)
                            return
                        end

                        require("telescope").extensions.git_logs.git_logs({
                            initial_mode = "normal",
                            cwd = vim.fn.substitute(git_dir, ".git", "", ""),
                        })
                    end),
                    opts("Git logs")
                )
            end,
        },
        keys = {
            { "<leader>nt", ":NvimTreeToggle<CR>", desc = "[Tree] Toggle tree", mode = "n", noremap = true },
            { "<leader>nf", ":NvimTreeFindFile<CR>", desc = "[Tree] Find file", mode = "n", noremap = true },
        },
    },
}
