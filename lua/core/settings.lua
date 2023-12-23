-- 提速
-- 关闭插件重复提供的功能
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}
for _, plugin in pairs(disabled_built_ins) do
   vim.g["loaded_" .. plugin] = false
end

vim.opt.lazyredraw=true
vim.opt.termguicolors=true

vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab=true

vim.opt.viminfofile='NONE'
vim.g.mapleader=','
vim.opt.guifont='Sarasa Term SC Nerd:h13'
vim.opt.number=true

-- 不备份
vim.opt.undofile=false
vim.opt.backup=false
vim.opt.writebackup=false

vim.opt.termencoding='utf-8'
vim.opt.fileencodings={
	'utf-8', 'latin1', 'gb2312',
	'big5','utf-16', 'utf32'
}

-- 终端
vim.opt.hidden=true
vim.api.nvim_create_autocmd({"TermOpen"}, {
	callback = function() vim.cmd[[setlocal modifiable]] end
})

-- 使用lua加载文件类型
vim.g.do_filetype_lua = true
vim.g.did_load_filetypes = false

vim.opt.shell='powershell'
vim.opt.shellcmdflag='-command'
vim.opt.shellquote=[["]]
vim.opt.shellxquote=''

require('pathvar')