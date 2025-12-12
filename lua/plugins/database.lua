return {
    { "tpope/vim-dadbod", commit = "e95afed23712f969f83b4857a24cf9d59114c2e6" },
    {
        "kristijanhusak/vim-dadbod-completion",
        commit = "a8dac0b3cf6132c80dc9b18bef36d4cf7a9e1fe6",
        ft = { "sql", "plsql" },
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        commit = "48c4f271da13d380592f4907e2d1d5558044e4e5",
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
}
