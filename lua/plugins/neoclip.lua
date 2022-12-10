require('neoclip').setup {
	history = 1000,
	enable_persistent_history = false,
	length_limit = 1048576,
	continuous_sync = false,
	-- db_path = vim.fn.stdpath 'data'
	-- 	.. '/databases/neoclip.sqlite3',
	filter = nil,
	preview = true,
	prompt = nil,
	default_register = '"',
	default_register_macros = 'q',
	enable_macro_history = true,
	content_spec_column = true,
	on_paste = {
		set_reg = false,
	},
	on_replay = {
		set_reg = false,
	},
	keys = {
		telescope = {
			i = {
				select = '<space>',
				paste = '<cr>',
				paste_behind = '<S-cr>',
				replay = '<c-q>', -- replay a macro
				delete = '<c-d>', -- delete an entry
				custom = {},
			},
			n = {
				select = '<cr>',
				paste = 'p',
				--- It is possible to map to more than one key.
				-- paste = { 'p', '<c-p>' },
				paste_behind = 'P',
				replay = 'q',
				delete = 'd',
				custom = {},
			},
		},
	},
}
