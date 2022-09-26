-- Utilities for creating configurations
local formatter = require 'formatter'
local util = require 'formatter.util'
local defaults = require 'formatter.defaults'

local formatterConfig = {}

formatterConfig.lua = {
	require('formatter.filetypes.lua').stylua,
}

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
local commonFT = {
	'css',
	'scss',
	'html',
	'java',
	'javascript',
	'javascriptreact',
	'typescript',
	'typescriptreact',
	'markdown',
	'markdown.mdx',
	'json',
	'xml',
	'svg',
	'svelte',
}

for _, ft in ipairs(commonFT) do
	formatterConfig[ft] = { defaults.prettierd }
end

formatterConfig['yaml'] = {
	function(parser)
		if not parser then
			return {
				exe = 'prettier',
				args = {
					'--tab-width',
					'2',
					'--stdin-filepath',
					util.escape_path(
						util.get_current_buffer_file_path()
					),
				},
				stdin = true,
				try_node_modules = true,
			}
		end

		return {
			exe = 'prettier',
			args = {
				'--tab-width',
				'2',
				'--stdin-filepath',
				util.escape_path(
					util.get_current_buffer_file_path()
				),
				'--parser',
				parser,
			},
			stdin = true,
			try_node_modules = true,
		}
	end,
}

formatterConfig.rust = {
	require('formatter.filetypes.rust').rustfmt,
}

formatterConfig.c = {
	function()
		return {
			exe = 'clang-format',
			args = {
				'-assume-filename',
				-- '-style=Google',
				util.escape_path(
					util.get_current_buffer_file_name()
				),
			},
			stdin = true,
			try_node_modules = true,
		}
	end,
}

formatterConfig['prisma'] = {
	function()
		return {
			exe = 'npx',
			args = {
				'prisma',
				'format',
				'--schema',
				util.escape_path(
					util.get_current_buffer_file_path()
				),
			},
		}
	end,
}
-- formatterConfig.c = {
-- 	require('formatter.filetypes.clangformat').stylua,
-- }

require('formatter').setup {
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = formatterConfig,
}
