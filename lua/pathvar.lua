local M = {}
local settings = {
	rootMarks = {'.git', '.svn', '.root', '.project', '.hg'}
}

M.file = function()
	return vim.fn.expand("%:p")
end

M.fileNoExt = function()
	return vim.fn.expand("%:p:r")
end

M.projectRoot = function(file)
  for dir in vim.fs.parents(file) do
		for _, mark in pairs(settings.rootMarks) do
			if vim.fn.empty(vim.fn.glob(dir .. "/" .. mark)) == 0 then
				return dir
			end
		end
  end
	return vim.fn.expand("%:p:h")
end

vim.api.nvim_create_user_command("Root", function(opts)
	vim.cmd[opts.fargs[1]](M.projectRoot(opts.fargs[2] or vim.fn.expand("%:p")))
end, {nargs = '+'})
vim.api.nvim_create_autocmd("DirChanged", {
	pattern = "window",
	callback = function(ev)
		if vim.api.nvim_buf_get_option(ev.buf, "filetype") ~= "NvimTree" then
			return
		end
		vim.cmd.cd(ev.file)
	end
})

M.setup = function(opts)
	if not opts then
		return
	end
	settings = vim.tbl_deep_extend("force", settings, opts)
end

return M