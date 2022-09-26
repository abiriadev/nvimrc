local basics = require 'lsp_basics'
local capabilities =
	require('cmp_nvim_lsp').update_capabilities(
		vim.lsp.protocol.make_client_capabilities()
	)
capabilities.textDocument.completion.completionItem.snippetSupport =
	true

local lspconfig = require 'lspconfig'
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- require('virtualtypes').on_attach(client, bufnr)

	-- require('illuminate').on_attach(client, bufnr)
	basics.make_lsp_commands(client, bufnr)
	-- basics.make_lsp_mappings(client, bufnr)

	local bufopts =
		{ noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set(
	-- 	'n',
	-- 	'<leader>wr',
	-- 	vim.lsp.buf.remove_workspace_folder,
	-- 	bufopts
	-- )
	-- vim.keymap.set('n', '<leader>wl', function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
	-- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
	-- vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
	-- vim.keymap.set('n', '<F2>', function()
	-- 	return ':IncRename ' .. vim.fn.expand '<cword>'
	-- end, {
	-- 	expr = true,
	-- 	noremap = true,
	-- 	silent = true,
	-- })
	function map(mode, lhs, rhs, opts)
		local options = { noremap = true, silent = true }
		if opts then
			options = vim.tbl_extend('force', options, opts)
		end
		vim.api.nvim_set_keymap(mode, lhs, rhs, options)
	end

	map(
		'n',
		'<f2>',
		'<cmd>lua require("cosmic-ui").rename()<cr>'
	)
	map(
		'n',
		'<A-CR>',
		'<cmd>lua require("cosmic-ui").code_actions()<cr>'
	)
	map(
		'v',
		'<A-CR>',
		'<cmd>lua require("cosmic-ui").range_code_actions()<cr>'
	)

	-- -- vim.keymap.set('n', '<F2>', '<cmd>lua require("cosmic-ui").rename()<cr>', { noremap = true, silent = true })
	--
	-- vim.keymap.set('n', '<A-CR>', vim.lsp.buf.code_action, bufopts)

	-- vim.keymap.set('n', '<A-CR>', ':CodeActionMenu<CR>', bufopts)

	-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	-- vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)

	-- vim.keymap.set('n', '<leader>e', function()
	-- local opts = {
	-- 	focusable = false,
	-- 	close_events = {
	-- 		'BufLeave',
	-- 		'CursorMoved',
	-- 		'InsertEnter',
	-- 		'FocusLost',
	-- 	},
	-- 	border = 'rounded',
	-- 	source = 'always',
	-- 	prefix = ' ',
	-- 	scope = 'cursor',
	-- }
	-- vim.diagnostic.open_float(nil, opts)
	-- end)
	-- vim.api.nvim_create_autocmd('CursorHold', {
	-- 	buffer = bufnr,
	-- 	callback = function()
	-- 		local opts = {
	-- 			focusable = false,
	-- 			close_events = {
	-- 				'BufLeave',
	-- 				'CursorMoved',
	-- 				'InsertEnter',
	-- 				'FocusLost',
	-- 			},
	-- 			border = 'rounded',
	-- 			source = 'always',
	-- 			prefix = ' ',
	-- 			scope = 'cursor',
	-- 		}
	-- 		vim.diagnostic.open_float(nil, opts)
	-- 	end,
	-- })

	vim.api.nvim_create_autocmd('CursorHold', {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = {
					'BufLeave',
					'CursorMoved',
					'InsertEnter',
					'FocusLost',
				},
				border = 'rounded',
				source = 'always',
				prefix = ' ',
				scope = 'cursor',
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})
end
vim.o.updatetime = 250
local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
	capabilities = capabilities,
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
lspconfig['rust_analyzer'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		['rust-analyzer'] = {},
	},
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

-- local function dd(x)
-- 	return x
-- en
-- local file = 4%
-- local lfile2 = lfile

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
local handlers = {
	-- ['textDocument/hover'] = vim.lsp.with(
	-- 	vim.lsp.handlers.hover,
	-- 	{ border = border }
	-- ),
	['textDocument/signatureHelp'] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = border }
	),
}

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
-- lspconfig.json_lsp.setup {
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- }

-- local luasnip = require 'luasnip'
-- local cmp = require 'cmp'
-- local lspkind = require 'lspkind'

-- local source_mapping = {
-- 	buffer = '[Buffer]',
-- 	nvim_lsp = '[LSP]',
-- 	nvim_lua = '[Lua]',
-- 	cmp_tabnine = '[TN]',
-- 	path = '[Path]',
-- }
-- local compare = require 'cmp.config.compare'

