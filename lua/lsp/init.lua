-- helper function
local function getconf(name)
	return require(string.format('lsp.%s', name))
end

local lspconfig = require 'lspconfig'

local capabilities = getconf 'capabilities'
local lsp_flags = getconf 'flags'
local on_attach = getconf 'on_attach'

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

local orig_util_open_floating_preview =
	vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(
	contents,
	syntax,
	opts
)
	opts = opts or {}
	opts.border = opts.border or 'single'
	return orig_util_open_floating_preview(
		contents,
		syntax,
		opts
	)
end

lspconfig['pyright'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
}
lspconfig['gopls'].setup {
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
	-- cmd = {
	-- 	'clangd',
	-- },
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
lspconfig.awk_ls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
}
lspconfig.flux_lsp.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
}
lspconfig.volar.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
	-- 	init_options = {
	-- 		typescript = {
	-- 			tsdk = ''
	-- /home/abiria/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript-language-server/lib/cli.js
	-- 		}
	-- 	}
	-- filetypes = {
	-- 	-- 'typescript',
	-- 	-- 'javascript',
	-- 	-- 'javascriptreact',
	-- 	-- 'typescriptreact',
	-- 	'vue',
	-- 	-- 'json',
	-- },
}
lspconfig.jsonls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
	filetypes = { 'json', 'jsonc' },
	settings = {
		json = {
			-- Schemas https://www.schemastore.org
			schemas = {
				{
					fileMatch = { 'package.json' },
					url = 'https://json.schemastore.org/package.json',
				},
				{
					fileMatch = { 'tsconfig*.json' },
					url = 'https://json.schemastore.org/tsconfig.json',
				},
				{
					fileMatch = {
						'.prettierrc',
						'.prettierrc.json',
						'prettier.config.json',
					},
					url = 'https://json.schemastore.org/prettierrc.json',
				},
				{
					fileMatch = {
						'.eslintrc',
						'.eslintrc.json',
					},
					url = 'https://json.schemastore.org/eslintrc.json',
				},
				{
					fileMatch = {
						'.babelrc',
						'.babelrc.json',
						'babel.config.json',
					},
					url = 'https://json.schemastore.org/babelrc.json',
				},
				{
					fileMatch = { 'lerna.json' },
					url = 'https://json.schemastore.org/lerna.json',
				},
				{
					fileMatch = {
						'now.json',
						'vercel.json',
					},
					url = 'https://json.schemastore.org/now.json',
				},
				{
					fileMatch = {
						'.stylelintrc',
						'.stylelintrc.json',
						'stylelint.config.json',
					},
					url = 'http://json.schemastore.org/stylelintrc.json',
				},
			},
		},
	},
}
