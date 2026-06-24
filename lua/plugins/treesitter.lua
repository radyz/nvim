return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        init = function()
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

            local ts = require("vim.treesitter")
            ts.query.add_directive("set_if_eq!", function(match, pattern, bufnr, predicate, metadata)
                local _, key, capture_id, rhs = unpack(predicate)

                local node = match[capture_id]
                if node and ts.get_node_text(node, bufnr) == rhs then
                    metadata[key] = true
                end
            end)
        end,
    },
}
