return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "v0.2.0",
        dependencies = {
            { "nvim-lua/plenary.nvim", commit = "b9fd5226c2f76c951fc8ed5923d85e4de065e509" },
        },
        lazy = false,
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ["<c-n>"] = "nop",
                        ["<c-p>"] = "nop",
                        ["<c-j>"] = "move_selection_next",
                        ["<c-k>"] = "move_selection_previous",
                    },
                    n = {
                        ["q"] = "close",
                        ["]"] = "cycle_previewers_next",
                        ["["] = "cycle_previewers_prev",
                    },
                },
                get_selection_window = function(_, _)
                    local picked_window_id = require("window-picker").pick_window({
                        filter_rules = {
                            include_current_win = true,
                        },
                    }) or vim.api.nvim_get_current_win()

                    return picked_window_id
                end,
            },
            pickers = {
                buffers = {
                    mappings = {
                        n = {
                            ["dd"] = "delete_buffer",
                        },
                    },
                    theme = "ivy",
                },
                git_branches = {
                    mappings = {
                        i = {
                            ["<c-a>"] = "nop",
                            ["<c-d>"] = "nop",
                            ["<c-b>"] = "git_create_branch",
                            ["dd"] = "git_delete_branch",
                        },
                        n = {
                            ["<c-a>"] = "nop",
                            ["<c-d>"] = "nop",
                            ["<c-b>"] = "git_create_branch",
                            ["dd"] = "git_delete_branch",
                        },
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        },
        keys = {
            {
                "ff",
                ":Telescope find_files previewer=false theme=dropdown<CR>",
                desc = "[File] Find file",
                mode = "n",
                noremap = true,
            },
            { "fl", ":Telescope live_grep<CR>", desc = "[File] Find text", mode = "n", noremap = true },
            {
                "fw",
                ":Telescope grep_string initial_mode=normal<CR>",
                desc = "[File] Find word",
                mode = "n",
                noremap = true,
            },
            {
                "fb",
                ":Telescope buffers initial_mode=normal<CR>",
                desc = "[File] Find buffer",
                mode = "n",
                noremap = true,
            },
            {
                "fd",
                ":Telescope diagnostics bufnr=0 initial_mode=normal theme=ivy<CR>",
                desc = "[File] Find diagnostics",
                mode = "n",
                noremap = true,
            },
        },
        init = function()
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("git_signs")
            require("telescope").load_extension("git_logs")
            require("telescope").load_extension("neoclip")
            require("telescope").load_extension("dadbod_wrapper")

            -- Add line numbering to preview buffers
            vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
        end,
    },
    { "s1n7ax/nvim-window-picker", tag = "v2.4.0" },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        commit = "6fea601bd2b694c6f2ae08a6c6fab14930c60e2c",
    },
}
