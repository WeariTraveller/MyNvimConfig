return {
	size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
	open_mapping = '<m-=>',
	start_in_insert = true,
	direction = "float",
	winbar = {enabled = true},
	close_on_exit = false
}