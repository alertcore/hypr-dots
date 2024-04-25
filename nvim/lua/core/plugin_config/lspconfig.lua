local keys = require('core.keymaps')

--install servers
require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'lua_ls',
		'pyright',
		'jdtls',
		'gopls',
		'html',
	}
})

--autocomplete
local capabilities = require('cmp_nvim_lsp').default_capabilities()

--put on_attach here
local on_attach = function(_, _)
	keys.keymap('<leader>lr', vim.lsp.buf.rename, "Rename Symbol")
	keys.keymap('<leader>lc', vim.lsp.buf.code_action, "Code Action")
	keys.keymap('<leader>ld', vim.lsp.buf.definition, "Goto Symbol Definition")
	keys.keymap('<leader>lt', require('telescope.builtin').lsp_references, "Fuzzy Find Symbol References")
	keys.keymap('<leader>lk', vim.lsp.buf.hover, "Show Documentation")
end

--setup servers
require('lspconfig').lua_ls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}
require('lspconfig').pyright.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}
require('lspconfig').jdtls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}
require('lspconfig').gopls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}
require('lspconfig').html.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}
