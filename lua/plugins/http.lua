return {
    {
        "mistweaverco/kulala.nvim",
        ft = { "http" },
        opts = {},
        keys = {
            {
                "<localleader>r",
                function()
                    require("kulala").run()
                end,
                mode = { "n", "v" },
                desc = "Send request",
            },
        },
    },
}
