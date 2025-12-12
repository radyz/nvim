return {
    {
        "https://github.com/radyz/harpoon.git",
        branch = "feat/path-display-support",
        keys = {
            {
                "mf",
                function()
                    require("harpoon.mark").add_file()
                end,
                desc = "[File] Add mark",
                mode = "n",
                noremap = true,
            },
            {
                "fm",
                function()
                    require("telescope").extensions.harpoon.marks(require("telescope.themes").get_dropdown({
                        initial_mode = "normal",
                        previewer = false,
                        path_display = {
                            shorten = { len = 1, exclude = { 1, -1, -2 } },
                        },
                    }))
                end,
                desc = "[File] Find mark",
                mode = "n",
                noremap = true,
            },
        },
    },
}
