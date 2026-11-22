return {
	{ -- Telescope: Fuzzy file search
		'nvim-telescope/telescope.nvim', version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},

		keys = {
			{ '<C-p>', '<cmd>Telescope git_files<cr>', desc = 'Busca arquivos no Git.' },
			{ '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Busca por nome de arquivos.' },
			{ '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Busca por conteúdo de arquivos.' },
			{ '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Busca por buffers.' },
			{ '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Busca por tags de ajuda.' },
			{ '<leader>fs', '<cmd>Telescope grep_string<cr>', desc = 'Busca pela palavra sobre o cursor.' },
			{ '<leader>fr', '<cmd>Telescope resume<cr>', noremap = true, silent = true, desc = 'Resume a última busca.' },
			-- { '<leader>ff', function () require('telescope.builtin').find_files({ hidden = true, no_ignore = true }) end, desc = 'Find all files' }
		}
	},
}
