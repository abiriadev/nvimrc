local telescope = require 'telescope'
-- local actions = require 'telescope.actions'

telescope.setup {
	defaults = {
		mappings = {
			i = {
				['<esc>'] = 'close',
				['j'] = 'move_selection_next',
				['k'] = 'move_selection_previous',
				['<Space>'] = 'toggle_selection',
				-- ['<C-@>'] = 'toggle_selection',
			},
		},
		layout_config = {
			vertical = {
				width = 0.0,
			},
		},
	},
	pickers = {
		find_files = {
			theme = 'dropdown',
		},
		builtin = {
			theme = 'ivy',
		},
		live_grep = {
			theme = 'dropdown',
		},
		buffers = {
			theme = 'dropdown',
		},
		command_history = {
			theme = 'ivy',
		},
		search_history = {
			theme = 'ivy',
		},
		marks = {
			theme = 'dropdown',
		},
		highlights = {
			theme = 'dropdown',
		},
		keymaps = {
			theme = 'dropdown',
		},
		lsp_references = {
			theme = 'dropdown',
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		harpoon = {
			theme = 'dropdown',
		},
		neoclip = {
			theme = 'cursor',
		},
	},
}

telescope.load_extension 'fzf'
telescope.load_extension 'zoxide'
telescope.load_extension 'command_palette'
telescope.load_extension 'harpoon'
telescope.load_extension 'attempt'
telescope.load_extension 'neoclip'
-- .load_extension('projects')
