local fs = require 'pathvar'
return {
  name = "file-build",
  builder = function(params)
    local file = fs.file()
		local fileNoExt = fs.fileNoExt()
		local cmd = {
		  c = {"gcc", "-Wall", file, "-o", fileNoExt, "-lm", "-msse3", params.more_args},
			cpp = {"g++", "-Wall", file, "-o", fileNoExt, "-lm", "-msse3", params.more_args}
		}
    return {
      cmd = cmd[vim.bo.filetype],
      components = {
				"on_result_diagnostics",
				"default"
			}
    }
  end,
  condition = {
    filetype = {"c", "cpp"}
  },
	params = {
		more_args = {
			type = "string",
			name = "More args",
			optional = true
		}
	}
}