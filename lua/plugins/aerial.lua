return {
    {
        "stevearc/aerial.nvim",
        tag = "v4.0.0",
        opts = function()
            local List = require("plenary.collections.py_list")
            local constants = require("constants")

            return {
                backends = { "treesitter", "lsp" },
                ignore = {
                    filetypes = List({ "markdown" }):concat(constants.ignored_buffer_types),
                },
                float = {
                    override = function(conf)
                        conf.width = 40
                        return conf
                    end,
                },
            }
        end,
        cmd = { "AerialToggle" },
        keys = {
            { "gc", ":AerialToggle float<CR>", desc = "[Code] Navigation", mode = "n" },
        },
    },
}
