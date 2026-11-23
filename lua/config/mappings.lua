local map = vim.keymap.set

map('n', '<leader>/', vim.cmd.nohlsearch, { desc = 'Clear search highlight' })

map('n', '<C-s>', vim.cmd.write, { desc = 'Save file' })

-- buffer navigation
map('n', '<C-Tab>', vim.cmd.bnext, { desc = 'Next buffer' })
map('n', '<C-S-Tab>', vim.cmd.bprevious, { desc = 'Previews buffer' })
map('n', '<C-0>', function () vim.cmd.buffer('#') end, { desc = 'Jump to last buffer' })

-- tab navigation
map('n', '<C-Tab>', vim.cmd.bnext, { desc = 'Next tab' })
map('n', '<C-S-Tab>', vim.cmd.bprevious, { desc = 'Previews tab' })

-- Spelling
map('n', '<leader>en', ':setlocal spell! spelllang=en<CR>', { desc = 'Set spelling to English' })
map('n', '<leader>pt', ':setlocal spell! spelllang=pt<CR>', { desc = 'Set spelling to Portiguese' })

-- Keep search matches in the middle of the window.
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Don't use Ex mode, use Q for formatting
vim.keymap.set('n', 'Q', 'gqip', { desc = 'Format paragraph' })

-- Open/close folds with Space bar
map('n', '<Space>', 'za', { desc = 'Open/close fold' })

-- Splits navigation
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Go to the window on the left' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Go to the window below' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Go to the window on top' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Go to the window on the right' })

-- Ctrl-a and Ctrl-e works in Command line
map('c', '<C-a>', '<Home>', { desc = 'Jump to the start of the command' })
map('c', '<C-e>', '<End>', { desc = 'Jump to the end of the command' })

-- Centralize when navigating with C-u and C-d
map('n', '<C-u>', '<C-u>zz', { desc = 'Move up' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Move down' })

-- Bubble block up and down
map('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = 'Move block up' })
map('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = 'Move block down' })

-- Map esc to exit insert mode in terminal
map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit insert mode in terminal' })

-----------------------
-- Disabled mappings --
-----------------------

-- Don't move on *
-- map('n', '<silent> *', ':let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>')

-- Show current search in cwindow
-- map('n', '<leader>\', ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")

-- Map quickfix commands (:cnext and :cNext) to ]e and [e
-- nnoremap ]e :cnext<CR>
-- nnoremap [e :cNext<CR>

-- VIM hard mode
-- map('n', '<Bs>', '<nop>')
-- map({'v', 'n'}, '<Del>', '<nop>')
-- map({'i', 'n'}, '<F1>', '<nop>')
-- map({'i', 'n', 'v'}, '<up>', '<nop>')
-- map({'i', 'n', 'v'}, '<down>', '<nop>')
-- map({'i', 'n', 'v'}, '<left>', '<nop>')
-- map({'i', 'n', 'v'}, '<right>', '<nop>')
-- map({'i', 'n', 'v'}, '<PageUp>', '<nop>')
-- map({'i', 'n', 'v'}, '<PageDown>', '<nop>')
