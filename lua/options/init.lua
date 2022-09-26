vim.opt.number = true

--[[
vim.opt.fillchars = { vert = ' ' }
vim.opt.showtabline = 2
vim.opt.scrolloff = 5
vim.opt.backupcopy = 'yes'
vim.opt.undolevels = 1000
vim.opt.shortmess:append { c = true, S = true }
vim.opt.showmode = false
vim.opt.hidden = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrapscan = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.errorbells = false
vim.opt.joinspaces = false
vim.opt.lazyredraw = true
vim.opt.encoding = 'UTF-8'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.clipboard = 'unnamedplus'
vim.opt.listchars = { tab = ">>>", trail = "·", precedes = "←", extends = "→",eol = "↲", nbsp = "␣" }
vim.opt.laststatus = 3
vim.opt.timeoutlen = 500
-- Buffer
vim.opt.fileformat = 'unix'
vim.opt.spelllang = 'it'
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.undofile = false
-- Window
vim.opt.colorcolumn = "+2"
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 1
vim.opt.list = false
vim.opt.foldnestmax = 10
vim.opt.signcolumn = 'yes'
vim.opt.foldenable = false

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 0 and last_pos <= vim.fn.line("$") then
      vim.api.nvim_win_set_cursor(0, {last_pos, 0})
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback =  function()
    vim.highlight.on_yank()
  end,
})
--]]

require 'options.important' --  1 important
require 'options.patterns' --  2 moving around, searching and patterns
require 'options.tags' --  3 tags
require 'options.display' --  4 displaying text
require 'options.syntax' --  5 syntax, highlighting and spelling
require 'options.windows' --  6 multiple windows
require 'options.tab' --  7 multiple tab pages
require 'options.terminal' --  8 terminal
require 'options.mouse' --  9 using the mouse
require 'options.printing' -- 10 printing
require 'options.messages' -- 11 messages and info
require 'options.selecting' -- 12 selecting text
require 'options.editing' -- 13 editing text
require 'options.indenting' -- 14 tabs and indenting
require 'options.folding' -- 15 folding
require 'options.diff' -- 16 diff mode
require 'options.mapping' -- 17 mapping
require 'options.readwrite' -- 18 reading and writing files
require 'options.swap' -- 19 the swap file
require 'options.cmdline' -- 20 command line editing
require 'options.external' -- 21 executing external commands
require 'options.make' -- 22 running make and jumping to errors (quickfix)
require 'options.language' -- 23 language specific
require 'options.characters' -- 24 multi-byte characters
require 'options.various' -- 25 various
