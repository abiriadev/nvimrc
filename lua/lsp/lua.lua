local lspconfig = require 'lspconfig'
local on_attach = require 'lsp.on_attach'
local capabilities = require 'lsp.capabilities'
local handlers = require 'lsp.handlers'

lspconfig['lua_ls'].setup {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
		},
	},
	handlers = handlers,
	on_attach = on_attach,
	capabilities = capabilities,
}
