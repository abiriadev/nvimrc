vim.opt.undolevels = 2048 -- maximum number of changes that can be undone
vim.opt.undofile = true -- automatically save and restore undo history

-- use default XDG based undo directory
-- vim.opt.undodir = false	-- list of directories for undo files
-- vim.opt.undoreload = true -- maximum number lines to save for undo on a buffer reload
-- vim.opt.modified = false	-- changes have been made and not written to a file
-- vim.opt.readonly = false	-- buffer is not to be written
-- vim.opt.modifiable = false	-- changes to the text are possible
-- vim.opt.textwidth = false	-- line length above which to break a line
-- vim.opt.wrapmargin = false	-- margin from the right in which to break a line
-- vim.opt.backspace = false	-- specifies what <BS>, CTRL-W, etc. can do in Insert mode
-- vim.opt.comments = false	-- definition of what comment lines look like
vim.opt.formatoptions:remove { 'o' } -- list of flags that tell how automatic formatting works
-- vim.opt.formatlistpat = false	-- pattern to recognize a numbered list
-- vim.opt.formatexpr = false	-- expression used for "gq" to format lines
-- vim.opt.complete = false	-- specifies how Insert mode completion works for CTRL-N and CTRL-P
-- vim.opt.completeopt = false	-- whether to use a popup menu for Insert mode completion
-- vim.opt.pumheight = false	-- maximum height of the popup menu
-- vim.opt.pumwidth = false	-- minimum width of the popup menu
-- vim.opt.completefunc = false	-- user defined function for Insert mode completion
-- vim.opt.omnifunc = false	-- function for filetype-specific Insert mode completion
-- vim.opt.dictionary = false	-- list of dictionary files for keyword completion
-- vim.opt.thesaurus = false	-- list of thesaurus files for keyword completion
-- vim.opt.infercase = false	-- adjust case of a keyword completion match
-- vim.opt.digraph = false	-- enable entering digraphs with c1 <BS> c2
-- vim.opt.tildeop = false	-- the "~" command behaves like an operator
-- vim.opt.operatorfunc = false	-- function called for the "g@" operator
-- vim.opt.showmatch = false	-- when inserting a bracket, briefly jump to its match
-- vim.opt.matchtime = false	-- tenth of a second to show a match for 'showmatch'
vim.opt.matchpairs:append('<:>')	-- list of pairs that match for the "%" command
-- vim.opt.joinspaces = false	-- use two spaces after '.' when joining a line
-- vim.opt.nrformats = false	-- "alpha", "octal", "hex", "bin" and/or "unsigned"; number formats
