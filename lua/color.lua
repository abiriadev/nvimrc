if vim.fn.has 'termguicolors' == 1 then
	vim.go.t_8f = '[[38;2;%lu;%lu;%lum'
	vim.go.t_8b = '[[48;2;%lu;%lu;%lum'

	vim.opt.termguicolors = true
end

-- vim.g.gruvbox_material_palette = "original" -- original, mix, material
-- vim.g.gruvbox_material_enable_italic = 1
-- vim.g.gruvbox_material_sign_column_background = 'none'
vim.cmd [[let g:gruvbox_material_enable_bold = 1]]
vim.cmd [[let g:gruvbox_material_enable_italic = 1]]
vim.cmd [[let g:gruvbox_material_better_performance = 1]]
vim.cmd [[let g:gruvbox_material_background = 'medium']]
vim.cmd [[let g:gruvbox_material_diagnostic_text_highlight = 1]]
vim.cmd [[let g:gruvbox_material_diagnostic_virtual_text = 'colored']]

-- vim.cmd [[let g:gruvbox_material_transparent_background = 1]]

vim.cmd [[colorscheme gruvbox-material]]

-- vim.cmd [[highlight Visual cterm=NONE ctermbg=241 gui=NONE guibg=#665c54]]

-- vim.cmd [[highlight Comment cterm=italic term=italic gui=italic]]
