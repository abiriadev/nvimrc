require('better_escape').setup {
	mapping = {
		'jk',
		'jj',
	}, -- a table with mappings to use
	timeout = 1000, -- vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
}
