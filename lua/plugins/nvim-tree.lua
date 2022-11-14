-- vim.g.loaded = 1
-- vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup()
-- {
-- sync_root_with_cwd = true,
-- respect_buf_cwd = true,
-- update_focused_file = {
-- 	enable = true,
-- 	update_root = true,
-- },
-- sort_by = 'case_sensitive',
-- view = {
-- 	adaptive_size = true,
-- 	mappings = {
-- 		list = {
-- 			{ key = 'u', action = 'dir_up' },
-- 		},
-- 	},
-- },
-- renderer = {
-- 	group_empty = true,
-- },
-- filters = {
-- 	dotfiles = true,
-- },
-- }
local lib = require 'nvim-tree.lib'

local git_add = function()
	local node = lib.get_node_at_cursor()
	local gs = node.git_status

	-- If the file is untracked, unstaged or partially staged, we stage it
	if
		gs == '??'
		or gs == 'MM'
		or gs == 'AM'
		or gs == ' M'
	then
		vim.cmd('silent !git add ' .. node.absolute_path)

	-- If the file is staged, we unstage
	elseif gs == 'M ' or gs == 'A ' then
		vim.cmd(
			'silent !git restore --staged '
				.. node.absolute_path
		)
	end

	lib.refresh_tree()
end

require('nvim-tree').setup {
	view = {
		mappings = {
			list = {
				{
					key = 'ga',
					action = 'git_add',
					action_cb = git_add,
				},
			},
		},
	},
}
