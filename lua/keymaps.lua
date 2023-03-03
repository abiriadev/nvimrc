vim.cmd [[let mapleader=" "]]

local nest = require 'nest'

-- C-; => hover
-- ( end begin sentence )

nest.applyKeymaps {
	{
		'<leader>',
		{
			{
				'<leader>',
				'<cmd>Telescope harpoon marks<CR>',
				-- function()
				-- 	require('harpoon.ui').toggle_quick_menu()
				-- end,
			},
			{
				'f',
				{
					{
						'<CR>',
						function()
							require('telescope.builtin').resume()
						end,
					},
					{
						'/',
						function()
							require('telescope.builtin').builtin()
						end,
					},
					{
						'f',
						function()
							require('telescope.builtin').find_files()
						end,
					},
					{
						'g',
						function()
							require('telescope.builtin').live_grep()
						end,
					},
					{
						'#',
						function()
							require('telescope.builtin').grep_string()
						end,
					},
					{
						'b',
						function()
							require('telescope.builtin').buffers()
						end,
					},
					{
						'l',
						function()
							require('telescope.builtin').current_buffer_fuzzy_find()
						end,
					},
					{
						'H',
						function()
							require('telescope.builtin').help_tags()
						end,
					},
					{
						'<C-h>',
						function()
							require('telescope.builtin').oldfiles()
						end,
					},
					{
						':',
						function()
							require('telescope.builtin').commands()
						end,
					},
					{
						'q',
						{
							{
								':',
								function()
									require(
										'telescope.builtin'
									).command_history()
								end,
							},
							{
								'/',
								function()
									require(
										'telescope.builtin'
									).search_history()
								end,
							},
							-- {
							-- 	'f',
							-- 	function()
							-- 		require(
							-- 			'telescope.builtin'
							-- 		).quickfix()
							-- 	end,
							-- },
						},
					},
					{
						'm',
						function()
							require('telescope.builtin').marks()
						end,
					},
					{
						'M',
						function()
							require('telescope.builtin').man_pages()
						end,
					},
					{
						't',
						function()
							require('telescope.builtin').colorscheme()
						end,
					},
					{
						'j',
						function()
							require('telescope.builtin').jumplist()
						end,
					},
					{
						'o',
						function()
							require('telescope.builtin').options()
						end,
					},
					{
						'r',
						function()
							require('telescope.builtin').registers()
						end,
					},
					{
						'A',
						function()
							require('telescope.builtin').autocommands()
						end,
					},
					{
						'k',
						function()
							require('telescope.builtin').keymaps()
						end,
					},
					{
						'L',
						function()
							require('telescope.builtin').highlights()
						end,
					},
				},
			},
			{
				'm',
				function()
					require('harpoon.mark').add_file()
					vim.notify(
						'added buffer to harpoon!'
							.. '\n'
							.. vim.api.nvim_buf_get_name(0)
					)
				end,
			},
			{
				't',
				':tabe ',
				options = {
					silent = false,
				},
			},
			{
				'g',
				'<cmd>LazyGit<CR>',
			},
			{
				'x',
				'<cmd>TroubleToggle<CR>',
			},
			{
				'e',
				function()
					---@diagnostic disable-next-line: unused-local
					local tree =
						require('nvim-tree.api').tree

					if vim.bo.filetype == 'NvimTree' then
						return '<C-w>p'
					elseif vim.bo.filetype == '' then
						return '<cmd>NvimTreeOpen<CR>'
					else
						return '<cmd>NvimTreeFindFile<CR>'
					end
				end,
				options = {
					expr = true,
				},
			},
			{
				'<S-e>',
				'<cmd>NvimTreeFindFileToggle<CR>',
			},
			{
				'h',
				function()
					vim.lsp.buf.hover()
				end,
			},
			{
				'd',
				function()
					vim.lsp.buf.definition()
				end,
			},
			{
				'<S-d>',
				function()
					require('goto-preview').goto_preview_definition()
				end,
			},
			{
				'r',
				function()
					require('telescope.builtin').lsp_references()
				end,
			},
			{
				'<S-r>',
				function()
					require('goto-preview').goto_preview_references()
				end,
			},
			{
				'<CR>',
				function()
					-- vim.notify.dismiss()
					require('notify').dismiss()
				end,
			},
			{
				'k',
				'<cmd>BufferLinePick<CR>',
			},
			{
				'z',
				function()
					require('bufdelete').bufdelete(nil)
				end,
			},
			{
				'q',
				function()
					vim.api.nvim_buf_delete(0, {})
				end,
			},
			{
				'o',
				-- function ()
				-- 	require 'others-nvim'.
				-- end
				'<cmd>:Other<CR>',
			},
			{
				'n',
				function()
					local attempt = require 'attempt'
					attempt.new_select()
				end,
			},
			{
				'p',
				'<cmd>Telescope neoclip<CR>',
			},
			{
				'w',
				{
					{
						'w',
						'<cmd>winc w<CR>',
					},
					{
						'h',
						'<cmd>winc h<CR>',
					},
					{
						'j',
						'<cmd>winc j<CR>',
					},
					{
						'k',
						'<cmd>winc k<CR>',
					},
					{
						'l',
						'<cmd>winc l<CR>',
					},
					{
						'p',
						'<cmd>winc p<CR>',
					},
					{
						'o',
						'<cmd>winc o<CR>',
					},
					{
						'x',
						'<cmd>winc x<CR>',
					},
				},
			},
		},
	},
	{
		'<C-',
		{
			{
				'`>',
				'<cmd>ToggleTerm<CR>',
			},
			{
				'\\>',
				'<cmd>ToggleTerm<CR>',
				mode = 'nv',
			},
			{
				'Tab>',
				'gt',
			},
			{
				'S-Tab>',
				'gT',
			},
			{
				's>',
				'<cmd>w<CR>',
			},
			{
				'/',
				'',
			},
		},
	},
	{
		'<F',
		{
			{
				'5>',
				function()
					require('dap').continue()
				end,
			},
			{
				'6>',
				function()
					require('dap').toggle_breakpoint()
				end,
			},
			{
				'7>',
				function()
					require('dap').step_over()
				end,
			},
			{
				'8>',
				function()
					require('dap').step_into()
				end,
			},
			{
				'9>',
				function()
					require('dap').repl.open()
				end,
			},
		},
	},
	{
		'[',
		{

			{
				'h',
				function()
					require('harpoon.ui').nav_next() -- navigates to next mark
				end,
			},
			{
				'x',
				function()
					-- jump to the next item, skipping the groups
					require('trouble').previous {
						skip_groups = true,
						jump = true,
					}
				end,
			},
			{
				't',
				'gT',
			},
		},
	},
	{
		']',
		{
			{
				'h',
				function()
					require('harpoon.ui').nav_prev() -- navigates to previous mark
				end,
			},
			{
				'x',
				function()
					-- jump to the previous item, skipping the groups
					require('trouble').next {
						skip_groups = true,
						jump = true,
					}
				end,
			},
			{
				't',
				'gt',
			},
		},
	},
	{
		'q',
		{
			-- open lua command-line window
			{
				'l', -- ':'
				function()
					require('cmdbuf').split_open(
						vim.o.cmdwinheight,
						{
							type = 'lua/cmd',
						}
					)
				end,
			},
			{
				':',
				function()
					require('cmdbuf').split_open(
						vim.o.cmdwinheight
					)
				end,
			},
			-- q/, q? alternative
			{
				'/',
				function()
					require('cmdbuf').split_open(
						vim.o.cmdwinheight,
						{
							type = 'vim/search/forward',
						}
					)
				end,
			},
			{
				'?',
				function()
					require('cmdbuf').split_open(
						vim.o.cmdwinheight,
						{
							type = 'vim/search/backward',
						}
					)
				end,
			},
		},
	},
	{
		mode = 'v',
		{
			'<lt>',
			'<lt>gv',
		},
		{
			'>',
			'>gv',
		},
	},

	{
		mode = 't',
		{
			'<Esc>',
			'<C-\\><C-n><C-w><C-p>',
		},
	},
	{
		'n',
		'nzz',
	},
	{
		'N',
		'Nzz',
	},
	{
		'8',
		'10jzz',
		mode = 'n',
	},
	{
		'9',
		'10kzz',
		mode = 'n',
	},
	{
		'8',
		'10j',
		mode = 'v',
	},
	{
		'9',
		'10k',
		mode = 'v',
	},
	{
		'Y',
		'y$',
	},
	{
		'<S-g>',
		'Gzz',
	},
	{
		'p',
		'pgvy',
		mode = 'v',
	},
	{
		'<S-p>',
		'<S-p>gvy',
		mode = 'v',
	},
	{
		'<Esc>',
		function()
			require('goto-preview').close_all_win()
		end,
	},
}

