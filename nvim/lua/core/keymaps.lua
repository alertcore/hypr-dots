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
keymap("<leader>sbd", "<cmd>Telescope diagnostics<CR>", "Search Current Workspace for Diagnostics")
keymap("<leader>sr", "<cmd>Telescope resume<CR>", "Resume Previous Search")
keymap("<leader>sk", "<cmd>Telescope keymaps<CR>", "Search Keymap List")
keymap("<leader>sbl", "<cmd>Telescope live_grep<CR>", "Live Grep in Current Workspace")
keymap("<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Fuzzy Find in the Current Buffer")

--file keymaps
keymap("<leader>fs", "<cmd>:w<CR>", "Write Current Buffer")
keymap("<leader>fx", "<cmd>:wq<CR>", "Write-Quit Current Buffer")
keymap("<leader>fq", "<cmd>:q!<CR>", "Quit!")

keymap("<leader>ot", "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree")

--package stuff
keymap("<leader>ol", "<cmd>:Lazy<CR>", "Lazy")
keymap("<leader>om", "<cmd>:Mason<CR>", "Mason")

--lsp binds in lspconfig.lua
