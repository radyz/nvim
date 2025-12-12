return {
    {
        "nvim-treesitter/nvim-treesitter",
        tag = "v0.10.0",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = "all",
                ignore_install = { "phpdoc" },
                highlight = {
                    enable = true,
                    -- Disable slow treesitter highlight for large files
                    disable = function(_, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                },
            })
        end,
        init = function()
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
