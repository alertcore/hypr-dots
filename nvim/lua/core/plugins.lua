local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"hrsh7th/nvim-cmp",
	"nvim-tree/nvim-tree.lua",
	"catppuccin/nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"nvim-lualine/lualine.nvim",

	{
    		'nvim-telescope/telescope.nvim',
    		event = 'VimEnter',
    		branch = '0.1.x',
    		dependencies = {
      		'nvim-lua/plenary.nvim',
			}
	},

	{
    		'folke/which-key.nvim',
    		event = 'VimEnter', 
		config = function()
			require('which-key').setup()
		end
	},
})
