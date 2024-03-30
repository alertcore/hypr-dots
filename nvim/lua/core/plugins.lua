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
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"catppuccin/nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"nvim-lualine/lualine.nvim",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

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
