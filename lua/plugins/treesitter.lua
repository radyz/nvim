return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install({
                "rust",
                "typescript",
                "javascript",
                "tsx",
                "html",
                "css",
                "json",
                "toml",
                "yaml",
                "bash",
                "c_sharp",
                "python",
                "terraform",
                "markdown",
                "markdown_inline",
                "sql",
            })

            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
}
