return {
    {
        "nvim-pack/nvim-spectre",
        commit = "72f56f7585903cd7bf92c665351aa585e150af0f",
        cmd = {
            "Spectre",
        },
        keys = {
            {
                "q",
                function()
                    require("spectre").close()
                end,
                mode = "n",
                desc = "[Text] Close search",
                ft = { "spectre_panel" },
                noremap = true,
            },
        },
        commander = {
            {
                desc = "[Text] Search & Replace",
                cmd = function()
                    require("spectre").open_visual({ select_word = true })
                end,
            },
            {
                desc = "[Text] Search & Replace file",
                cmd = function()
                    require("spectre").open_file_search({ select_word = true })
                end,
            },
        },
    },
}
