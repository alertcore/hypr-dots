--for tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--set leader keymap
vim.g.mapleader = "\\"

--nerd font
vim.g.have_nerd_font = true

--set opts
vim.opt.number = true
vim.opt.relativenumber = true

--runtime commands

--bootstrap lazy.nvim
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

--load plugins
require("lazy").setup({
	"hrsh7th/nvim-cmp",
	"nvim-tree/nvim-tree.lua",
	"catppuccin/nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

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

	{
  		'nvimdev/dashboard-nvim',
  		event = 'VimEnter',
  		config = function()
    			require('dashboard').setup()
  		end,
  		dependencies = {
			'nvim-tree/nvim-web-devicons',
			}
	},

})


require('which-key').register {
['<leader>s'] = { name = 'Search', _ = 'which_key_ignore' },
['<leader>f'] = { name = 'File', _ = 'which_key_ignore' },
['<leader>sb'] = { name = 'Current Buffer', _ = 'which_key_ignore' },
['<leader>o'] = { name = 'Miscellaneous', _ = 'which_key_ignore' },
}

--additional plugin stuff
require("catppuccin").setup({
  transparent_background = true,
})

require("nvim-tree").setup()

vim.cmd.colorscheme "catppuccin-frappe"

require("mason").setup()

--keymap function
local function keymap(bind, func, desc)
	vim.keymap.set('n', bind, func, {desc = desc})
end

--use hjkl loser
keymap('<right>', '<cmd>echo "l"<CR>')
keymap('<left>', '<cmd>echo "h"<CR>')
keymap('<up>', '<cmd>echo "k"<CR>')
keymap('<down>', '<cmd>echo "j"<CR>')

--telescope keymaps
keymap("<leader>sf", "<cmd>Telescope find_files<CR>", "Search cwd for Files")
keymap("<leader>sbd", "<cmd>Telescope diagnostics<CR>", "Search Current Buffer for Diagnostics")
keymap("<leader>sr", "<cmd>Telescope resume<CR>", "Resume Previous Search")
keymap("<leader>sk", "<cmd>Telescope keymaps<CR>", "Search Keymap List")
keymap("<leader>sl", "<cmd>Telescope live_grep<CR>", "Live Grep in cwd")
keymap("<leader>sbl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Fuzzy Find in the Current Buffer")

--file keymaps
keymap("<leader>fs", "<cmd>:w<CR>", "Write Current Buffer")
keymap("<leader>fx", "<cmd>:wq<CR>", "Write-Quit Current Buffer")
keymap("<leader>fq", "<cmd>:q!<CR>", "Quit! nvim")

keymap("<leader>ot", "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree")

--package stuff
keymap("<leader>ol", "<cmd>:Lazy<CR>", "Lazy")
keymap("<leader>om", "<cmd>:Mason<CR>", "Mason")
