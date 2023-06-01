local cmp = require 'cmp'
local compare = require 'cmp.config.compare'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

-- local kind_icons = {
-- 	Text = '',
-- 	Method = '',
-- 	Function = '',
-- 	Constructor = '',
-- 	Field = '',
-- 	Variable = '',
-- 	Class = 'ﴯ',
-- 	Interface = '',
-- 	Module = '',
-- 	Property = 'ﰠ',
-- 	Unit = '',
-- 	Value = '',
-- 	Enum = '',
-- 	Keyword = '',
-- 	Snippet = '',
-- 	Color = '',
-- 	File = '',
-- 	Reference = '',
-- 	Folder = '',
-- 	EnumMember = '',
-- 	Constant = '',
-- 	Struct = '',
-- 	Event = '',
-- 	Operator = '',
-- 	TypeParameter = '',
-- }

local source_mapping = {
	buffer = '[Buf]',
	nvim_lsp = '[LSP]',
	nvim_lua = '[Lua]',
	cmp_tabnine = '[TN]',
	path = '[Path]',
}

local tabnine = require 'cmp_tabnine.config'

tabnine:setup {
	max_lines = 100,
	max_num_results = 10,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = '...',
	show_prediction_strength = true,
}

cmp.setup {
	formatting = {
		format = lspkind.cmp_format {
			mode = 'symbol_text', -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
			maxwidth = 40, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				-- vim_item.kind = lspkind.presets.default[vim_item.kind]

				local menu =
					source_mapping[entry.source.name]
				if entry.source.name == 'cmp_tabnine' then
					if
						entry.completion_item.data
							~= nil
						and entry.completion_item.data.detail
							~= nil
					then
						menu = entry.completion_item.data.detail
							.. ' '
							.. menu
					end
					vim_item.kind = ' tabnine'
				end

				vim_item.menu = menu
				return vim_item
			end,
		},
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	-- window = {},
	view = {
		entries = {
			name = 'custom',
			selection_order = 'near_cursor',
		}, -- separator = '  /',
	},
	cmp.setup {
		sorting = {
			priority_weight = 2,
			comparators = {
				compare.offset,
				compare.exact,
				compare.score,
				compare.recently_used,
				compare.kind,
				compare.sort_text,
				compare.length,
				compare.order,
				require 'cmp_tabnine.compare',
			},
		},
	},
	mapping = cmp.mapping.preset.insert {
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm {
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = cmp.config.sources {
		{ name = 'nvim_lsp' },
		{ name = 'luasnips' },
		{ name = 'treesitter' },
		{ name = 'cmp_tabnine' },
		-- { name = 'buffer' },
		{ name = 'path' },
		-- { name = 'fish' },
	},
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
	},
	view = {
		entries = {
			name = 'wildmenu',
			separator = '  /',
		},
	},
})

--Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		-- { name = 'cmdline_history' },
		{ name = 'cmdline' },
	}),
	view = {
		entries = {
			name = 'custom',
			selection_order = 'near_cursor',
		},
	},
})
