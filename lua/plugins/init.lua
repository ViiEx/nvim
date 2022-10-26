---------------------------------
-- Plugins
---------------------------------
local packer = require("packer")

local packer_bootstrap = require("bootstrap.packer")

-- Include packer.nvim
vim.cmd([[packadd packer.nvim]])

packer.startup({
	function(use)
		-- Plugin manager
		use("wbthomason/packer.nvim")
		-- Completion
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-cmdline")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-path")
		use({
			"hrsh7th/nvim-cmp",
			config = function()
				require("plugins.config.cmp")
			end,
		})
		-- Motor de snippets
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")
		-- Formatting
		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("plugins.config.null-ls")
			end,
		})
		-- Language server
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("plugins.config.lspconfig")
			end,
		})
		use({
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		})
		use({
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("mason-lspconfig").setup()
			end,
		})
		use("RishabhRD/lspactions")
		-- Syntax parser
		use({
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("plugins.config.treesitter")
			end,
		})
		use("nvim-treesitter/nvim-treesitter-context")
		-- Utilities
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("plugins.config.nvim-autopairs")
			end,
		})
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		})
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup()
			end,
		})
		use({
			"numToStr/Comment.nvim",
			setup = function()
				require("core.utils").load_mappings("comment")
			end,
		})
		use({
			"akinsho/toggleterm.nvim",
			tag = "*",
			config = function()
				require("plugins.config.toggleterm")
			end,
		})
		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("plugins.config.alpha")
			end,
		})
		use({
			"folke/noice.nvim",
			event = "VimEnter",
			config = function()
				require("plugins.config.noice")
			end,
			requires = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
		})

		-- Dependencies
		use("nvim-lua/plenary.nvim")
		use("kyazdani42/nvim-web-devicons")
		use("MunifTanjim/nui.nvim")
		use("nvim-lua/popup.nvim")
		-- File browser
		use("nvim-telescope/telescope.nvim")
		use("nvim-telescope/telescope-symbols.nvim")
		-- Interface
		use({
			"akinsho/bufferline.nvim",
			config = function()
				require("bufferline").setup()
			end,
		})
		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			config = function()
				require("plugins.config.neo-tree")
			end,
		})
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("plugins.config.lualine")
			end,
		})
		-- Color scheme
		use("elvessousa/sobrio")
		use("kvrohit/mellow.nvim")

		if packer_bootstrap then
			packer.sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
