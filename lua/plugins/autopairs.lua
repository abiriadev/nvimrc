local autopairs = require 'nvim-autopairs'
local Rule = require 'nvim-autopairs.rule'
local cond = require 'nvim-autopairs.conds'

autopairs.setup()

-- autopairs.add_rules {
-- 	Rule(' ', ' '):with_pair(function(opts)
-- 		local pair = opts.line:sub(opts.col - 1, opts.col)
-- 		return vim.tbl_contains({ '()', '[]', '{}' }, pair)
-- 	end),
-- 	Rule('( ', ' )')
-- 		:with_pair(function()
-- 			return false
-- 		end)
-- 		:with_move(function(opts)
-- 			return opts.prev_char:match '.%)' ~= nil
-- 		end)
-- 		:use_key ')',
-- 	Rule('{ ', ' }')
-- 		:with_pair(function()
-- 			return false
-- 		end)
-- 		:with_move(function(opts)
-- 			return opts.prev_char:match '.%}' ~= nil
-- 		end)
-- 		:use_key '}',
-- 	Rule('[ ', ' ]')
-- 		:with_pair(function()
-- 			return false
-- 		end)
-- 		:with_move(function(opts)
-- 			return opts.prev_char:match '.%]' ~= nil
-- 		end)
-- 		:use_key ']',
-- }

autopairs.add_rule(
	Rule('<', '>', '-html'):with_cr(cond.done):with_move(cond.done)
)

autopairs.add_rule(
	Rule('=>$', ' {}', { 'typescript', 'typescriptreact', 'javascript' })
		:use_regex(true)
		:set_end_pair_length(1)
)
