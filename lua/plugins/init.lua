---------------------------------
-- Plugins
---------------------------------
require("bootstrap.lazy-manager")

require("lazy").setup({
	-- Completion
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lua",
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.config.cmp")
		end,
	},
	-- Motor de snippets
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins.config.luasnip")
		end,
	},
	"saadparwaiz1/cmp_luasnip",
	{
		"rafamadriz/friendly-snippets",
		module = { "cmp", "cmp_nvim_lsp" },
		event = "InsertEnter",
	},
	-- Formatting
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.config.null-ls")
		end,
	},
	-- Language server
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.config.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.config.mason_conf")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	"RishabhRD/lspactions",
	-- Syntax parser
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.config.treesitter")
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	-- use({ "nvim-treesitter/nvim-treesitter-angular" })
	-- Utilities
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.config.nvim-autopairs")
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		ft = "gitcommit",
		setup = function()
			require("core.utils").gitsigns()
		end,
		config = function()
			require("plugins.config.gitsigns_conf")
		end,
	},
	{
		"numToStr/Comment.nvim",
		opt = false,
		config = function()
			require("plugins.config.comment")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		tag = "v2.2.1",
		config = function()
			require("plugins.config.toggleterm")
		end,
	},
	{
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.config.alpha")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.config.blankline")
		end,
	},

	-- Dependencies
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons",
	"MunifTanjim/nui.nvim",
	"nvim-lua/popup.nvim",
	-- File browser
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require("plugins.config.telescope")
		end,
		setup = function()
			require("core.utils").load_mappings("telescope")
		end,
	},
	"nvim-telescope/telescope-symbols.nvim",
	-- Interface
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup()
		end,
	},
	{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			config = function()
				require("plugins.config.neo-tree")
			end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.config.lualine")
		end,
	},
	-- Color scheme
	"elvessousa/sobrio",
	"kvrohit/mellow.nvim",
})
