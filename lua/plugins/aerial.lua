return {
    {
        "stevearc/aerial.nvim",
        commit = "8bb8697d180681746da41bef5c8691d04443af36",
        opts = function()
            local List = require("plenary.collections.py_list")
            local constants = require("constants")

            return {
                backends = { "treesitter", "lsp" },
                ignore = {
                    filetypes = List({ "markdown" }):concat(constants.ignored_buffer_types),
                },
                post_parse_symbol = function(_, item, ctx)
                    if ctx.backend_name == "treesitter" then
                        if ctx.match.private then
                            item.name = " " .. item.name
                        elseif ctx.match.protected then
                            item.name = " " .. item.name
                        end
                    end

                    return true
                end,
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
