require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'c',
		'lua',
		'rust',
		'javascript',
		'typescript',
	},

	-- Automatically install missing parsers when entering buffer
	auto_install = true,
	autotag = {
		enable = true,
	},
	endwise = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	},
	highlight = {
		enable = true,
		-- require"nvim-treesitter.highlight".set_custom_captures {
		--   -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
		--   ["foo.bar"] = "Identifier",
		-- }
	},
	indent = {
		enable = true,
		disable = {
			'yaml',
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '=',
			node_incremental = '=',
			scope_incremental = '=',
			node_decremental = '-',
		},
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				-- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
				['ic'] = {
					query = '@class.inner',
					desc = 'Select inner part of a class region',
				},
				['ab'] = '@block.inner',
				['ib'] = '@block.outer',
			},
			-- You can choose the select mode (default is charwise 'v')
			selection_modes = {
				['@parameter.outer'] = 'v', -- charwise
				['@function.outer'] = 'V', -- linewise
				['@class.outer'] = '<c-v>', -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding xor succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			include_surrounding_whitespace = true,
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
	},
	playground = {
		enable = true,
	},
	-- custom_capture = {
	-- 	['return'] = 'Search',
	-- },
}

-- require('nvim-treesitter.highlight').set_custom_captures {
-- 	-- Highlight the @foo.bar capture group with the "Identifier" highlight group.
-- 	['return_statement'] = 'Search',
-- }
require('nvim-treesitter.parsers').get_parser_configs().ebnf =
	{
		install_info = {
			url = 'https://github.com/RubixDev/ebnf.git',
			files = { 'src/parser.c' },
			location = 'crates/tree-sitter-ebnf',
			branch = 'main',
		},
	}
