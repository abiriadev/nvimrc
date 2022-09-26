-- bootstrap packer itself
local fn = vim.fn
local install_path = fn.stdpath 'data'
	.. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system {
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	}
	vim.cmd [[packadd packer.nvim]]
end

-- helper function
local function getconf(name)
	return string.format("require('plugins.%s')", name)
end

return require('packer').startup {
	function(use)
		use 'wbthomason/packer.nvim' -- packer itself
		use 'lewis6991/impatient.nvim'
		use {
			'lambdalisue/suda.vim',
			cmd = {
				'SudaRead',
				'SudaWrite',
			},
		}
		use {
			'folke/which-key.nvim',
			config = getconf 'which-key',
		}
		use 'djoshea/vim-autoread'
		use 'wakatime/vim-wakatime'
		use {
			'folke/todo-comments.nvim',
			requires = 'nvim-lua/plenary.nvim',
			config = getconf 'todo-comments',
		} -- Lua
		use {
			'folke/trouble.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function()
				require('trouble').setup {
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				}
			end,
		}
		-- use 'phaazon/hop.nvim'
		-- use 'ggandor/lightspeed.nvim'
		-- use 'mfussenegger/nvim-treehopper'
		-- use 'rktjmp/highlight-current-n.nvim'
		-- use 'AckslD/nvim-revJ.lua'
		-- use 'filipdutescu/renamer.nvim'
		use 'mbbill/undotree'
		use {
			'CosmicNvim/cosmic-ui',
			requires = {
				'MunifTanjim/nui.nvim',
				'nvim-lua/plenary.nvim',
			},
			config = function()
				require('cosmic-ui').setup()
			end,
		}
		use {
			'kyazdani42/nvim-tree.lua',
			requires = {
				'kyazdani42/nvim-web-devicons', -- optional, for file icons
			},
			tag = 'nightly', -- optional, updated every week. (see issue #1193)
			config = getconf 'nvim-tree',
			cmd = 'NvimTreeToggle',
		}
		use {
			'kdheepak/lazygit.nvim',
			cmd = 'lazyGit',
		}
		-- use {
		-- 	'anuvyklack/hydra.nvim',
		-- 	config = getconf 'hydra',
		-- }
		use 'chentoast/marks.nvim'
		use { 'ellisonleao/glow.nvim' }
		use {
			'nvim-treesitter/nvim-treesitter',
			config = getconf 'treesitter',
			run = function()
				require('nvim-treesitter.install').update {
					with_sync = true,
				}
			end,
		}
		use {
			'windwp/nvim-ts-autotag',
		}
		use {
			'lewis6991/spellsitter.nvim',
			requires = {
				'nvim-treesitter/nvim-treesitter',
			},
			config = function()
				require('spellsitter').setup {
					enable = true,
				}
			end,
		}
		use {
			'nvim-treesitter/playground',
			requires = {
				'nvim-treesitter/nvim-treesitter',
			},
		}
		use {
			'nvim-treesitter/nvim-treesitter-context',
			requires = {
				'nvim-treesitter/nvim-treesitter',
			},
			config = function()
				require('treesitter-context').setup {
					enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
					max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
					trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
					patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
						-- For all filetypes
						-- Note that setting an entry here replaces all other patterns for this entry.
						-- By setting the 'default' entry below, you can control which nodes you want to
						-- appear in the context window.
						default = {
							'class',
							'function',
							'method',
							-- 'for', -- These won't appear in the context
							-- 'while',
							-- 'if',
							-- 'switch',
							-- 'case',
						},
						-- Example for a specific filetype.
						-- If a pattern is missing, *open a PR* so everyone can benefit.
						--   rust = {
						--       'impl_item',
						--   },
					},
					exact_patterns = {
						-- Example for a specific filetype with Lua patterns
						-- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
						-- exactly match "impl_item" only)
						-- rust = true,
					},
				}
			end,
		}
		use {
			'windwp/nvim-autopairs',
			config = getconf 'autopairs',
		}
		use {
			'p00f/nvim-ts-rainbow',
			requires = {
				'nvim-treesitter/nvim-treesitter',
			},
		}
		use {
			'JoosepAlviste/nvim-ts-context-commentstring',
			requires = {
				'nvim-treesitter/nvim-treesitter',
			},
		}
		use {
			'm-demare/hlargs.nvim',
			requires = {
				'nvim-treesitter/nvim-treesitter',
			},
			config = function()
				require('hlargs').setup()
			end,
		}
		use {
			'RRethy/nvim-treesitter-endwise',
			requires = {
				'nvim-treesitter/nvim-treesitter',
			},
		}
		use {
			'nvim-treesitter/nvim-treesitter-textobjects',
			requires = {
				'nvim-treesitter/nvim-treesitter',
			},
		}
		use {
			'ziontee113/syntax-tree-surfer',
			requires = {
				'nvim-treesitter/nvim-treesitter',
			},
			config = getconf 'syntax-tree-surfer',
		}
		use {
			'ethanholz/nvim-lastplace',
			config = function()
				require('nvim-lastplace').setup()
			end,
		}
		use {
			'nvim-telescope/telescope.nvim',
			tag = '0.1.0',
			requires = {
				'nvim-lua/plenary.nvim',
				{
					'nvim-treesitter/nvim-treesitter',
					opt = true,
				},
				{
					'kyazdani42/nvim-web-devicons',
					opt = true,
				},
			},
			-- opt = true,
			cmd = 'Telescope',
			keys = {
				'<leader>f',
			},
			config = getconf 'telescope',
		}
		use {
			'LinArcX/telescope-command-palette.nvim',
			requires = {
				'nvim-telescope/telescope.nvim',
			},
		}
		use {
			'jvgrootveld/telescope-zoxide',
			requires = {
				'nvim-telescope/telescope.nvim',
			},
		}
		use {
			'nvim-telescope/telescope-fzf-native.nvim',
			run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
			requires = {
				'nvim-telescope/telescope.nvim',
			},
		}
		-- use 'Fymyte/rasi.vim'
		-- use 'linty-org/key-menu.nvim'
		-- use 'gennaro-tedesco/nvim-peekup'
		use 'dstein64/vim-startuptime'
		-- use 'johngrib/vim-game-code-break'
		-- use 'milisims/nvim-luaref'
		-- use {
		-- 	'sunjon/shade.nvim',
		-- 	config = function()
		-- 		require('shade').setup {
		-- 			overlay_opacity = 80,
		-- 		}
		-- 	end,
		-- }
		use {
			'someone-stole-my-name/yaml-companion.nvim',
			requires = {
				{ 'neovim/nvim-lspconfig' },
				{ 'nvim-lua/plenary.nvim' },
				{ 'nvim-telescope/telescope.nvim' },
			},
			config = getconf 'yaml-companion',
			opt = true,
			ft = { 'yaml' },
		}
		use {
			'cuducos/yaml.nvim',
			ft = { 'yaml' }, -- optional
			requires = {
				'nvim-treesitter/nvim-treesitter',
				'nvim-telescope/telescope.nvim', -- optional
			},
		}
		-- use {
		-- 	'winston0410/range-highlight.nvim',
		-- 	requires = { 'winston0410/cmd-parser.nvim' },
		-- 	config = function()
		-- 		require('range-highlight').setup {
		-- 			highlight = 'Visual',
		-- 		}
		-- 	end,
		-- }
		-- use {
		-- 	'xiyaowong/nvim-transparent',
		-- 	config = function()
		-- 		require('transparent').setup {
		-- 			enable = false,
		-- 		}
		-- 	end,
		-- }
		-- use 'tversteeg/registers.nvim'
		-- use {
		-- 	'lcheylus/overlength.nvim',
		-- 	config = function()
		-- 		require('overlength').setup()
		-- 	end,
		-- }
		use 'nvim-lua/plenary.nvim'
		use {
			'ThePrimeagen/harpoon',
			requires = { 'nvim-lua/plenary.nvim' },
			-- opt = true,
			-- keys = {
			-- 	'<leader>',
			-- },
			config = getconf 'harpoon',
		}
		use {
			'sindrets/diffview.nvim',
			requires = 'nvim-lua/plenary.nvim',
		}
		-- use {
		-- 	'akinsho/git-conflict.nvim',
		-- 	tag = '*',
		-- 	config = function()
		-- 		require('git-conflict').setup()
		-- 	end,
		-- }
		-- use {
		-- 	'folke/todo-comments.nvim',
		-- 	requires = 'nvim-lua/plenary.nvim',
		-- 	config = function()
		-- 		require('todo-comments').setup {}
		-- 	end,
		-- }
		use {
			'petertriho/nvim-scrollbar',
			config = function()
				require('scrollbar').setup {}
			end,
		}
		-- use {
		-- 	'mfussenegger/nvim-dap',
		-- 	config = getconf 'dap',
		-- }
		use 'neovim/nvim-lspconfig'
		use 'kyazdani42/nvim-web-devicons'
		-- use 'elkowar/yuck.vim'
		use {
			'sainnhe/gruvbox-material',
			tag = 'v1.2.4',
		}
		use {
			'karb94/neoscroll.nvim',
			config = function()
				require('neoscroll').setup {
					mappings = {
						'<C-u>',
						'<C-d>',
						'<C-b>',
						'<C-f>',
						'<C-y>',
						'<C-e>',
						'zt',
						'zz',
						'zb',
					},
				}
			end,
			disable = true,
		}
		-- cmp
		use {
			'hrsh7th/nvim-cmp',
			config = getconf 'nvim-cmp',
			-- opt = true,
		}
		-- use 'dmitmel/cmp-cmdline-history'
		use {
			'ray-x/cmp-treesitter',
			requires = {
				'hrsh7th/nvim-cmp',
			},
		}
		use {
			'hrsh7th/cmp-cmdline',
			requires = {
				'hrsh7th/nvim-cmp',
			},
		}
		use {
			'hrsh7th/cmp-nvim-lsp',
			requires = {
				'hrsh7th/nvim-cmp',
			},
		}
		-- Snippets source for nvim-cmp
		use {
			'saadparwaiz1/cmp_luasnip',
			requires = {
				'hrsh7th/nvim-cmp',
			},
		}
		use {
			'hrsh7th/cmp-path',
			requires = {
				'hrsh7th/nvim-cmp',
			},
		}
		use {
			'hrsh7th/cmp-buffer',
			requires = {
				'hrsh7th/nvim-cmp',
			},
		}
		use {
			'hrsh7th/cmp-nvim-lua',
			requires = {
				'hrsh7th/nvim-cmp',
			},
		}
		use {
			'f3fora/cmp-spell',
			requires = {
				'hrsh7th/nvim-cmp',
			},
		}
		-- use 'zbirenbaum/copilot-cmp'
		use {
			'tzachar/cmp-tabnine',
			run = './install.sh',
			requires = { 'hrsh7th/nvim-cmp' },
		}
		use {
			'glacambre/firenvim',
			run = function()
				vim.fn['firenvim#install'](0)
			end,
		}
		use 'RRethy/vim-illuminate'
		use {
			'gbprod/stay-in-place.nvim',
			config = function()
				require('stay-in-place').setup {}
			end,
		}
		-- use {
		-- 	'zbirenbaum/copilot.lua',
		-- 	event = { 'VimEnter' },
		-- 	config = function()
		-- 		vim.defer_fn(function()
		-- 			require('copilot').setup()
		-- 		end, 100)
		-- 	end,
		-- }
		use 'L3MON4D3/LuaSnip' -- Snippets plugin
		use 'nanotee/nvim-lsp-basics'
		use {
			'mfussenegger/nvim-dap',
			config = getconf 'dap',
		}
		use {
			'https://github.com/Fymyte/rasi.vim',
			-- ft = {''}
		}
		use {
			'onsails/lspkind.nvim',
			config = function()

				-- require('lspkind').init {
				-- 	-- DEPRECATED (use mode instead): enables text annotations
				-- 	--
				-- 	-- default: true
				-- 	-- with_text = true,
				--
				-- 	-- defines how annotations are shown
				-- 	-- default: symbol
				-- 	-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
				-- 	mode = 'symbol_text',
				--
				-- 	-- default symbol map
				-- 	-- can be either 'default' (requires nerd-fonts font) or
				-- 	-- 'codicons' for codicon preset (requires vscode-codicons font)
				-- 	--
				-- 	-- default: 'default'
				-- 	preset = 'codicons',
				--
				-- 	-- override preset symbols
				-- 	--
				-- 	-- default: {}
				-- 	symbol_map = {
				-- 		Text = '',
				-- 		Method = '',
				-- 		Function = '',
				-- 		Constructor = '',
				-- 		Field = 'ﰠ',
				-- 		Variable = '',
				-- 		Class = 'ﴯ',
				-- 		Interface = '',
				-- 		Module = '',
				-- 		Property = 'ﰠ',
				-- 		Unit = '塞',
				-- 		Value = '',
				-- 		Enum = '',
				-- 		Keyword = '',
				-- 		Snippet = '',
				-- 		Color = '',
				-- 		File = '',
				-- 		Reference = '',
				-- 		Folder = '',
				-- 		EnumMember = '',
				-- 		Constant = '',
				-- 		Struct = 'פּ',
				-- 		Event = '',
				-- 		Operator = '',
				-- 		TypeParameter = '',
				-- 	},
				-- }
			end,
		}
		-- use { 'jubnzv/virtual-types.nvim', config = function() end }
		-- use 'pedrohdz/vim-yaml-folds'
		use {
			'kylechui/nvim-surround',
			tag = '*', -- Use for stability; omit for the latest features
			config = function()
				require('nvim-surround').setup {
					-- Configuration here, or leave empty to use defaults
				}
			end,
		}
		use {
			'akinsho/toggleterm.nvim',
			tag = 'v2.*',
			config = function()
				require('toggleterm').setup()
			end,
		}
		use {
			'rcarriga/nvim-notify',
			-- disable = true,
			config = function()
				vim.notify = require 'notify'
			end,
		}
		-- I'll miss you :)
		-- use {
		-- 	'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
		-- 	config = function()
		-- 		require('lsp_lines').setup {}
		-- 	end,
		-- }
		use {
			'smjonas/inc-rename.nvim',
			config = function()
				require('inc_rename').setup()
			end,
		}
		use {
			'simrat39/symbols-outline.nvim',
			config = function()
				require('symbols-outline').setup()
			end,
		}
		-- use {
		-- 	'CosmicNvim/cosmic-ui',
		-- 	requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
		-- 	config = function()
		-- 		require('cosmic-ui').setup {}
		-- 		-- local a = 93041
		-- 		-- print a
		-- 	end,
		-- }
		use {
			'ray-x/lsp_signature.nvim',
			config = function()
				-- require('lsp_signature').setup(cfg)
			end,
		}
		use {
			'williamboman/mason.nvim',
			config = getconf 'mason',
		}
		use {
			'williamboman/mason-lspconfig.nvim',
			requires = { 'williamboman/mason.nvim' },
			config = function()
				require('mason-lspconfig').setup()
			end,
		}
		use {
			'tpope/vim-unimpaired',
			-- opt = true,
			keys = { ']b', '[b' },
		}
		use {
			'mhartington/formatter.nvim',
			config = getconf 'formatter',
		}
		use {
			'andweeb/presence.nvim',
			config = getconf 'presence',
		}
		use 'notomo/cmdbuf.nvim'
		use 'LionC/nest.nvim'
		use 'jghauser/mkdir.nvim'
		use {
			'kana/vim-textobj-user',
			-- keys = 'ae',
		}
		use {
			'kana/vim-textobj-entire',
			-- keys = 'ae',
		}
		use {
			'max397574/better-escape.nvim',
			config = function()
				require('better_escape').setup {
					mapping = {
						'jk',
						'kj',
						'jj',
						'kk',
					}, -- a table with mappings to use
					timeout = 1000, -- vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
				}
			end,
		}
		use {
			'mfussenegger/nvim-lint',
			config = getconf 'nvim-lint',
		}
		use {
			'sitiom/nvim-numbertoggle',
			config = function()
				require('numbertoggle').setup()
			end,
		}
		use {
			'goolord/alpha-nvim',
			requires = { 'kyazdani42/nvim-web-devicons' },
			config = getconf 'alpha-nvim',
		}
		use {
			'nvim-lualine/lualine.nvim',
			requires = {
				'kyazdani42/nvim-web-devicons',
				-- opt = true,
			},
			config = getconf 'lualine',
		}
		-- use {
		-- 	'junegunn/fzf',
		-- 	run = function()
		-- 		vim.fn['fzf#install'](0)
		-- 	end,
		-- }
		-- use {
		-- 	'junegunn/fzf.vim',
		-- 	requires = { 'junegunn/fzf' },
		-- }
		use {
			'gelguy/wilder.nvim',
			disable = true,
			config = getconf 'wilder',
			run = [[:UpdateRemotePlugins]],
		}
		use {
			'lewis6991/gitsigns.nvim',
			config = getconf 'gitsigns',
		}
		use {
			'lukas-reineke/indent-blankline.nvim',
			config = function()
				require('indent_blankline').setup {
					-- vim.opt.listchars:append "eol:↴"
					-- for example, context is off by default, use this to turn it on
					show_current_context = true,
					show_current_context_start = true,
					show_end_of_line = true,
				}
			end,
		}
		use {
			'numToStr/Comment.nvim',
			config = getconf 'comment',
		}
		use {
			'haringsrob/nvim_context_vt',
			config = function()
				require('nvim_context_vt').setup {
					disable_ft = {
						'yaml',
					},
				}
			end,
		}
		-- use 'mizlan/iswap.nvim'
		use 'antoinemadec/FixCursorHold.nvim'
		use {
			'nacro90/numb.nvim',
			config = function()
				require('numb').setup()
			end,
		}
		use {
			'akinsho/bufferline.nvim',
			tag = 'v2.*',
			requires = 'kyazdani42/nvim-web-devicons',
			config = getconf 'bufferline',
		}

		-- @

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require('packer').sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float {
					border = 'single',
				}
			end,
		},
	},
}
