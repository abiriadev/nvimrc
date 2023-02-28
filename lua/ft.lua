vim.filetype.add {
	extension = {
		-- flux query language
		flux = 'flux',

		-- allow comments
		json = 'jsonc',

		avsc = 'json',
		har = 'json',

		-- unity asset metadata file
		meta = 'yaml',
	},
	filename = {
		['.swcrc'] = 'json',
	},
}
