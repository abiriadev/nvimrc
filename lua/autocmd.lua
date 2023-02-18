vim.cmd [[autocmd FileType * set formatoptions-=o]]
vim.cmd [[augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END]]

-- the path of the packer configuration file
-- which contains the list of all installed plugins
-- run `:PackerCompile` whenever the `plugins.lua` file has updated.
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins/init.lua source <afile> | PackerCompile
autocmd BufWritePost plugins/init.lua source <afile> | PackerInstall
augroup end
]]

vim.cmd [[autocmd User TelescopePreviewerLoaded setlocal wrap]]

vim.cmd [[au BufWritePre /tmp/* setlocal noundofile]]
vim.cmd [[autocmd BufReadPost,FileReadPost * normal zR]]
vim.cmd [[autocmd BufReadPost,FileReadPost * set spell]]

-- disable spellcheck for vertain filetypes
vim.cmd [[autocmd FileType alpha setlocal nospell]]

vim.api.nvim_create_autocmd(
	'VimLeavePre',
	{ command = [[silent! FidgetClose]] }
)
