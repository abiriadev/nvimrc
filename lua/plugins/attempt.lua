require('attempt').setup {
	dir = vim.fn.expand '$HOME' .. '/tmp/attempt',
	ext_options = { 'lua', 'js', 'py', 'cpp', 'c', '' },
	run = {
		py = { 'w !python' }, -- Either table of strings or lua functions
		js = { 'w !node' },
		lua = { 'w', 'luafile %' },
		sh = { 'w !bash' },
		pl = { 'w !perl' },
		-- cpp = {
		-- 	'w',
		-- 	'!'
		-- 		.. cpp_compiler
		-- 		.. ' %:p -o %:p:r.out && echo "" && %:p:r.out && rm %:p:r.out ',
		-- },
		-- c = {
		-- 	'w',
		-- 	'!'
		-- 		.. c_compiler
		-- 		.. ' %:p -o %:p:r.out && echo "" && %:p:r.out && rm %:p:r.out',
		-- },
	},
}
