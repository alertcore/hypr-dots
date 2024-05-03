--set leader keymap
vim.g.mapleader = "\\"

--nerd font
vim.g.have_nerd_font = true

--set opts
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true

--notify
vim.notify = require('notify')
