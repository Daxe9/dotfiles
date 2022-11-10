local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	path = "[Path]",
}
require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		['<C-e>'] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close()
		},
		['<CR>'] = cmp.mapping.confirm { select = true },
		["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
		     cmp.select_next_item()
		elseif luasnip.expandable() then
			luasnip.expand()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		elseif check_backspace() then
			fallback()
		else
			fallback()
		end
		end, {
		"i",
		  "s",
	    }),
	    ["<S-Tab>"] = cmp.mapping(function(fallback)
	      if cmp.visible() then
		    cmp.select_prev_item()
	      elseif luasnip.jumpable(-1) then
	     luasnip.jump(-1)
	      else
	        fallback()
	      end
	    end, {
	      "i",
		  "s",
		}),			
	}),
	sources = {
		{ name = "nvim_lsp"},
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	formatting = {
		fields = { "abbr", "menu" },
	    format = function(entry, vim_item)
			vim_item.menu = ({
			nvim_lsp = "[LSP]",
			luasnip = "[Snippet]",
			buffer = "[Buffer]",
			path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	window = {
		documentation = cmp.config.window.bordered()
	}
}
