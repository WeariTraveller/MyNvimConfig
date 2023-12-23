local lspconfig = require('lspconfig')
local list = {
	"lua_ls",
  "bashls",
  "clangd"
}
local default_config = {
	root_dir = function() return vim.fn.getcwd() end
}
local handlers = {
	function(server_name)
		lspconfig[server_name].setup(default_config)
	end
}

for _, ele in pairs(list) do
	local status, config = pcall(require, "configs.lsp." .. ele)
	if status then
		config = vim.tbl_deep_extend("force", default_config, config)
		handlers[ele] = function()
			lspconfig[ele].setup(config)
		end
	end
end
require("mason-lspconfig").setup {
	ensure_installed = list,
	handlers = handlers
}