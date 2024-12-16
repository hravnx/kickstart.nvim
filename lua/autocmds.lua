local numbergroup = vim.api.nvim_create_augroup('numbertoggle', { clear = true })

-- turn relative numbers on in normal mode
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave', 'WinEnter' }, {
  pattern = '*',
  group = numbergroup,
  callback = function()
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= 'i' then
      vim.opt.relativenumber = true
    end
  end,
})

-- turn relativenumber off in insret mode
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'CmdlineEnter', 'WinLeave' }, {
  pattern = '*',
  group = numbergroup,
  callback = function()
    if vim.o.nu then
      vim.opt.relativenumber = false
      vim.cmd 'redraw'
    end
  end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank { timeout = 50 }
  end,
})

-- Set cursor when exiting nvim - this fixes the problem that the cursor is always
-- set to block mode when leaving Neovim.
-- See https://gitlab.com/gnachman/iterm2/-/issues/8885 for more.
vim.api.nvim_create_autocmd('VimLeave', {
  desc = 'Set cursor when exiting Neovim',
  group = vim.api.nvim_create_augroup('vim-leave-set-cursor', { clear = true }),
  callback = function()
    -- `ver5-blinkon1` means vertical line cursor blinking slowly,
    -- see `:h guicursor` for more
    vim.opt.guicursor = 'a:ver5-blinkon1'
  end,
})
