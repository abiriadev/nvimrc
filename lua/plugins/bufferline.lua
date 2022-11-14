local icon_tbl = {
	error = ' ',
	warning = ' ',
	info = ' ',
	hint = ' ',
}

require('bufferline').setup {
	options = {
		diagnostics = 'nvim_lsp',
		diagnostics_update_in_insert = true,
		diagnostics_indicator = function(
			count,
			level,
			diagnostics_dict,
			_
		)
			local s = ''

			for e, n in pairs(diagnostics_dict) do
				local sym = icon_tbl[e]

				if n ~= 0 then
					s = s
						.. (s == '' and s or ' ')
						.. sym
						.. n
				end
			end

			-- Error = ' ',
			-- Warn = ' ',
			-- Hint = ' ',
			-- Info = ' ',

			return s
		end,
		indicator = {
			style = 'underline',
		},
		numbers = 'buffer_id',
		right_mouse_command = nil,
		middle_mouse_command = 'bdelete! %d',
		separator_style = 'thick',
		always_show_bufferline = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { 'close' },
		},
		offsets = {
			{
				filetype = 'NvimTree',
				text = 'Nvim Tree',
				text_align = 'center',
				-- separator = rue,
			},
		},
	},
}
