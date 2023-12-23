require'nvim-treesitter.configs'.setup {
	highlight = {
    enable = true,
  },
	ensure_installed = {
		"c",
		"cpp",
		"lua",
		"vim"
	},
	incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  }
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 即使超过99也不会折叠
vim.wo.foldlevel = 99