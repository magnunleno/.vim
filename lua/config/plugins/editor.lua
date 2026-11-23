return {
	{
	{ -- Help us deal with surrounding delimiters
	{ -- Help us to deal with surrounding delimiters
		"kylechui/nvim-surround",
		version = "^4.0.0",
		event = "VeryLazy",
		keys = {
			{ 's', 'S', mode = 'v', remap = true, desc = 'Surround plugin' }
		}
	},
}
