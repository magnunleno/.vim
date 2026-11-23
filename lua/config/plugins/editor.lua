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

	{ -- Automatically closes HTML tags and helps changing tags
		'windwp/nvim-ts-autotag',
		event = 'InsertEnter',
		opts = {
			opts = { enable_close = true, enable_rename = true, enable_close_on_slash = true }
		}
	},

	{ -- Toggles comments
		'numToStr/Comment.nvim',
		event = 'VeryLazy',
		opts = {}
	},
}
