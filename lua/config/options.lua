local opt = vim.opt

-- Core
opt.ff = 'unix'                    -- Enforce then Unix File Format
opt.clipboard = 'unnamedplus'      -- Sincroniza o yank/paste com a área de transferência do SO
opt.undofile = true                -- Salva histórico de Undo em disco mesmo após fechar o arquivo
opt.swapfile = false               -- Disable backup and swapfile
opt.shiftround = true              -- Rounds indent to multiple of shiftwidth

-- Interface and numbering
opt.number = true                  -- Mostra o número da linha atual
opt.cursorline = true              -- Destaca a linha onde o cursor está
opt.signcolumn = 'yes'             -- Mantém a coluna lateral fixa para ícones de Git e LSP
opt.wrap = false                   -- Tells vim not to break lines that exceeds the 'textwidth'
opt.laststatus = 2                 -- Always shows the status line
opt.colorcolumn = '+1'             -- Highlight the textwidth+1 column. In python files commonly is the 80th column

-- Search and navigation
opt.ignorecase = true              -- Ignora maiúsculas/minúsculas na busca...
opt.smartcase = true               -- ...a menos que você digite uma letra maiúscula
opt.scrolloff = 4                  -- Mantém 4 linhas visíveis acima/abaixo do cursor ao rolar
opt.splitright = true              -- Abre splits verticais à direita
opt.splitbelow = true              -- Abre splits horizontais abaixo

-- Formatting
vim.opt.formatoptions:remove('o')  -- Remove appending of comment when press o or O
vim.opt.formatoptions:append('n')  -- Adds numbered lists formatting
vim.opt.formatoptions:append('1')  -- Don't break a line after a one-letter word
vim.opt.formatoptions:append('j')  -- Remove a comment leader when joining lines

-- Folding setup
-- vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Disable NETRW
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Fix .hurl filetype detection
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  command = 'setf hurl',
  pattern = { '*.hurl' },
})

-- fix typos
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('QW', 'wq', {})


-------------------------------------------------------------------------
-- TODO: Check if the following settings are still valid and necessery --
-------------------------------------------------------------------------

-- Automatically read a file that has changed on disk
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'CursorHoldI', 'FocusGained' }, {
--   command = 'if mode() != 'c' | checktime | endif',
--   pattern = { '*' },
-- })

-- Suffixes that get lower priority when doing tab completion for filenames.
-- These are files we are not likely to want to edit or read.
-- vim.cmd('set suffixes+=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc')
-- vim.cmd('set wildignore+=*.bak,~*,*.swp,*.o,*.info,*.aux,*.log,*.dvi,*.bbl,*.blg,*.brf,*.cb,*.ind,*.idx,*.ilg,*.inx,*.out,*.toc,*.pyc')

-- -- Exclude term:// buffers after closing their window
-- vim.api.nvim_create_autocmd('WinClosed', {
--   callback = function(args)
--     local winid = tonumber(args.match)
--     local bufnr = vim.fn.winbufnr(winid)
-- 
--     if vim.api.nvim_buf_is_valid(bufnr) then
--       local buftype = vim.api.nvim_buf_get_option(bufnr, 'buftype')
--       if buftype == 'terminal' then
--         vim.api.nvim_buf_delete(bufnr, { force = true })
--       end
--     end
--   end,
-- })
-- 
-- 
-- vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
--   pattern = { '*.jinja.html', '*.html.jinja', '*.jinja' },
--   command = 'set filetype=htmldjango',
-- })
