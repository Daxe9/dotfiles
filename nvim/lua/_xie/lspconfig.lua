local nvim_lsp = require('lspconfig')
local servers = {
	'tsserver',
	'pyright',
	'volar',
	'clangd'
}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		autostart = true
	}
end 
