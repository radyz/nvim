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
        lazy = false,
        tag = "v3.9.1",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
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
