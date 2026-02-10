return {
    { "tpope/vim-dadbod", commit = "e95afed23712f969f83b4857a24cf9d59114c2e6" },
    {
        "radyz/vim-dadbod-wrapper",
        opts = {
            env_prefix = "DADBOD_",
        },
        keys = {
            {
                "<localleader>r",
                function()
                    require("telescope").extensions.dadbod_wrapper.connections(
                        require("telescope.themes").get_dropdown({
                            initial_mode = "normal",
                        })
                    )
                end,
                ft = { "sql" },
                mode = { "n", "v" },
            },
        },
    },
}
