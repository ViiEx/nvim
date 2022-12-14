---------------------------------
-- Plugins
---------------------------------
local packer_bootstrap = require("bootstrap.packer_bootstrap")

local packer = require("packer")

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
		use({
			"L3MON4D3/LuaSnip",
			config = function()
				require("plugins.config.luasnip")
			end,
		})
		use("saadparwaiz1/cmp_luasnip")
		use({
			"rafamadriz/friendly-snippets",
			module = { "cmp", "cmp_nvim_lsp" },
			event = "InsertEnter",
		})
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
			run = ":TSUpdate",
			config = function()
				require("plugins.config.treesitter")
			end,
		})
		use({ "nvim-treesitter/nvim-treesitter-context" })
		-- use({ "nvim-treesitter/nvim-treesitter-angular" })
		-- Utilities
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("plugins.config.nvim-autopairs")
			end,
		})
		use({
			"windwp/nvim-ts-autotag",
			config = function()
				require("nvim-ts-autotag").setup()
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
			ft = "gitcommit",
			setup = function()
				require("core.utils").gitsigns()
			end,
			config = function()
				require("plugins.config.gitsigns_conf")
			end,
		})
		use({
			"numToStr/Comment.nvim",
			opt = false,
			config = function()
				require("plugins.config.comment")
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
		--use({
		--	"folke/noice.nvim",
		--	event = "VimEnter",
		--	config = function()
		--		require("plugins.config.noice")
		--	end,
		--	requires = {
		--		"MunifTanjim/nui.nvim",
		--		"rcarriga/nvim-notify",
		--	},
		--})
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("plugins.config.blankline")
			end,
		})

		-- Dependencies
		use("nvim-lua/plenary.nvim")
		use("kyazdani42/nvim-web-devicons")
		use("MunifTanjim/nui.nvim")
		use("nvim-lua/popup.nvim")
		-- File browser
		use({
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			config = function()
				require("plugins.config.telescope")
			end,
			setup = function()
				require("core.utils").load_mappings("telescope")
			end,
		})
		use("nvim-telescope/telescope-symbols.nvim")
		-- Interface
		--[[ use({
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup()
		end,
		}) ]]
		--[[ use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			config = function()
				require("plugins.config.neo-tree")
			end,
		}) ]]
		--[[ use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.config.lualine")
		end,
		}) ]]
		use({
			"NvChad/ui",
			opt = false,
			--after = "base46",
			config = function()
				local present, nvchad_ui = pcall(require, "nvchad_ui")

				if present then
					nvchad_ui.setup()
				end
			end,
		})
		use({
			"kyazdani42/nvim-tree.lua",
			ft = "alpha",
			cmd = { "NvimTreeToggle", "NvimTreeFocus" },
			config = function()
				require("plugins.config.nvimtree")
			end,
			setup = function()
				require("core.utils").load_mappings("nvimtree")
			end,
		})
		-- Color scheme
		use("elvessousa/sobrio")
		use("kvrohit/mellow.nvim")
		use({
			"NvChad/base46",
			config = function()
				local ok, base46 = pcall(require, "base46")

				if ok then
					base46.load_theme()
				end
			end,
		})

		use({
			"NvChad/extensions",
			module = { "telescope", "nvchad" },
		})

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
