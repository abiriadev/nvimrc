local g = vim.api.nvim_create_augroup(
	'remove_o_from_formatoptions',
	{}
)
vim.api.nvim_create_autocmd('FileType', {
	desc = [[temporary solution: prevent inserting comments when pressing o, <S-o>.]],
	group = g,
	callback = function()
		vim.opt.formatoptions:remove { 'o' }
	end,
})

local g = vim.api.nvim_create_augroup(
	'nvim_formatter_autoformat',
	{}
)
vim.api.nvim_create_autocmd('BufWritePost', {
	desc = 'format code after saving',
	group = g,
	command = 'FormatWrite',
})

local g =
	vim.api.nvim_create_augroup('packer_user_config', {})
vim.api.nvim_create_autocmd('BufWritePost', {
	desc = 'run `:PackerCompile` whenever the `plugins.lua` file has updated.',
	group = g,
	-- the path of the packer configuration file
	-- which contains the list of all installed plugins
	pattern = 'plugins/init.lua',
	callback = function(ev)
		vim.cmd(string.format([[so %s]], ev.file))
		vim.cmd [[PackerCompile | PackerInstall]]
	end,
})

local g = vim.api.nvim_create_augroup('wrap_telescope', {})
vim.api.nvim_create_autocmd('User', {
	desc = 'wrap words in telescope preview buffer',
	group = g,
	pattern = 'TelescopePreviewerLoaded',
	callback = function()
		vim.opt_local.wrap = true
	end,
})

-- vim.cmd [[au BufWritePre /tmp/* setlocal noundofile]]
-- vim.cmd [[autocmd BufReadPost,FileReadPost * normal zR]]

-- disable spellcheck for vertain filetypes
-- vim.api.nvim_create_autocmd('FileType', {
-- 	pattern = 'alpha',
-- 	callback = function()
-- 		vim.opt_local.spell = false
-- 	end,
-- })

local g = vim.api.nvim_create_augroup('close-fidge', {})
vim.api.nvim_create_autocmd('VimLeavePre', {
	desc = 'close fidget when exit',
	group = g,
	command = [[silent! FidgetClose]],
})

local g = vim.api.nvim_create_augroup('yank-highlight', {})
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight on yank',
	group = g,
	callback = function()
		vim.highlight.on_yank {
			higroup = 'IncSearch',
			timeout = '200',
		}
	end,
})
