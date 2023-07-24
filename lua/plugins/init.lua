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
		use 'nvim-lua/plenary.nvim'

		-- theme
		use {
			'sainnhe/gruvbox-material',
			tag = 'v1.2.4',
		}

		-- utilitys
		use {
			{
				'lambdalisue/suda.vim',
				cmd = {
					'SudaRead',
					'SudaWrite',
				},
			},
			{ 'wakatime/vim-wakatime' },
			{
				'rgroli/other.nvim',
				config = getconf 'others-nvim',
			},
			{ 'famiu/bufdelete.nvim' },
			{
				'Pocco81/AbbrevMan.nvim',
				disable = true,
				config = getconf 'abbrevman',
			},
			{ 'linty-org/readline.nvim' },
			{
				'xiyaowong/nvim-transparent',
				cmd = 'TransparentToggle',
			},
			{ 'ellisonleao/glow.nvim' },
			{ 'dstein64/vim-startuptime' },
			{
				'ethanholz/nvim-lastplace',
				config = function()
					require('nvim-lastplace').setup()
				end,
			},
			{ 'antoinemadec/FixCursorHold.nvim' },
			{
				'https://github.com/vim-scripts/AnsiEsc.vim',
			},
			{
				'nacro90/numb.nvim',
				config = function()
					require('numb').setup()
				end,
			},
			{ 'sitiom/nvim-numbertoggle' },
			{ 'notomo/cmdbuf.nvim' },
			{
				'andweeb/presence.nvim',
				config = getconf 'presence',
			},
			{
				'rcarriga/nvim-notify',
				config = function()
					vim.notify = require 'notify'
				end,
			},
			{ 'h-hg/fcitx.nvim' },
			{ 'jghauser/mkdir.nvim' },
			{
				'bkad/CamelCaseMotion',
				config = getconf 'camelcasemotion',
			},
			{
				'tpope/vim-unimpaired',
				-- opt = true,
				keys = { ']b', '[b' },
			},
			{ 'mbbill/undotree' },
			{
				'winston0410/range-highlight.nvim',
				requires = 'winston0410/cmd-parser.nvim',
				config = function()
					require('range-highlight').setup {}
				end,
			},
			{
				'j-hui/fidget.nvim',
				tag = 'legacy',
				config = function()
					require('fidget').setup {}
				end,
			},
			{
				'sunjon/shade.nvim',
				disable = true,
				config = getconf 'shade',
			},
			{
				'lcheylus/overlength.nvim',
				disable = true,
				config = function()
					require('overlength').setup()
				end,
			},
			{
				'glacambre/firenvim',
				run = function()
					vim.fn['firenvim#install'](0)
				end,
			},
			{
				'RRethy/vim-illuminate',
				config = getconf 'illuminate',
			},
			{
				'gbprod/stay-in-place.nvim',
				disable = true,
				config = function()
					require('stay-in-place').setup {}
				end,
			},
			{
				'kdheepak/lazygit.nvim',
				cmd = 'lazyGit',
			},
			{
				'kevinhwang91/nvim-hlslens',
				config = function()
					require('hlslens').setup {}
				end,
			},
			{
				'chentoast/marks.nvim',
				config = getconf 'marks',
			},
			{
				'petertriho/nvim-scrollbar',
				config = function()
					require('scrollbar').setup {}
				end,
			},
			{
				'max397574/better-escape.nvim',
				config = getconf 'better-escape',
			},
			{ 'samjwill/nvim-unception' },
			{
				'karb94/neoscroll.nvim',
				config = getconf 'neoscroll',
				disable = true,
			},
			{
				'anuvyklack/windows.nvim',
				requires = {
					'anuvyklack/middleclass',
					-- 'anuvyklack/animation.nvim',
				},
				config = function()
					require('windows').setup()
				end,
			},
			{
				'AckslD/nvim-neoclip.lua',
				requires = 'nvim-telescope/telescope.nvim',
				config = getconf 'neoclip',
			},
			{
				'folke/which-key.nvim',
				config = getconf 'which-key',
			},
			{
				'folke/todo-comments.nvim',
				requires = 'nvim-lua/plenary.nvim',
				config = getconf 'todo-comments',
			},
			{
				'melkster/modicator.nvim',
				-- requires = {
				-- 	'sainnhe/gruvbox-material',
				-- },
				disable = true,
				after = 'sainnhe/gruvbox-material', -- Add your colorscheme plugin here
				config = getconf 'modicator',
			},
			{
				'm-demare/attempt.nvim',
				requires = 'nvim-lua/plenary.nvim',
				config = getconf 'attempt',
			},
			{
				'kylechui/nvim-surround',
				tag = '*', -- Use for stability; omit for the latest features
				config = function()
					require('nvim-surround').setup {}
				end,
			},
			{
				'abecodes/tabout.nvim',
				config = getconf 'tabout',
				requires = { 'nvim-treesitter' }, -- or require if not used so far
				after = { 'nvim-cmp' }, -- if a completion plugin is using tabs load it before
			},
			'gpanders/editorconfig.nvim',
		}

		-- individual language support
		use {
			{ 'kovetskiy/sxhkd-vim' },
			{ 'Fymyte/rasi.vim' },
			{ 'elkowar/yuck.vim' },
			{
				'cuducos/yaml.nvim',
				ft = { 'yaml' }, -- optional
				requires = {
					'nvim-treesitter/nvim-treesitter',
					'nvim-telescope/telescope.nvim', -- optional
				},
			},
			-- 'NoahTheDuke/vim-just',
			'katusk/vim-qkdb-syntax',
			{
				-- 'IndianBoy42/tree-sitter-just',
				'/home/abiria/.config/nvim/lua/tree-sitter-just',
				-- disable = true,
				config = function()
					require('tree-sitter-just').setup {
						['local'] = nil,
					}
				end,
			},
			-- 'mechatroner/rainbow_csv',
			use 'mfussenegger/nvim-jdtls',
		}

		-- LSP
		use {
			{ 'neovim/nvim-lspconfig' },
			{
				'glepnir/lspsaga.nvim',
				branch = 'main',
				requires = {
					{ 'nvim-tree/nvim-web-devicons' },
					--Please make sure you install markdown and markdown_inline parser
					{ 'nvim-treesitter/nvim-treesitter' },
				},
				config = function()
					require('lspsaga').setup {}
				end,
			},
			{
				'ray-x/lsp_signature.nvim',
				config = function()
					-- require('lsp_signature').setup(cfg)
				end,
			},
			{
				'williamboman/mason.nvim',
				config = getconf 'mason',
			},
			{
				'williamboman/mason-lspconfig.nvim',
				requires = { 'williamboman/mason.nvim' },
				config = function()
					require('mason-lspconfig').setup()
				end,
			},
			{
				'onsails/lspkind.nvim',
				config = function() end,
			},
			'nanotee/nvim-lsp-basics',
			{
				'rmagatti/goto-preview',
				config = function()
					require('goto-preview').setup {}
				end,
			},
			{
				'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
				disable = true,
				config = function()
					require('lsp_lines').setup {}
				end,
			},
			'simrat39/rust-tools.nvim',
			{
				'mfussenegger/nvim-dap',
				config = getconf 'dap',
			},
		}

		-- UI
		use {
			{ 'kyazdani42/nvim-web-devicons' },
			{
				'nvim-tree/nvim-tree.lua',
				requires = {
					'nvim-tree/nvim-web-devicons', -- optional, for file icons
				},
				-- tag = 'nightly', -- optional, updated every week. (see issue #1193)
				branch = 'master',
				-- commit = '5aa318c15934efa03d2ac86b493e89792e06c7b6',
				config = getconf 'nvim-tree',
			},
			{
				'akinsho/bufferline.nvim',
				tag = 'v2.*',
				requires = 'nvim-tree/nvim-web-devicons',
				config = getconf 'bufferline',
			},
			{
				'goolord/alpha-nvim',
				requires = {
					'nvim-tree/nvim-web-devicons',
				},
				config = getconf 'alpha-nvim',
			},
			{
				'nvim-lualine/lualine.nvim',
				requires = {
					'nvim-tree/nvim-web-devicons',
					-- opt = true,
				},
				config = getconf 'lualine',
			},
			{
				'CosmicNvim/cosmic-ui',
				requires = {
					'MunifTanjim/nui.nvim',
					'nvim-lua/plenary.nvim',
				},
				config = function()
					require('cosmic-ui').setup()
				end,
				disable = true,
			},
		}

		-- treesitter
		use {
			{
				'nvim-treesitter/nvim-treesitter',
				-- branch = 'v0.8.0',
				config = getconf 'treesitter',
				run = function()
					local ts_update = require(
						'nvim-treesitter.install'
					).update { with_sync = true }
					ts_update()
				end,
			},
			{ 'windwp/nvim-ts-autotag' },
			{
				'lewis6991/spellsitter.nvim',
				requires = {
					'nvim-treesitter/nvim-treesitter',
				},
				config = function()
					require('spellsitter').setup {
						enable = true,
					}
				end,
			},
			{
				'nvim-treesitter/playground',
				disable = true,
				requires = {
					'nvim-treesitter/nvim-treesitter',
				},
			},
			{
				'nvim-treesitter/nvim-treesitter-context',
				requires = {
					'nvim-treesitter/nvim-treesitter',
				},
				config = getconf 'treesitter-context',
			},
			{
				'windwp/nvim-autopairs',
				config = getconf 'autopairs',
			},
			{
				'p00f/nvim-ts-rainbow',
				requires = {
					'nvim-treesitter/nvim-treesitter',
				},
			},
			{
				'JoosepAlviste/nvim-ts-context-commentstring',
				requires = {
					'nvim-treesitter/nvim-treesitter',
				},
			},
			{
				'm-demare/hlargs.nvim',
				requires = {
					'nvim-treesitter/nvim-treesitter',
				},
				config = function()
					require('hlargs').setup()
				end,
			},
			{
				'RRethy/nvim-treesitter-endwise',
				requires = {
					'nvim-treesitter/nvim-treesitter',
				},
			},
			{
				'nvim-treesitter/nvim-treesitter-textobjects',
				requires = {
					'nvim-treesitter/nvim-treesitter',
				},
			},
			{
				'ziontee113/syntax-tree-surfer',
				requires = {
					'nvim-treesitter/nvim-treesitter',
				},
				config = getconf 'syntax-tree-surfer',
			},
		}

		-- telescope
		use {
			{
				'nvim-telescope/telescope.nvim',
				tag = '0.1.0',
				requires = {
					'nvim-lua/plenary.nvim',
					{
						'nvim-treesitter/nvim-treesitter',
						opt = true,
					},
					{
						'nvim-tree/nvim-web-devicons',
						opt = true,
					},
				},
				-- opt = true,
				-- cmd = 'Telescope',
				-- keys = {
				-- 	'<leader>f',
				-- },
				config = getconf 'telescope',
			},
			{
				'LinArcX/telescope-command-palette.nvim',
				requires = {
					'nvim-telescope/telescope.nvim',
				},
			},
			{ 'nvim-telescope/telescope-ui-select.nvim' },
			{
				'jvgrootveld/telescope-zoxide',
				requires = {
					'nvim-telescope/telescope.nvim',
				},
			},
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
				requires = {
					'nvim-telescope/telescope.nvim',
				},
			},
		}

		-- cmp
		use {
			{
				'hrsh7th/nvim-cmp',
				config = getconf 'nvim-cmp',
				-- opt = true,
			},
			{
				'ray-x/cmp-treesitter',
				requires = {
					'hrsh7th/nvim-cmp',
				},
			},
			{
				'hrsh7th/cmp-cmdline',
				requires = {
					'hrsh7th/nvim-cmp',
				},
			},
			{
				'hrsh7th/cmp-nvim-lsp',
				requires = {
					'hrsh7th/nvim-cmp',
				},
			},
			'L3MON4D3/LuaSnip', -- Snippets plugin
			-- Snippets source for nvim-cmp
			{
				'saadparwaiz1/cmp_luasnip',
				requires = {
					'hrsh7th/nvim-cmp',
				},
			},
			{
				'hrsh7th/cmp-path',
				requires = {
					'hrsh7th/nvim-cmp',
				},
			},
			{
				'hrsh7th/cmp-buffer',
				requires = {
					'hrsh7th/nvim-cmp',
				},
			},
			{
				'hrsh7th/cmp-nvim-lua',
				requires = {
					'hrsh7th/nvim-cmp',
				},
			},
			{
				'f3fora/cmp-spell',
				requires = {
					'hrsh7th/nvim-cmp',
				},
			},
			-- use 'zbirenbaum/copilot-cmp'
			{
				'tzachar/cmp-tabnine',
				run = './install.sh',
				requires = { 'hrsh7th/nvim-cmp' },
			},
		}

		-- etc
		use {
			'folke/trouble.nvim',
			requires = 'nvim-tree/nvim-web-devicons',
			config = function()
				require('trouble').setup {}
			end,
		}
		use {
			'SmiteshP/nvim-navic',
			requires = 'neovim/nvim-lspconfig',
			config = getconf 'navic',
		}
		use {
			'kevinhwang91/nvim-ufo',
			disable = true,
			requires = 'kevinhwang91/promise-async',
			config = getconf 'ufo',
		}
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
			'ThePrimeagen/harpoon',
			requires = { 'nvim-lua/plenary.nvim' },
			-- opt = true,
			-- keys = {
			-- 	'<leader>',
			-- },
			config = getconf 'harpoon',
		}
		use {
			'simrat39/symbols-outline.nvim',
			config = function()
				require('symbols-outline').setup()
			end,
		}
		use {
			'mhartington/formatter.nvim',
			config = getconf 'formatter',
			-- commit = '182740a',
		}
		use 'LionC/nest.nvim'
		use {
			'kana/vim-textobj-user',
			-- keys = 'ae',
		}
		use {
			'kana/vim-textobj-entire',
			-- keys = 'ae',
		}
		use {
			'mfussenegger/nvim-lint',
			config = getconf 'nvim-lint',
		}
		use {
			'ggandor/leap.nvim',
			config = function()
				local leap = require 'leap'
				leap.set_default_keymaps()

				vim.api.nvim_set_hl(
					0,
					'LeapBackdrop',
					{ fg = '#707070' }
				)
			end,
		}
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
			'nmac427/guess-indent.nvim',
			config = function()
				require('guess-indent').setup {
					filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
						'netrw',
						'tutor',
					},
					buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
						'help',
						'nofile',
						'terminal',
						'prompt',
					},
				}
			end,
		}
		use {
			'mg979/vim-visual-multi',
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
		-- use 'fmoralesc/nvimfs'
		-- @

		-- plugins for nvim nightly only
		if vim.version().minor > 7 then
			use {
				'smjonas/inc-rename.nvim',
				config = function()
					require('inc_rename').setup()
				end,
			}
		end

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
