vim.filetype.add {
	extension = {
		-- flux query language
		flux = 'flux',

		-- allow comments
		json = 'jsonc',

		avsc = 'json',
		har = 'json',
	},
	filename = {
		['.swcrc'] = 'json',
	},
}
