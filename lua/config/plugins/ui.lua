return {
	{ -- Floating file navigation
		'stevearc/oil.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
		lazy = false,

		opts = {
			float = {
				-- Padding around the floating window
				padding = 10,
				max_width = 100,
				max_height = 0,
				border = 'rounded',
				win_options = {
					winblend = 0,
				},
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				override = function(conf)
					return conf
				end,
			},
			view_options = {
				is_always_hidden = function(name, bufnr)
					return vim.startswith(name, '__pycache__')
				end,
			}
		},
		keys = {
			{ '-', '<CMD>Oil --float<CR>', desc = 'Open parent directory.' },
		}
	},

	{ -- Telescope: Fuzzy file search
		'nvim-telescope/telescope.nvim', version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},

		keys = {
			{ '<C-p>', '<cmd>Telescope git_files<cr>', desc = 'Fuzzy search in git files.' },
			{ '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Fuzzy search for file names.' },
			{ '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Fuzzy search for file contents.' },
			{ '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Fuzzy search for buffers in Telescope.' },
			{ '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Fuzzy search in helptags with Telescope.' },
			{ '<leader>fs', '<cmd>Telescope grep_string<cr>', desc = 'Fuzzy search for word under the cursor with Telescope.' },
			{ '<leader>fr', '<cmd>Telescope resume<cr>', noremap = true, silent = true, desc = 'Resume last search in Telescope.' },
			-- { '<leader>ff', function () require('telescope.builtin').find_files({ hidden = true, no_ignore = true }) end, desc = 'Find all files' }
		}
	},

	{ -- List & highlights TODO, FIX BUG e etc in comments
		'folke/todo-comments.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {}
	},

	{ -- Improved status line
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			-- options = { theme = 'catppuccin' },
		},
	},

	{ -- Fancy notifications
		'rcarriga/nvim-notify',
		lazy = false,
		opts = {
			stages = 'fade',
			render = 'compact',
		},
		config = function (_, opts)
			local notify = require('notify')

			notify.setup(opts)
			vim.notify = notify
		end
	},

	{ -- Tabs
		'akinsho/bufferline.nvim',
		version = '*',
		event = 'VeryLazy',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				mode = 'tabs',
				-- diagnostics = 'nvim_lsp',
				separator_style = 'slant',
				always_show_bufferline = false,
				right_mouse_command = nil,
				hover = { enabled = true, delay = 200, reveal = {'close'} },
			}
		}
	},
}
