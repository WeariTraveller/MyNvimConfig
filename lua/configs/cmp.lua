local cmp = require"cmp"
local lspkind = require"lspkind"

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	
	-- 补全来源
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	  { name = "nvim_lsp_document_symbol" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua" },
		{ name = "treesitter" },
		{ name = 'luasnip' },
	}, { { name = "buffer" }, { name = "path" } }),

	mapping = require('core.keymaps').cmp(cmp),
	-- 用lspkind显示图标
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",

			maxwidth = 50, --最多50字
			-- 这个函数将在lspkind做任何实际修改前调用，这样你就可以定制更多控件
			-- (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
				return vim_item
			end,
		}),
	},
})

-- 命令、查找模式启用补全
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- 自动补写左括号
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))