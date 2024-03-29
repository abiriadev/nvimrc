local basics = require 'lsp_basics'
local navic = require 'nvim-navic'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
return function(client, bufnr)
	basics.make_lsp_commands(client, bufnr)
	navic.attach(client, bufnr)

	local bufopts =
		{ noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set(
		'n',
		'<F2>',
		'<cmd>Lspsaga rename<CR>',
		{ silent = true }
	)
	vim.keymap.set(
		{ 'n', 'v' },
		'<A-CR>',
		'<cmd>Lspsaga code_action<CR>',
		{ silent = true }
	)
	vim.keymap.set(
		'n',
		'gh',
		'<cmd>Lspsaga lsp_finder<CR>',
		{ silent = true }
	)

	vim.keymap.set('n', '<leader>k', function()
		vim.diagnostic.goto_prev()
	end, { noremap = true, silent = true })
	vim.keymap.set('n', '<leader>j', function()
		vim.diagnostic.goto_next()
	end, { noremap = true, silent = true })

	vim.api.nvim_create_autocmd('CursorHold', {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = {
					'BufLeave',
					'CursorMoved',
					'InsertEnter',
					'FocusLost',
				},
				border = 'rounded',
				source = 'always',
				prefix = ' ',
				scope = 'cursor',
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})

	if client.name == 'omnisharp' then
		client.server_capabilities.semanticTokensProvider =
			{
				full = vim.empty_dict(),
				legend = {
					tokenModifiers = { 'static_symbol' },
					tokenTypes = {
						'comment',
						'excluded_code',
						'identifier',
						'keyword',
						'keyword_control',
						'number',
						'operator',
						'operator_overloaded',
						'preprocessor_keyword',
						'string',
						'whitespace',
						'text',
						'static_symbol',
						'preprocessor_text',
						'punctuation',
						'string_verbatim',
						'string_escape_character',
						'class_name',
						'delegate_name',
						'enum_name',
						'interface_name',
						'module_name',
						'struct_name',
						'type_parameter_name',
						'field_name',
						'enum_member_name',
						'constant_name',
						'local_name',
						'parameter_name',
						'method_name',
						'extension_method_name',
						'property_name',
						'event_name',
						'namespace_name',
						'label_name',
						'xml_doc_comment_attribute_name',
						'xml_doc_comment_attribute_quotes',
						'xml_doc_comment_attribute_value',
						'xml_doc_comment_cdata_section',
						'xml_doc_comment_comment',
						'xml_doc_comment_delimiter',
						'xml_doc_comment_entity_reference',
						'xml_doc_comment_name',
						'xml_doc_comment_processing_instruction',
						'xml_doc_comment_text',
						'xml_literal_attribute_name',
						'xml_literal_attribute_quotes',
						'xml_literal_attribute_value',
						'xml_literal_cdata_section',
						'xml_literal_comment',
						'xml_literal_delimiter',
						'xml_literal_embedded_expression',
						'xml_literal_entity_reference',
						'xml_literal_name',
						'xml_literal_processing_instruction',
						'xml_literal_text',
						'regex_comment',
						'regex_character_class',
						'regex_anchor',
						'regex_quantifier',
						'regex_grouping',
						'regex_alternation',
						'regex_text',
						'regex_self_escaped_character',
						'regex_other_escape',
					},
				},
				range = true,
			}
	end
end
