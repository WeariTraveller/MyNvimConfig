local fs = require 'pathvar'
return {
  name = "file-run",
  builder = function()
    local file = fs.file()
		local fileNoExt = fs.fileNoExt()
		local cmd = {
		  c = fileNoExt,
			cpp = fileNoExt
		}
    return {
      cmd = cmd[vim.bo.filetype],
			components = {"default"}
    }
  end,
  condition = {
    filetype = {"c", "cpp"}
  },
	params = {
		more_args = {
			type = "string",
			optional = true
		}
	}
}