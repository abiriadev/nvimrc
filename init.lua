require 'impatient' --.enable_profile()

require 'options'
require 'plugins'
require 'keymaps'
require 'lsp'
require 'color'
require 'autocmd'

if vim.g.neovide then
	vim.opt.guifont =
		[[JBcat Mono,Jetbrains Mono,MesloLGL Nerd Font Mono:h10]]
	-- vim.opt.guifont = '*'

	require 'gui.neovide'
end

-- You can configure Neovim to automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:

vim.g.code_action_menu_show_details = false
vim.g.code_action_menu_show_diff = false

-- vim.cmd [[syntax on]]
vim.cmd [[let g:Illuminate_delay = 0]]
-- vim.cmd [[hi rainbowcol1 guifg=#123456]]

