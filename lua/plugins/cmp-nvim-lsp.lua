return {
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			require('cmp').setup {
				sources = {
					{ name = 'nvim_lsp' },
				}
			}

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			require('lspconfig').gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			})

			require('lspconfig').clangd.setup {
				capabilities = capabilities,
				config = {
					cmd = { "clangd", "--background-index" },
					filetypes = { "c", "cpp", "objc", "objcpp" },
					root_dir = function(fname)
						return root_pattern(fname) or vim.loop.os_homedir()
					end,
				},
			}

			require('lspconfig').bashls.setup {
				cmd = { "bash-language-server", "start" },
				filetypes = { "sh" },
				capabilities = capabilities,
			}

			require('lspconfig').pyright.setup {
				capabilities = capabilities,
				config = {
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
							},
						},
					},
				},
			}

			require('lspconfig').lua_ls.setup {
				-- Command and arguments to start the server.
				cmd = { "lua-language-server", "--stdio" },
				-- Filetypes to automatically attach to.
				filetypes = { 'lua' },

				-- Sets the "root directory" to the parent directory of the file in the
				-- current buffer that contains either a ".luarc.json" or a
				-- ".luarc.jsonc" file. Files that share a root directory will reuse
				-- the connection to the same LSP server.
				root_markers = { '.luarc.json', '.luarc.jsonc' },

				-- Specific settings to send to the server. The schema for this is
				-- defined by the server. For example the schema for lua-language-server
				-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using
							version = 'LuaJIT',
							-- Setup your Neovim runtime path
							path = vim.split(package.path, ';'),
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { 'vim' },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			}

			require('lspconfig').ts_ls.setup {
				capabilities = capabilities,
			}

			require('lspconfig').html.setup {
				capabilities = capabilities,
				config = {
					cmd = { "vscode-html-language-server", "--stdio" },
					filetypes = { "htmldjango", "html", "html5", "django-html" },
					root_dir = function(fname)
						return root_pattern(fname) or vim.loop.os_homedir()
					end,
				},
				settings = {
					html = {
						validate = true
					}
				},
				html = {
					sources = {
						html5 = true,
					},
					stylesheets = {
						validate = true
					},
					templates = {
						django = true,
					},
				},
			}

			require 'lspconfig'.tailwindcss.setup {
				cmd = { "tailwindcss-language-server", "--stdio" },
				filetypes = { "htmldjango", "html", "html5", "django-html" },
				settings = {}
			}

			require('lspconfig').cssls.setup {
				capabilities = capabilities,
				config = {
					cmd = { "vscode-css-language-server", "--stdio" },
					filetypes = { "css", "scss", "less" },
					root_dir = function(fname)
						return root_pattern(fname) or vim.loop.os_homedir()
					end,
					settings = {
						css = {
							validate = true
						},
						less = {
							validate = true
						},
						scss = {
							validate = true
						}
					}
				}
			}
		end,
	},
}