vim.keymap.set('c', '<C-f>', function()
	require('cmdbuf').split_open(vim.o.cmdwinheight, {
		line = vim.fn.getcmdline(),
		column = vim.fn.getcmdpos(),
	})
	vim.api.nvim_feedkeys(
		vim.api.nvim_replace_termcodes(
			'<C-c>',
			true,
			false,
			true
		),
		'n',
		true
	)
end)

-- Custom buffer mappings
vim.api.nvim_create_autocmd({
	'User',
}, {
	group = vim.api.nvim_create_augroup(
		'cmdbuf_setting',
		{}
	),
	pattern = {
		'CmdbufNew',
	},
	callback = function()
		vim.keymap.set('n', 'q', [[<Cmd>quit<CR>]], {
			nowait = true,
			buffer = true,
		})
		vim.keymap.set(
			'n',
			'dd',
			[[<Cmd>lua require('cmdbuf').delete()<CR>]],
			{
				buffer = true,
			}
		)
	end,
})

-- remap 'next tab' to Ctrl+Tab like chrome and other tools

-- it is faster to type 'jk' instead of press Esc,
-- which is located in far away from center in my keyboard.
-- vim.keymap.set('n', '<Esc>', function()
-- 	return vim.api.nvim_get_vvar('hlsearch') == 1 and ":nohl<CR>" or "<Esc>"
-- end, {
-- 	expr = true,
-- 	silent = true,
-- })
vim.keymap.set('n', '<leader>s', 'yss)')
-- vim.keymap.set('c', 'W', 'w')
vim.cmd [[
cnoreabbrev <expr> W getcmdtype() is# ':' && getcmdline() is# 'W' ? 'w' : 'W'
cnoreabbrev <expr> Q getcmdtype() is# ':' && getcmdline() is# 'Q' ? 'q' : 'Q'
]]
-- leave terminal buffer with <Esc>
-- then return to previous window
-- vim.keymap.set('t', '<Esc>', '<C-\\><C-n>') --

