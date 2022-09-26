-- require('wilder').setup()
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      -- sets the language to use, 'vim' and 'python' are supported
      language = 'python',
      -- 0 turns off fuzzy matching
      -- 1 turns on fuzzy matching
      -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
      fuzzy = 1,
    }),
    wilder.python_search_pipeline({
      -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
      pattern = wilder.python_fuzzy_pattern(),
      -- omit to get results in the order they appear in the buffer
      sorter = wilder.python_difflib_sorter(),
      -- can be set to 're2' for performance, requires pyre2 to be installed
      -- see :h wilder#python_search() for more details
      engine = 're',
    }),
    wilder.python_file_finder_pipeline({
      -- to use ripgrep : {'rg', '--files'}
      -- to use fd      : {'fd', '-tf'}
      file_command = {'find', '.', '-type', 'f', '-printf', '%P\n'}, 
      -- to use fd      : {'fd', '-td'}
      dir_command = {'find', '.', '-type', 'd', '-printf', '%P\n'},
      -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
      -- found at https://github.com/nixprime/cpsm
      filters = {'fuzzy_filter', 'difflib_sorter'},
    })
  ),
})


-- wilder.set_option('renderer', wilder.popupmenu_renderer(
--   -- highlighter = wilder.basic_highlighter(),
--   -- separator = ' · ',
--   -- left = {' ', wilder.wildmenu_spinner(), ' '},
--   -- right = {' ', wilder.wildmenu_index()},
--   wilder.popupmenu_border_theme({
--     highlights = {
--       border = 'Normal', -- highlight to use for the border
--     },
--     -- 'single', 'double', 'rounded' or 'solid'
--     -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
--     border = 'rounded',
--   })
-- ))

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_palette_theme({
    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
    border = 'rounded',
    max_height = '75%',      -- max height of the palette
    min_height = 0,          -- set to the same as 'max_height' for a fixed height window
    prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
    reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
  })
))
