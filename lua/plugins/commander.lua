return {
    {
        "FeiyouG/commander.nvim",
        commit = "84101e8eb1613a72bbdec655b734f891d8a00694",
        opts = function()
            return {
                components = {
                    "DESC",
                    "KEYS",
                },
                sorty_by = {
                    "DESC",
                },
                integration = {
                    lazy = {
                        enable = true,
                    },
                    telescope = {
                        enable = true,
                    },
                },
            }
        end,
        keys = {
            { "fc", ":Telescope commander<CR>", mode = "n" },
        },
    },
}
