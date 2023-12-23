return {
	options = {
		mode = "tabs",
		numbers = "ordinal",
		diagnostics = "nvim_lsp",
    -- 左侧让出 nvim-tree 的位置
    offsets = {
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "left"
		}
	}
}