return {
    "https://github.com/christoomey/vim-tmux-navigator.git",
    "https://github.com/simeji/winresizer.git",
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        init = function()
            vim.g.mkdp_auto_close = 1
            vim.g.mkdp_refresh_slow = 1
        end,
        ft = "markdown",
    },
    {
        "rest-nvim/rest.nvim",
        tag = "v1.1.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("rest-nvim").setup({
                result_split_horizontal = true,
                skip_ssl_verification = true,
                result = {
                    show_curl_command = false,
                },
            })
        end,
    },
    {
        "sudormrfbin/cheatsheet.nvim",
        opts = {
            bundled_cheatsheets = false,
            bundled_plugin_cheatsheets = false,
        },
        cmd = "Cheatsheet",
    },
    {
        "lpoto/telescope-docker.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        commander = {
            {
                cat = "Docker",
                desc = "[Docker] Find container",
                cmd = ":Telescope docker theme=ivy<CR>",
            },
        },
        init = function()
            require("telescope").load_extension("docker")
        end,
    },
    {
        "s1n7ax/nvim-window-picker",
        name = "window-picker",
        event = "VeryLazy",
        version = "2.*",
        opts = {},
    },
}
