return {
    {
        "iamcco/markdown-preview.nvim",
        commit = "a923f5fc5ba36a3b17e289dc35dc17f66d0548ee",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        init = function()
            vim.g.mkdp_auto_close = 1
            vim.g.mkdp_refresh_slow = 1
        end,
        ft = "markdown",
    },
}
