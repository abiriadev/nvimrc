local wk = require 'which-key'

wk.setup {
	triggers_blacklist = {
		i = {
			'j',
			'k',
		},
		n = {
			'z',
		},
		v = {
			'j',
			'k',
		},
	}, -- refer to the configuration section below
}

wk.register({
	f = {
		name = 'Telescope', -- optional group name
		f = {
			'Find File',
		}, -- create a binding with label
		['<CR>'] = {
			'Resume',
		},
		['/'] = {
			'Builtin',
		},
		g = {
			'Live grep',
		},
		['#'] = {
			'Grep string',
		},
		b = {
			'Buffers',
		},
		l = {
			'Buffer fuzzy',
		},
		h = {
			'Harpoon',
		},
		H = {
			'Help tags',
		},
		['<C-h>'] = {
			'Old files',
		},
		[':'] = {
			'Commands',
		},
		m = {
			'Marks',
		},
		M = {
			'Man pages',
		},
		t = {
			'Color schemes',
		},
		j = {
			'Jumplists',
		},
		o = {
			'Options',
		},
		r = {
			'Registers',
		},
		A = {
			'Autocommands',
		},
		k = {
			'Keymaps',
		},
		L = {
			'Highlights',
		},
		q = {
			name = 'History',
			[':'] = {
				'Command history',
			},
			['/'] = {
				'Search history',
			},
		},
	},
	['<leader>'] = {
		'Harpoon switcher',
	},
	m = {
		'Register to harpoon',
	},
	t = {
		'Open new tab',
	},
	x = {
		'Open Trouble',
	},
	s = {
		'Wrap with ()',
	},
	a = {
		'Swap next',
	},
	A = {
		'Swap previous',
	},
	e = {
		'Focus NvimTree'
	},
	E = {
		'Toggle NvimTree'
	}
}, {
	prefix = '<leader>',
})
