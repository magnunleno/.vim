return {
	{ -- Adds Git information in sign column
		'lewis6991/gitsigns.nvim',
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local map = function(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				map('n', ']h', gs.next_hunk, 'Next hunk')
				map('n', '[h', gs.prev_hunk, 'Preview hunk')
			end,
		},
	},

	{ -- Git integration
		'tpope/vim-fugitive',
	},
}
