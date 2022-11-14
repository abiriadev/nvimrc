local basics = require 'lsp_basics'
local navic = require 'nvim-navic'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
return function(client, bufnr)
	basics.make_lsp_commands(client, bufnr)
	navic.attach(client, bufnr)

	local bufopts =
		{ noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set(
		'n',
		'<F2>',
		'<cmd>Lspsaga rename<CR>',
		{ silent = true }
	)
	vim.keymap.set(
		{ 'n', 'v' },
		'<A-CR>',
		'<cmd>Lspsaga code_action<CR>',
		{ silent = true }
	)
	vim.keymap.set(
		'n',
		'gh',
		'<cmd>Lspsaga lsp_finder<CR>',
		{ silent = true }
	)

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
