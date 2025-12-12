return {
    {
        "L3MON4D3/LuaSnip",
        tag = "v2.4.1",
        build = "make install_jsregexp",
        dependencies = {
            {
                "rafamadriz/friendly-snippets",
                commit = "572f5660cf05f8cd8834e096d7b4c921ba18e175",
            },
        },
        init = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
