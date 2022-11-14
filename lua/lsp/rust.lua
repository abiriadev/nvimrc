local rt = require 'rust-tools'
local on_attach = require 'lsp.on_attach'

rt.setup {
	server = {
		on_attach = function(client, bufnr)
			rt.inlay_hints.enable()

			on_attach(client, bufnr)
		end,
	},
}
