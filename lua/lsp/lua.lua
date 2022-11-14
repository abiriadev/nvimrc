local lspconfig = require 'lspconfig'
local on_attach = require 'lsp.on_attach'
local capabilities = require 'lsp.capabilities'
local handlers = require 'lsp.handlers'

lspconfig['sumneko_lua'].setup {
	-- cmd
	-- filetypes
	-- log_level
	-- root_dir
	-- single file support
	handlers = handlers,
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					'vim',
				},
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
}
