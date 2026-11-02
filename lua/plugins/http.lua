return {
    {
        "oysandvik94/curl.nvim",
        cmd = { "CurlOpen" },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = {
            mappings = {
                execute_curl = "<CR>",
            },
        },
    },
}
