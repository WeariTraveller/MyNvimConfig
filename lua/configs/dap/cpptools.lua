return {
	adapters = {
			id = "cppdbg",
			type = 'executable',
			command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
	}
	configurations = {
		{
			name = "Launch file",
			type = "cppdbg",
			request = "launch",
			program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
	
			cwd = "${workspaceFolder}",
			stopAtEntry = true,
		},
	},
	filetypes = {'c', 'cpp'}
}