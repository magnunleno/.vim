return {
	{ -- Telescope: Fuzzy file search
		'nvim-telescope/telescope.nvim', version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},

		keys = {
			{ '<C-p>', '<cmd>Telescope git_files<cr>', desc = 'Fuzzi search in git files.' },
			{ '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Fuzzy search for file names.' },
			{ '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Fuzzy search for file contents.' },
			{ '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Fuzzy search for buffers in Telescope.' },
			{ '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Fuzzy search in helptags with Telescope.' },
			{ '<leader>fs', '<cmd>Telescope grep_string<cr>', desc = 'Fuzzy search for word under the cursor with Telescope.' },
			{ '<leader>fr', '<cmd>Telescope resume<cr>', noremap = true, silent = true, desc = 'Resume last search in Telescope.' },
			-- { '<leader>ff', function () require('telescope.builtin').find_files({ hidden = true, no_ignore = true }) end, desc = 'Find all files' }
		}
	},
}
