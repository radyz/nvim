local constants = require("constants")

return {
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd("colorscheme github_light_high_contrast")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
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
        "https://github.com/levouh/tint.nvim.git",
        opts = {
            window_ignore_function = function(winid)
                local bufid = vim.api.nvim_win_get_buf(winid)
                local filetype = vim.api.nvim_buf_get_option(bufid, "filetype")
                local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

                -- Do not tint under these conditions
                return filetype == "NvimTree" or floating
            end,
        },
    },
    {
        "norcalli/nvim-colorizer.lua",
        opts = { "css", "sass", "scss" },
    },
}
