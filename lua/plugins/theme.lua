local constants = require("constants")

return {
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("github-theme").setup({
                groups = {
                    all = {
                        DiagnosticFloatingHint = { fg = "#79c0ff" },

                        -- ts_ls tags identifiers whose TYPE is a class (e.g.
                        -- Effect Schema values and object keys holding them)
                        -- as @lsp.type.class, which the theme links to
                        -- @function (purple) and overrides treesitter's blue
                        -- @variable.member. Clear it so treesitter wins, like
                        -- the theme already does for @lsp.type.property.
                        ["@lsp.type.class"] = {},
                    },
                },
            })

            vim.cmd("colorscheme github_light_default")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                theme = "github",
            },
            sections = {
                lualine_c = {
                    "filename",
                    "aerial",
                },
                lualine_x = { "encoding", "fileformat" },
            },
            extensions = { "nvim-tree", "quickfix", "fugitive" },
        },
    },
    {
        "https://github.com/RRethy/vim-illuminate.git",
        config = function()
            require("illuminate").configure({
                filetypes_denylist = constants.ignored_buffer_types,
            })
        end,
    },
    {
        "https://github.com/whatyouhide/vim-lengthmatters.git",
        config = function()
            vim.g.lengthmatters_start_at_column = 88
            vim.g.lengthmatters_excluded = { "dbout" }
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        opts = { "css", "sass", "scss" },
    },
}
