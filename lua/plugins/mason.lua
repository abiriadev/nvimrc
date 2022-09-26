require('mason').setup {
	ui = {
		icons = {
			package_installed = '✓',
			package_pending = '➜',
			-- use default
			-- package_uninstalled = "✗"
		},
		border = 'solid',
	},
}
