local km = vim.keymap

--  See `:help set.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
km.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
km.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- CMD-s is save in normal and insert modes
km.set({ 'n', 'i' }, '<D-s>', '<cmd>w<CR>')

-- execute lua code
km.set('n', '<leader><leader>x', '<cmd>source %<CR>') -- current buffer
km.set('n', '<leader>x', ':.lua<CR>') -- current line in normal mode
km.set('v', '<leader>x', ':lua<CR>') -- current line in visual mode

--
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
km.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
km.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
km.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
km.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
km.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
