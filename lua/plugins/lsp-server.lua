return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"kkharji/lspsaga.nvim",
				opts = {
					error_sign = "",
					warn_sign = "",
					hint_sign = "",
					infor_sign = " ",
					diagnostic_header_icon = "   ",
					code_action_icon = " ",
				},
			},
		},
		init = function()
			-- Disable text object diagnostic next to each line to avoid overbloating UI
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false,
				})

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", ":Lspsaga preview_definition<CR>", opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", ":Lspsaga lsp_finder<CR>", opts)
					vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts)
					vim.keymap.set("n", "<C-k>", ":Lspsaga signature_help<CR>", opts)
					vim.keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
					vim.keymap.set("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", opts)
					vim.keymap.set("n", "<leader>cr", ":Lspsaga rename<CR>", opts)
					vim.keymap.set("n", "<leader>cd", ":Lspsaga show_line_diagnostics<CR>", opts)
				end,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-nvim-lsp",
			"tzachar/cmp-tabnine",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			{
				"tzachar/cmp-tabnine",
				build = "./install.sh",
				opts = {
					max_lines = 1000,
					max_num_results = 20,
					sort = true,
				},
			},
			"https://github.com/onsails/lspkind-nvim.git",
			"neovim/nvim-lspconfig",
		},
		opts = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			return {
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
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
							local source_mapping = {
								nvim_lsp = "[LSP]",
								buffer = "[Buffer]",
								path = "[Path]",
								luasnip = "[Snippets]",
								cmp_tabnine = "[TN]",
								treesitter = "[TS]",
							}

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
					{ name = "buffer" },
					{ name = "path" },
					{ name = "calc" },
					{ name = "luasnip" },
					{ name = "cmp_tabnine" },
					{ name = "treesitter" },
				},
			}
		end,
		init = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lsp_servers = {
				[1] = "tsserver",
				[2] = "pyright",
				[3] = "ruff_lsp",
				[4] = "terraformls",
				[5] = "lua_ls",
			}

			for _, server in ipairs(lsp_servers) do
				require("lspconfig")[server].setup({
					capabilities = capabilities,
				})
			end
		end,
	},
}
