local maps = vim.keymap.set
local getmap = vim.api.nvim_get_keymap
local delmap = vim.keymap.del
local opt = {noremap = true, silent = true}
local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, opt)
end
local function diskey(mode, lhs)
	vim.keymap.set(mode, lhs, "<nop>", opt)
end

-- Window：分屏
map("n", "sv", "<cmd>vsp<CR>")
map("n", "sh", "<cmd>sp<CR>")
-- 关闭当前
map("n", "sc", "<C-w>c")
-- 关闭其它
map("n", "so", "<C-w>o")
-- 切换
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

-- 调整大小：左右
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")
map("n", "s,", "<cmd>vertical resize -20<CR>")
map("n", "s.", "<cmd>vertical resize +20<CR>")
-- 上下
map("n", "sj", "<cmd>resize +10<CR>")
map("n", "sk", "<cmd>resize -10<CR>")
map("n", "<C-Down>", "<cmd>resize +2<CR>")
map("n", "<C-Up>", "<cmd>resize -2<CR>")
-- 重新分配
map("n", "s=", "<C-w>=")

-- 选择缩进
map("v", "<", "<gv")
map("v", ">", ">gv")

-- 保存
map({"n", "i", "v"}, "<C-s>", "<cmd>w<CR>")

-- 退出
map("n", "<A-q>", "<cmd>qa<cr>")
map("n", "<A-Q>", "<cmd>qa!<cr>")
map("n", "<A-c>", "<cmd>close<cr>")
map("n", "<A-C>", "<cmd>close<cr>")

-- 复制粘贴
map("v", "<A-y>", '"+y')
map("n", "<A-p>", '"+p')

-- 终端
map("t", "<A-Q>", [[<C-\><C-N>]])
map("t", "<A-C>", [[<C-\><C-O>]])
map("t", "<A-W>", [[<C-\><C-O><C-W>]])

-- bufferline
map("n", "<A-b>", "<cmd>BufferLineCyclePrev<CR>")
map("n", "<A-f>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<A-d>", "<cmd>bdelete!<CR>")
map("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>")
map("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>")
map("n", "<leader>bj", "<cmd>BufferLineMoveNext<CR>")
map("n", "<leader>bk", "<cmd>BufferLineMovePrev<CR>")
map("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>")

-- Telescope
map("n", "<C-g>", "<cmd>Telescope find_files<CR>")
-- 工作区搜索
map("n", "<C-r>", "<cmd>Telescope live_grep<CR>")
-- 列诊断
map("n", "<leader>wd", "<cmd>Telescope diagnostics<CR>")
-- 撤销
map("n", "<leader>u", "<cmd>Telescope undo<cr>")

-- translator
map({"n", "v"}, "<leader>tl", "<cmd>TranslateW<CR>")

-- nvim-tree
map("n", "<A-t>", "<cmd>NvimTreeToggle<CR>")

-- autopairs：单个括号
for _,punct in pairs {"(", ")", "[", "]", "{", "}"} do
	map("i", "<A-" .. punct .. ">", punct)
end

-- OverseerRuns
map("n", "<F1>", "<cmd>OverseerRun file-build<cr>")
map("n", "<F2>", "<cmd>OverseerRun file-run<cr>")
map("n", "<F3>", "<cmd>OverseerRun makefile-update<cr>")
map("n", "<F4>", "<cmd>OverseerRun project-build<cr>")
map("n", "<F5>", "<cmd>OverseerRun project-test<cr>")
map("n", "<F6>", "<cmd>OverseerRun project-run<cr>")
-- dap
map({"i", "n", "v"}, "<F7>", "<cmd>lua require'dap'.continue()<CR>")
map({"i", "n", "v"}, "<F8>", "<cmd>lua require'dap'.step_over()<CR>")
map({"i", "n", "v"}, "<F9>", "<cmd>lua require'dap'.step_into()<CR>")
map({"i", "n", "v"}, "<F10>", "<cmd>lua require'dap'.step_over()<CR>")
map({"i", "n", "v"}, "<F11>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")

-- lspsaga
-- 跳转到声明
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
-- 跳转到定义
map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>")
-- 显示注释文档
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
-- 跳转到实现
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
-- 跳转到引用位置
map("n", "gr", "<cmd>Lspsaga rename<CR>")
-- 以浮窗形式显示错误
map("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
map("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>")

--aerial
map('n', '<leader>a', '<cmd>AerialToggle!<CR>')

--windows.nvim
map('n', '<C-w>z', '<cmd>WindowsMaximize<cr>')
map('n', '<C-w>_', '<cmd>WindowsMaximizeVertically<cr>')
map('n', '<C-w>|', '<cmd>WindowsMaximizeHorizontally<cr>')
map('n', '<C-w>=', '<cmd>WindowsEqualize<cr>')

local M = {
	cmp = function(cmp)
		local luasnip = require"luasnip"
		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end
		
		return {
			-- 出现补全
			["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			-- 取消补全
			["<A-,>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			-- 上一个
			["<C-k>"] = cmp.mapping.select_prev_item(),
			-- 下一个
			["<C-j>"] = cmp.mapping.select_next_item(),
			-- 确认
			["<CR>"] = cmp.mapping.confirm({
				select = true,
				behavior = cmp.ConfirmBehavior.Replace,
			}),
			-- 上下翻页
			["<C-p>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-n>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			
			-- snippet
			-- 下一个参数
			["<C-h>"] = cmp.mapping(function()
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				end
			end, { "i", "s" }),
			-- 上一个参数
			["<C-l>"] = cmp.mapping(function()
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				end
			end, { "i", "s" }),
			-- 更改选择节点
			["<C-e>"] = cmp.mapping(function()
				if luasnip.choice_active() then
					luasnip.change_choice(1)
				end
			end, { "i", "s" }),
	
			-- 多功能Tab
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback() -- 回调函数返回被映射的键，此处即Tab
				end
			end, { "i", "s" }),
	
			["<S-Tab>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				end
			end, { "i", "s" })
		}
	end,
	aerial = function(bufnr)
    map('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    map('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end,
	ufo = function()
		map('n', 'zR', require('ufo').openAllFolds)
    map('n', 'zM', require('ufo').closeAllFolds)
	end
}

return M