-- make path automatically even it does not exist
-- vim.keymap.set('c', 'ww', '!mkdir -p %:h | write')

vim.cmd [[cab b buffers
" even though b alone works, I like to expand it

cab f find
" I don't use fuzzy-finders, but :find so this is huge for me!]]

local readline = require 'readline'
vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
vim.keymap.set('!', '<C-e>', readline.end_of_line)
-- vim.keymap.set('!', '<C-w>', readline.unix_word_rubout)
vim.keymap.set('!', '<C-k>', readline.kill_line)
vim.keymap.set('!', '<C-u>', readline.backward_kill_line)
vim.keymap.set('!', '<C-d>', '<Delete>')
vim.keymap.set('!', '<C-f>', '<Right>')
vim.keymap.set('!', '<C-b>', '<Left>')

-- <F1> help
-- <F2> vim-codepainter
-- <F3> vim-codepainter navigate
-- vim.keymap.set('n', '<F4>', ':set number! relativenumber!<CR>', {noremap = true, silent = false})
-- vim.keymap.set('n', '<F5>', ':set list! list?<CR>', {noremap = false, silent = false})
-- vim.keymap.set('n', '<F6>', '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
-- vim.keymap.set('t', '<F6>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<F7>', ':NvimTreeToggle<CR>', {noremap = false, silent = true})
-- vim.keymap.set('n', '<F8>', ':MinimapToggle<CR>', {noremap = false, silent = true})
-- vim.keymap.set('n', '<leader>nm', ':Dispatch npm start<CR>', {noremap = false, silent = false})
-- -- Buffers
-- vim.keymap.set('n', '<leader>bd', ':BDelete this<CR>', {noremap = false, silent = false})
-- vim.keymap.set('n', '<leader>bda', ':BDelete! all<CR>', {noremap = false, silent = false})
-- vim.keymap.set('n', '<leader>bdh', ':BDelete! hidden<CR>', {noremap = false, silent = false})
-- vim.keymap.set('n', '<leader>bn', '<Plug>(cokeline-focus-next)', {noremap = false, silent = false})
-- vim.keymap.set('n', '<leader>bp', '<Plug>(cokeline-focus-prev)', {noremap = false, silent = false})
-- -- Git
-- vim.keymap.set('n', '<leader>gf', ':20G<CR>', {noremap = false, silent = false})
-- vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', {noremap = false, silent = false})
-- -- Ctrlsf
-- vim.keymap.set('n', '<C-F>f', '<Plug>CtrlSFPrompt', {noremap = false, silent = false})
-- vim.keymap.set('v', '<C-F>f', '<Plug>CtrlSFVwordExec', {noremap = false, silent = false})
-- vim.keymap.set('n', '<C-F>n', '<Plug>CtrlSFCwordExec', {noremap = false, silent = false})
-- vim.keymap.set('n', '<C-F>t', ':CtrlSFToggle<CR>', {noremap = true, silent = false})
-- -- Easy-align
-- vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = false})
-- vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = false})
-- -- Lightspeed
-- vim.keymap.set('n', 'f', '<Plug>Lightspeed_f', {noremap = false, silent = false})
-- vim.keymap.set('n', 'F', '<Plug>Lightspeed_F', {noremap = false, silent = false})
-- vim.keymap.set('n', 't', '<Plug>Lightspeed_t', {noremap = false, silent = false})
-- vim.keymap.set('n', 'T', '<Plug>Lightspeed_T', {noremap = false, silent = false})
-- -- LSP
-- vim.keymap.set('n', '<space>,', ':lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<space>;', ':lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<space>a', ':lua vim.lsp.diagnostic.code_action()<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<space>d', ':lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<space>f', ':lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<space>h', ':lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<space>m', ':lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<space>r', ':lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<space>s', ':lua vim.lsp.buf.document_symbol()<CR>', {noremap = true, silent = true})
-- -- Telescope
-- vim.keymap.set('n', '<leader>f', ":lua require('plugins.telescope').project_files()<CR>", {noremap = true, silent = true})
-- vim.keymap.set('n', '<leader>p', ":lua require'telescope'.extensions.repo.list{file_ignore_patterns={'/%.cache/', '/%.cargo/', '/%.local/', '/%.asdf/', '/%.zinit/', '/%.tmux/'}}<CR>", {noremap = true, silent = true})
-- vim.keymap.set('n', '<leader>c', ":lua require('plugins.telescope').my_git_commits()<CR>", {noremap = true, silent = true})
-- vim.keymap.set('n', '<leader>g', ":lua require('plugins.telescope').my_git_status()<CR>", {noremap = true, silent = true})
-- vim.keymap.set('n', '<leader>b', ":lua require('plugins.telescope').my_git_bcommits()<CR>", {noremap = true, silent = true})
-- vim.keymap.set('n', '<leader>ns', ":lua require('plugins.telescope').my_note()<CR>", {noremap = true, silent = true})
-- vim.keymap.set('n', '<leader>nn', ":lua NewNote()<CR>", {noremap = true, silent = false})
-- vim.keymap.set('n', '<leader>n', ":lua require('plugins.scratches').open_scratch_file_floating()<CR>", {noremap = true, silent = true})
-- vim.keymap.set('n', '<leader>gc', ':Octo issue create<CR>', {noremap = true, silent = false})
-- vim.keymap.set('n', '<leader>i', ':Octo issue list<CR>', {noremap = true, silent = false})
-- vim.keymap.set('n', '<leader>y', ':Telescope neoclip<CR>', {noremap = true, silent = false})
-- vim.keymap.set('n', '<leader>ll', ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('GREP -> ') })<CR>", {noremap = true, silent = true})
-- -- HlsLens
-- vim.keymap.set('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
-- vim.keymap.set('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
-- vim.keymap.set('n', '*', "*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
-- vim.keymap.set('n', '#', "#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
-- vim.keymap.set('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
-- vim.keymap.set('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
-- -- Todo-comments
-- vim.keymap.set('n', '<leader>to', ':TodoTelescope<CR>', {noremap = true, silent = false})
-- -- Copilot
-- vim.keymap.set('i', '<C-J>', 'copilot#Accept()', {noremap = true, silent = true, expr = true})
-- -- Move.nvim
-- vim.keymap.set('n', '<A-j>', ":MoveLine(1)<CR>", { noremap = true, silent = true })
-- vim.keymap.set('n', '<A-k>', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
-- vim.keymap.set('v', '<A-j>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
-- vim.keymap.set('v', '<A-k>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
-- vim.keymap.set('n', '<A-l>', ":MoveHChar(1)<CR>", { noremap = true, silent = true })
-- vim.keymap.set('n', '<A-h>', ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
-- vim.keymap.set('v', '<A-l>', ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
-- vim.keymap.set('v', '<A-h>', ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })
-- -- Trouble
-- vim.keymap.set("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
-- vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})
-- -- Nvim-dap
-- vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>dsi", "<cmd>lua require'dap'.step_into()<CR>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>dso", "<cmd>lua require'dap'.step_out()<CR>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>dui", ":lua require('dapui').toggle()<cr>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>dro", "<cmd>lua require'dap'.repl.open()<CR>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>dcc", "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>dlb", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>dv", "<cmd>lua require'telescope'.extensions.dap.variables{}<CR>", {silent = true, noremap = true})
-- vim.keymap.set("n", "<leader>df", "<cmd>lua require'telescope'.extensions.dap.frames{}<CR>", {silent = true, noremap = true})
