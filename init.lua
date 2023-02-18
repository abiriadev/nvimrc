require 'impatient' --.enable_profile()

require 'options'
require 'plugins'
require 'keymaps'
require 'ft'
require 'lsp'
require 'color'
require 'autocmd'

if vim.g.neovide then
	vim.opt.guifont =
		[[jbcat,Jetbrains Mono,MesloLGL Nerd Font Mono:h10]]
	-- vim.opt.guifont = '*'

	require 'gui.neovide'
end

vim.g.code_action_menu_show_details = false
vim.g.code_action_menu_show_diff = false

vim.o.winbar =
	"%{%v:lua.require'nvim-navic'.get_location()%}"
