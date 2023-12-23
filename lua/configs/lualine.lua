return {
	options =	{
		theme = 'tokyonight',
		icons_enabled = true
	},
	sections = {
    lualine_y = {
      {
				function()
					local xmake = require("xmake.project_config").info
					if xmake.target.tg == "" then
						return ""
					end
					return xmake.target.tg .. "(" .. xmake.mode .. ")"
				end,
				cond = function()
					return vim.o.columns > 100
				end,
				on_click = function()
					require("xmake.project_config._menu").init() -- 添加点击后显示的ui
				end
			},
			"overseer"
    }
  }
}