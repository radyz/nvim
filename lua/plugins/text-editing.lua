return {
    "https://github.com/tpope/vim-surround.git",
    "mg979/vim-visual-multi",
    "https://github.com/Raimondi/delimitMate.git",
    {
        "https://github.com/andymass/vim-matchup.git",
        init = function()
            vim.g.matchup_matchparen_deferred = 1
        end,
    },
    {
        "https://github.com/AckslD/nvim-neoclip.lua.git",
        opts = {
            history = 100,
            keys = {
                telescope = {
                    i = {
                        select = "<CR>",
                        paste = "<C-p>",
                        paste_behind = "<C-P>",
                    },
                    n = {
                        select = "<CR>",
                        paste = "p",
                        paste_behind = "P",
                    },
                },
            },
        },
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
}
