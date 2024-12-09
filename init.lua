vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true
-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync with OS clipboard
vim.opt.clipboard = 'unnamedplus'

-- Ensure wrapped lines continue with same indent as start of line
vim.opt.breakindent = true

-- Save undo histore
vim.opt.undofile = true

-- Case-insensative searching UNLESS \C or one or more capital letters in search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- The gutter column to the left of numbers where warnings are shown
vim.opt.signcolumn = 'yes'

-- If nothing is typed for this time, the .swap file will be written to disc
vim.opt.updatetime = 750

-- Time to wait for mapped sequence to complete
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Configure how whitespace characters are displayed
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimum number of lines below and above the cursor
vim.opt.scrolloff = 10

--
-- Simplify navigating between spli panes
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
	  vim.highlight.on_yank()
  end,
})

require("config.lazy")
vim.cmd[[colorscheme tokyonight-night]]