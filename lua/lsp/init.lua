-- helper function
local function getconf(name)
	return require(string.format('lsp.%s', name))
end

local lspconfig = require 'lspconfig'

local capabilities = getconf 'capabilities'
local lsp_flags = getconf 'flags'
local on_attach = getconf 'on_attach'
local handlers = getconf 'handlers'

vim.o.updatetime = 250

local signs = {
	Error = ' ',
	Warn = ' ',
	Hint = ' ',
	Info = ' ',
}

for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(
		hl,
		{ text = icon, texthl = hl, numhl = hl }
	)
end

vim.diagnostic.config {
	virtual_text = {
		prefix = '●',
	},
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	virtual_lines = {
		only_current_line = false,
	},
}

lspconfig['pyright'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
}
lspconfig['tsserver'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
}
lspconfig['dockerls'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
}
lspconfig['perlls'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
}
lspconfig['prismals'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
}
lspconfig.yamlls.setup {
	settings = {
		yaml = {
			schemas = {
				-- ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
				-- ["../path/relative/to/file.yml"] = "/.github/workflows/*"
				-- ["/path/from/root/of/project"] = "/.github/workflows/*"
			},
		},
	},
	capabilities = capabilities,
}

getconf 'lua'
getconf 'rust'

lspconfig.clangd.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
}
lspconfig.html.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
}
lspconfig.cssls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
}
lspconfig.jdtls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
}