-- cmp.setup {
-- formatting = {
-- 	format = lspkind.cmp_format {
-- 		mode = 'symbol_text', -- show only symbol annotations
-- 		maxwidth = 80, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
-- 		before = function(entry, vim_item)
-- 			vim_item.kind = lspkind.presets.default[vim_item.kind]
--
-- 			local menu = source_mapping[entry.source.name]
-- 			if entry.source.name == 'cmp_tabnine' then
-- 				if
-- 					entry.completion_item.data ~= nil
-- 					and entry.completion_item.data.detail ~= nil
-- 				then
-- 					menu = entry.completion_item.data.detail .. ' ' .. menu
-- 				end
-- 				vim_item.kind = ''
-- 			end
--
-- 			vim_item.menu = menu
--
-- 			return vim_item
-- 		end,
-- 	},
-- },
-- snippet = {
-- 	expand = function(args)
-- 		luasnip.lsp_expand(args.body)
-- 	end,
-- },
-- mapping = cmp.mapping.preset.insert {
-- 	['<C-d>'] = cmp.mapping.scroll_docs(-4),
-- 	['<C-f>'] = cmp.mapping.scroll_docs(4),
-- 	['<C-Space>'] = cmp.mapping.complete(),
-- 	['<CR>'] = cmp.mapping.confirm {
-- 		behavior = cmp.ConfirmBehavior.Replace,
-- 		select = true,
-- 	},
-- 	['<Tab>'] = cmp.mapping(function(fallback)
-- 		if cmp.visible() then
-- 			cmp.select_next_item()
-- 		elseif luasnip.expand_or_jumpable() then
-- 			luasnip.expand_or_jump()
-- 		else
-- 			fallback()
-- 		end
-- 	end, { 'i', 's' }),
-- 	['<S-Tab>'] = cmp.mapping(function(fallback)
-- 		if cmp.visible() then
-- 			cmp.select_prev_item()
-- 		elseif luasnip.jumpable(-1) then
-- 			luasnip.jump(-1)
-- 		else
-- 			fallback()
-- 		end
-- 	end, { 'i', 's' }),
-- },
-- sorting = {
-- 	priority_weight = 2,
-- 	comparators = {
-- 		-- require 'cmp_fuzzy_path.compare',
-- 		require 'cmp_tabnine.compare',
-- 		compare.offset,
-- 		compare.exact,
-- 		compare.score,
-- 		compare.recently_used,
-- 		compare.kind,
-- 		compare.sort_text,
-- 		compare.length,
-- 		compare.order,
-- 	},
-- },
-- 	sources = {
-- 		{ name = 'nvim_lsp' },
-- 		-- { name = 'luasnip' },
-- 		-- { name = 'cmp_tabnine' },
-- 		-- { name = 'path' },
-- 		-- { name = 'fuzzy_path' },
-- 		-- { name = 'ultisnips' },
-- 		-- { name = 'buffer' },
-- 		-- { name = 'nvim_lua' },
-- 		-- { name = 'spell' },
-- 		-- { name = 'crates' },
-- 	},
-- }
-- If you want insert `(` after select function or method item
-- local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
-- local cmp = require 'cmp'
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
-- cmp.setup.cmdline(':', {
-- 	sources = cmp.config.sources {
-- 		{
-- 			name = 'fuzzy_path',
-- 			options = { fd_timeout_msec = 1500 },
-- 		},
-- 	},
-- })
-- vim.lsp.handlers['textDocument/publishDiagnostics'] =
-- 	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- 		underline = true,
-- 		virtual_text = {
-- 			spacing = 5,
-- 			severity_limit = 'Warning',
-- 		},
-- 		update_in_insert = true,
-- local cmp = require 'cmp'
--
-- local luasnip = require 'luasnip'
--
-- cmp.setup {
-- 	snippet = {
-- 		expand = function(args)
-- 			luasnip.lsp_expand(args.body)
-- 		end,
-- 	},
-- 	mapping = cmp.mapping.preset.insert {
-- 		['<C-d>'] = cmp.mapping.scroll_docs(-4),
-- 		['<C-f>'] = cmp.mapping.scroll_docs(4),
-- 		['<C-Space>'] = cmp.mapping.complete(),
-- 		['<CR>'] = cmp.mapping.confirm {
-- 			behavior = cmp.ConfirmBehavior.Replace,
-- 			select = true,
-- 		},
-- 		['<Tab>'] = cmp.mapping(function(fallback)
-- 			if cmp.visible() then
-- 				cmp.select_next_item()
-- 			elseif luasnip.expand_or_jumpable() then
-- 				luasnip.expand_or_jump()
-- 			else
-- 				fallback()
-- 			end
-- 		end, { 'i', 's' }),
-- 		['<S-Tab>'] = cmp.mapping(function(fallback)
-- 			if cmp.visible() then
-- 				cmp.select_prev_item()
-- 			elseif luasnip.jumpable(-1) then
-- 				luasnip.jump(-1)
-- 			else
-- 				fallback()
-- 			end
-- 		end, { 'i', 's' }),
-- 	},
-- }
-- 	})
