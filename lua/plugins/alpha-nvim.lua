local logos = {
	{
		[[                                             ]],
		[[      ███████████           █████      ██]],
		[[     ███████████             █████ ]],
		[[     ████████████████ ███████████ ███   ███████]],
		[[    ████████████████ ████████████ █████ ██████████████]],
		[[   █████████████████████████████ █████ █████ ████ █████]],
		[[ ██████████████████████████████████ █████ █████ ████ █████]],
		[[██████  ███ █████████████████ ████ █████ █████ ████ ██████]],
	},
	{
		[[          .          .]],
		[[        ';;,.        ::']],
		[[      ,:::;,,        :ccc,]],
		[[     ,::c::,,,,.     :cccc,]],
		[[     ,cccc:;;;;;.    cllll,]],
		[[     ,cccc;.;;;;;,   cllll;]],
		[[     :cccc; .;;;;;;. coooo;]],
		[[     ;llll;   ,:::::'loooo;]],
		[[     ;llll:    ':::::loooo:]],
		[[     :oooo:     .::::llodd:]],
		[[     .;ooo:       ;cclooo:.]],
		[[       .;oc        'coo;.]],
		[[         .'         .,.]],
	},
	{
		'      /\\      ',
		'     /  \\     ',
		'    /\\   \\    ',
		'   / > ω <\\   ',
		'  /   __   \\  ',
		' / __|  |__-\\ ',
		"/_-''    ''-_\\",
	},
	{
		'                  -`                 ',
		'                 .o+`                ',
		'                `ooo/                ',
		'               `+oooo:               ',
		'              `+oooooo:              ',
		'              -+oooooo+:             ',
		'            `/:-:++oooo+:            ',
		'           `/++++/+++++++:           ',
		'          `/++++++++++++++:          ',
		'         `/+++ooooooooooooo/`        ',
		'        ./ooosssso++osssssso+`       ',
		'       .oossssso-````/ossssss+`      ',
		'      -osssssso.      :ssssssso.     ',
		'     :osssssss/        osssso+++.    ',
		'    /ossssssss/        +ssssooo/-    ',
		'  `/ossssso+/:-        -:/+osssso+-  ',
		' `+sso+:-`                 `.-/+oso: ',
		'`++:.                           `-/+/',
		'.`                                 `/',
	},
}

local a = require 'alpha'
local dashboard = require 'alpha.themes.dashboard'

math.randomseed(os.time())
dashboard.section.header.val = logos[math.random(#logos)]
-- dashboard.section.buttons.val = {
-- 	dashboard.button(
-- 		'e',
-- 		'  New file',
-- 		':ene <BAR> startinsert <CR>'
-- 	),
-- 	dashboard.button('q', '  Quit NVIM', ':qa<CR>'),
-- }
-- local handle = io.popen 'fortune'
-- local fortune = handle:read '*a'
-- handle:close()
-- dashboard.section.footer.val = fortune

-- dashboard.config.opts.noautocmd = true

-- vim.cmd [[autocmd User AlphaReady echo 'ready']]

-- alpha.setup(dashboard.config)
a.setup(dashboard.config)
