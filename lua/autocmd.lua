vim.cmd [[autocmd FileType * set formatoptions-=o]]
vim.cmd [[augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END]]
vim.cmd [[autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc]]

-- the path of the packer configuration file
-- which contains the list of all installed plugins
-- run `:PackerCompile` whenever the `plugins.lua` file has updated.
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins/init.lua source <afile> | PackerCompile
augroup end
]]

vim.cmd [[autocmd User TelescopePreviewerLoaded setlocal wrap]]
-- autocmd({'BufReadPost'}, {
--     pattern = '*',
--     callback = function()
--       if vim.fn.line([['"]]) > 1 and vim.fn.line([['"]]) <= vim.fn.line([[$]])
--     end
--   })
-- vim.api.nvim_command

-- autocmd BufRead * autocmd FileType <buffer> ++once
-- \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif

vim.cmd [[au BufWritePre /tmp/* setlocal noundofile]]
-- vim.cmd[[augroup GruvboxMaterial "{{{
--   autocmd!
--   autocmd VimEnter *
-- augroup END "}}}]]
vim.cmd [[autocmd BufReadPost,FileReadPost * normal zR]]
vim.cmd [[autocmd BufReadPost,FileReadPost * set spell]]
-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })
---ENDWORKAROUND
