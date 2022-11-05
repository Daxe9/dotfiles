local nvim_lsp = require('lspconfig')
local servers = {
	'tsserver',
	'pyright',
	'volar',
	'clangd',
	'html',
	'cssls'
}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		autostart = true
	}
end 

-- disable inline diagnostics
vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
