local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"git@github.com:folke/lazy.nvim",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = {
	git = {
		url_format = 'git@github.com:%s.git'
	},
	checker = {
		enabled = true,
		concurrency = nil,
		notify = false,
		frequency = 3600,
	}
}

require("lazy").setup({
	{  -- 配色
		'folke/tokyonight.nvim',
		config = function()
			vim.cmd[[colorscheme tokyonight]]
		end
	},
	{  -- 状态栏、buff栏
		'nvim-lualine/lualine.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',
		opts = require 'configs.lualine',
		event = 'BufEnter'
	},
	{
		'akinsho/bufferline.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',
		opts = require "configs.bufferline",
		event = 'BufEnter'
	},
	{  -- 终端
		'akinsho/toggleterm.nvim',
		opts = require "configs.toggleterm",
		event = 'VeryLazy'
	},
	{  -- 文件树
		'nvim-tree/nvim-tree.lua',
		event = 'VeryLazy',
		opts = {}
	},
	{  -- 搜索
		'nvim-telescope/telescope.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		event = 'VeryLazy'
	},
	{  -- LSP、DAP
		'williamboman/mason.nvim',
		build = ':MasonUpdate',
		opts = {}
	},
	{
		'williamboman/mason-lspconfig.nvim',
		event = 'VeryLazy',
		dependencies = 'neovim/nvim-lspconfig',
		config = function() require 'configs.lspconfig' end
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = 'mfussenegger/nvim-dap',
		event = 'VeryLazy',
		config = function() require 'configs.mason-dap' end
	},
	{
		'rcarriga/nvim-dap-ui',
		dependencies = 'mfussenegger/nvim-dap',
		event = 'VeryLazy',
		config = function() require 'configs.dapui' end
	},
	{
		'theHamsta/nvim-dap-virtual-text',
		event = 'VeryLazy',
		opts = require 'configs.dap-virtual-text'
	},
	{
		'jose-elias-alvarez/null-ls.nvim',
		event = 'VeryLazy'
	},
	{
		'glepnir/lspsaga.nvim',
		event = 'LspAttach',
		opts = {}
	},
	{  -- 补全
		'windwp/nvim-autopairs',
		event = 'VeryLazy',
		config = function() require "configs.autopairs" end
	},
	{
		'onsails/lspkind-nvim',
		event = 'VeryLazy',
		config = function() require "configs.lspkind" end,
	},
	{
		'hrsh7th/cmp-nvim-lsp',
		event = 'VeryLazy'
	},
	{
		'hrsh7th/cmp-buffer',
		event = 'VeryLazy'
	},
	{
		'hrsh7th/cmp-path',
		event = 'VeryLazy'
	},
	{
		'hrsh7th/cmp-cmdline',
		event = 'VeryLazy'
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = 'neovim/nvim-lspconfig',
		event = 'VeryLazy',
		config = function() require 'configs.cmp' end
	},
	{  -- LSP UI
		'dnlhc/glance.nvim',
		event = 'VeryLazy',
		config = function() require 'configs.glance' end
	},
	{  -- 代码片段
		'L3MON4D3/LuaSnip',
		event = 'VeryLazy'
	},
	{
		'saadparwaiz1/cmp_luasnip',
		event = 'VeryLazy',
		build = 'make install_jsregexp'
	},
	{
		'rafamadriz/friendly-snippets',
		event = 'VeryLazy'
	},
	{ -- 高亮、符号列表
		'nvim-treesitter/nvim-treesitter',
		event = 'VeryLazy',
		config = function() require 'configs.treesitter' end
	},
	{
		'HiPhish/rainbow-delimiters.nvim',
		event = 'VeryLazy',
		config = function() require 'configs.rainbow' end
	},
	{
		'stevearc/aerial.nvim',
		event = 'VeryLazy',
		opts = {on_attach = require 'core.keymaps'.aerial}
	},
	{  -- 缩进
		'lukas-reineke/indent-blankline.nvim',
		event = 'VeryLazy'
	},
	{  -- 文本对象
		'wellle/targets.vim',
		event = 'VeryLazy'
	},
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		event = 'VeryLazy'
	},
	{
		'tpope/vim-surround',
		event = 'VeryLazy'
	},
	{  -- 注释
		'numToStr/Comment.nvim',
		event = 'VeryLazy',
		opts = {}
	},
	{  -- 环境路径
		"utilyre/barbecue.nvim",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons"
		},
		opts = {
			theme = 'tokyonight',
			exclude_filetypes = {"NvimTree", "toggleterm"}
		},
		event = 'VeryLazy'
	},
	{ -- 任务
		'skywind3000/asynctasks.vim',
		event = 'VeryLazy',
		dependencies = 'skywind3000/asyncrun.vim',
		config = function() require 'configs.asynctasks' end,
		enabled = false
	},
	{
		'stevearc/overseer.nvim',
		event = 'VeryLazy',
		opts = require 'configs.overseer',
		enabled = true
	},
	{ -- 自动扩展窗口
		'anuvyklack/windows.nvim',
		event = 'VeryLazy',
		dependencies = {
			"anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
		}
	},
	{  -- 翻译
		'voldikss/vim-translator',
		event = 'VeryLazy'
	},
	{  -- 启动界面
		'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
	},
	{  -- xmake
    "Mythos-404/xmake.nvim",
    event = "BufReadPost xmake.lua",
		config = true,
    dependencies = {"MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim"}
	}
}, lazy_config)