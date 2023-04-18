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

		-- unity WebGL
		jslib = 'javascript',

		-- unity assembly definition file
		asmdef = 'json',

		-- MIR and HIR files generated by rustc
		mir = 'rust',
		hir = 'rust',

		-- justfile
		justfile = 'just',
		just = 'just',
	},
	filename = {
		['.swcrc'] = 'json',

		-- justfile
		Justfile = 'just',
		justfile = 'just',
		['.Justfile'] = 'just',
		['.justfile'] = 'just',

		['a.log'] = 'logtalk',
	},
}
