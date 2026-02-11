return {
    "https://github.com/mattn/emmet-vim.git",
    "https://github.com/christoomey/vim-tmux-navigator.git",
    "https://github.com/simeji/winresizer.git",
    "https://github.com/tpope/vim-surround.git",
    "mg979/vim-visual-multi",
    "https://github.com/Raimondi/delimitMate.git",
    {
        "sudormrfbin/cheatsheet.nvim",
        opts = {
            bundled_cheatsheets = false,
            bundled_plugin_cheatsheets = false,
        },
        cmd = "Cheatsheet",
    },
    {
        "https://github.com/andymass/vim-matchup.git",
        init = function()
            vim.g.matchup_matchparen_deferred = 1
        end,
    },
    {
        "https://github.com/easymotion/vim-easymotion.git",
        lazy = false,
        keys = {
            { "/", "<Plug>(easymotion-sn)", mode = "n", desc = "[Text] Search", noremap = true },
            { "/", "<Plug>(easymotion-tn)", mode = "o", desc = "[Text] Search", noremap = true },
        },
    },
    {
        "nvimdev/hlsearch.nvim",
        event = "BufRead",
        opts = {},
    },
    {
        dir = vim.fn.stdpath("config") .. "/lua/local-plugins/json-tools",
        keys = {
            {
                "<leader>jp",
                function()
                    require("json-tools").inspect()
                end,
                mode = "v",
                desc = "[JSON] Preview",
                noremap = true,
            },
        },
    },
}
