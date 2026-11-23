local map = vim.keymap.set

local function run_hurl_selection(flag)
	local base_dir = vim.fn.expand("%:p:h")
	local tmpfile = vim.fn.tempname() .. ".hurl"
	vim.cmd('silent! normal! "vy')
	local content = vim.fn.getreg("v")
	vim.fn.writefile(vim.split(content, "\n"), tmpfile)

	vim.cmd("split | terminal hurl -k " .. flag .. " --file-root " .. base_dir .. " " .. tmpfile)

	vim.defer_fn(function()
		os.remove(tmpfile)
	end, 5000)
end

map("v", "<leader>rt", function() run_hurl_selection("--test") end, {
	desc = "Run selected Hurl block (test)", buffer = true
})

map("v", "<leader>rv", function() run_hurl_selection("--verbose") end, {
	desc = "Run selected Hurl block (verbose)", buffer = true
})

map('n', '<leader>rt', ':split | terminal hurl % -k --test<CR>', {
	buffer= true, noremap = true, silent = true, desc = "Run file in hurl (test)"
})
map('n', '<leader>rv', ':split | terminal hurl % -k --verbose<CR>', {
	buffer= true, noremap = true, silent = true, desc = "Run file in hurl (verbose)"
})
