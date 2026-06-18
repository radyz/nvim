local constants = require("constants")

return {
    {
        "morhetz/gruvbox",
        config = function()
            vim.o.background = "light"
            vim.cmd.colorscheme("gruvbox")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                theme = "gruvbox",
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
