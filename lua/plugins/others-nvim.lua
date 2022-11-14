require('other-nvim').setup {
	mappings = {
		{
			pattern = '(.*).ts$',
			-- target = '%1.*.ts',
			target = '%1.spec.ts',
			-- target = '*.ts',
		},
		{
			pattern = '(.*).spec.ts$',
			target = '%1.ts',
		},
		-- {
		-- 	pattern = '/path/to/file/src/app/(.*)/.*.ext$',
		-- 	target = '/path/to/file/src/view/%1/',
		-- 	transformer = 'lowercase',
		-- },
	},
	-- transformers = {
	-- 	-- defining a custom transformer
	-- 	lowercase = function(inputString)
	-- 		return inputString:lower()
	-- 	end,
	-- },
}
