local border = {
	{ '🭽', 'FloatBorder' },
	{ '▔', 'FloatBorder' },
	{ '🭾', 'FloatBorder' },
	{ '▕', 'FloatBorder' },
	{ '🭿', 'FloatBorder' },
	{ '▁', 'FloatBorder' },
	{ '🭼', 'FloatBorder' },
	{ '▏', 'FloatBorder' },
}

-- LSP settings (for overriding per client)
return {
	-- ['textDocument/hover'] = vim.lsp.with(
	-- 	vim.lsp.handlers.hover,
	-- 	{ border = border }
	-- ),
	['textDocument/signatureHelp'] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = border }
	),
}
