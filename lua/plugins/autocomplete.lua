return {
    { "hrsh7th/cmp-buffer", commit = "b74fab3656eea9de20a9b8116afa3cfc4ec09657" },
    { "hrsh7th/cmp-path", commit = "c642487086dbd9a93160e1679a1327be111cbc25" },
    { "hrsh7th/cmp-nvim-lsp", commit = "cbc7b02bb99fae35cb42f514762b89b5126651ef" },
    { "ray-x/cmp-treesitter", commit = "958fcfa0d8ce46d215e19cc3992c542f576c4123" },
    { "saadparwaiz1/cmp_luasnip", commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" },
    { "https://github.com/onsails/lspkind-nvim.git", commit = "3ddd1b4edefa425fda5a9f95a4f25578727c0bb3" },
    {
        "hrsh7th/nvim-cmp",
        commit = "d97d85e01339f01b842e6ec1502f639b080cb0fc",
        opts = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            local source_mapping = {
                nvim_lsp = "力",
                buffer = "",
                path = "",
                luasnip = "",
                treesitter = "",
            }

            return {
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "text",
                        symbol_map = {
                            Text = "",
                            Method = "",
                            Function = "",
                            Constructor = "",
                            Field = "ﰠ",
                            Variable = "",
                            Class = "ﴯ",
                            Interface = "",
                            Module = "",
                            Property = "ﰠ",
                            Unit = "塞",
                            Value = "",
                            Enum = "",
                            Keyword = "",
                            Snippet = "",
                            Color = "",
                            File = "",
                            Reference = "",
                            Folder = "",
                            EnumMember = "",
                            Constant = "",
                            Struct = "פּ",
                            Event = "",
                            Operator = "",
                            TypeParameter = "",
                        },
                        before = function(entry, vim_item)
                            vim_item.menu = source_mapping[entry.source.name]

                            return vim_item
                        end,
                    }),
                },
                snippet = {
                    expand = function(args)
                        -- For `luasnip` user.
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "treesitter" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
            }
        end,
        init = function()
            require("cmp").setup.filetype({ "sql" }, {
                sources = {
                    { name = "vim-dadbod-completion" },
                    { name = "buffer" },
                },
            })
        end,
    },
}
