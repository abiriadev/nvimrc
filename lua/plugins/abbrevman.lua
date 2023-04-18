local abbrev_man = require 'abbrev-man'

abbrev_man.setup {
	load_natural_dictionaries_at_startup = true,
	load_programming_dictionaries_at_startup = true,
	natural_dictionaries = {
		['nt_en'] = {
			['adn'] = 'and',
			['inhect'] = 'inject',
			-- ['nwe'] = 'new',
		},
	},
	programming_dictionaries = {
		['pr_py'] = {},
	},
}
