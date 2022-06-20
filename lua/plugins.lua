local utils = require("utils")
local fn = vim.fn

vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

local packer_repo = "https://github.com/wbthomason/packer.nvim"
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
	vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
	vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")
local util = require("packer.util")

require("packer").startup({
	function(use)
		use({ "wbthomason/packer.nvim", opt = true })
		-- Lsp and coding stuff
		use({ "williamboman/nvim-lsp-installer" })
		use({
			"neovim/nvim-lspconfig",
			after = "nvim-lsp-installer",
			module = "lspconfig",
			config = function()
				require("config.lsp_installer")
				require("config.lspconfig")
			end,
		})
		use({
			"rafamadriz/friendly-snippets",
			module = "cmp_nvim_lsp",
			event = "InsertEnter",
		})
		use({
			"hrsh7th/nvim-cmp",
			after = "friendly-snippets",
			config = function()
				require("config.cmp")
			end,
		})
		use({
			"L3MON4D3/LuaSnip",
			wants = "friendly-snippets",
			after = "nvim-cmp",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		})
		use({
			"saadparwaiz1/cmp_luasnip",
			after = "LuaSnip",
		})
		use({
			"hrsh7th/cmp-nvim-lua",
			after = "cmp_luasnip",
		})
		use({
			"hrsh7th/cmp-nvim-lsp",
			after = "cmp-nvim-lua",
		})
		use({
			"hrsh7th/cmp-buffer",
			after = "cmp-nvim-lsp",
		})
		use({
			"hrsh7th/cmp-path",
			after = "cmp-buffer",
		})

		use({
			"stevearc/aerial.nvim",
			module = "aerial",
			cmd = { "AerialToggle", "AerialOpen", "AerialInfo" },
			config = function()
				require("config.aerial")
			end,
		})

		use({ "ctrlpvim/ctrlp.vim" })
		use({ "preservim/nerdcommenter" })
		use({ "morhetz/gruvbox" })
		use({ "nvim-lua/plenary.nvim" })
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "MunifTanjim/nui.nvim" })
		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
			config = [[require('config.neo-tree')]],
		})
		use({ "kdheepak/lazygit.nvim" })
		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("alpha").setup(require("alpha.themes.startify").config)
			end,
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			event = "BufEnter",
			run = ":TSUpdate",
			config = [[require('config.treesitter')]],
		})
		use({
			"phaazon/hop.nvim",
			event = "VimEnter",
			config = function()
				vim.defer_fn(function()
					require("config.nvim_hop")
				end, 2000)
			end,
		})
		use({
			"kevinhwang91/nvim-hlslens",
			branch = "main",
			keys = { { "n", "*" }, { "n", "#" }, { "n", "n" }, { "n", "N" } },
			config = [[require('config.hlslens')]],
		})
		use({ "haya14busa/vim-asterisk", event = "VimEnter" })
		use({ "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" })
		use({ "nvim-lua/popup.nvim" })
		use({
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{
					"nvim-telescope/telescope-node-modules.nvim",
				},
				{ "nvim-telescope/telescope-media-files.nvim" },
				{ "nvim-telescope/telescope-project.nvim" },
			},
			config = function()
				require("config.telescope")
			end,
		})
		use({
			"AckslD/nvim-neoclip.lua",
			require = { { "nvim-telescope/telescope.nvim" } },
			config = function()
				require("neoclip").setup()
			end,
		})
		use({ "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" })
		use({ "mhinz/vim-signify", event = "BufEnter" })
		use({
			"nvim-lualine/lualine.nvim",
			event = "VimEnter",
			config = [[require('config.statusline')]],
		})
		use({ "akinsho/bufferline.nvim", event = "VimEnter", config = [[require('config.bufferline')]] })
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "VimEnter",
			config = [[require('config.indent-blankline')]],
		})
		use({ "itchyny/vim-highlighturl", event = "VimEnter" })
		use({
			"rcarriga/nvim-notify",
			event = "BufEnter",
			config = function()
				vim.defer_fn(function()
					require("config.nvim-notify")
				end, 2000)
			end,
		})
		use({ "tpope/vim-eunuch", cmd = { "Rename", "Delete" } })
		use({ "elzr/vim-json", ft = { "json", "markdown" } })
		use({ "chrisbra/unicode.vim", event = "VimEnter" })
		use({
			"karb94/neoscroll.nvim",
			event = "VimEnter",
			config = function()
				vim.defer_fn(function()
					require("config.neoscroll")
				end, 2000)
			end,
		})
		use({
			"folke/which-key.nvim",
			event = "VimEnter",
			config = function()
				vim.defer_fn(function()
					require("config.which-key")
				end, 2000)
			end,
		})
		use({ "jdhao/whitespace.nvim", event = "VimEnter" })
		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = { "BufRead", "BufNewFile" },
			config = [[require('config.null-ls')]],
			requires = { "nvim-lua/plenary.nvim" },
		})
		use({ "akinsho/toggleterm.nvim", tag = "v1.*", config = [[require('config.toggleterm')]] })
		use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

		use({
			"norcalli/nvim-colorizer.lua",
			event = { "BufRead", "BufNewFile" },
			config = function()
				require("config.colorizer")
			end,
		})
		use({ "machakann/vim-sandwich", event = "VimEnter" })
		use({ "jiangmiao/auto-pairs" })
		use({ "alvan/vim-closetag" })
		use({ "andymass/vim-matchup", event = "VimEnter" })
		use({ "gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]] })
		use({ "airblade/vim-rooter" })

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		max_jobs = 16,
		compile_path = util.join_paths(fn.stdpath("data"), "site", "lua", "packer_compiled.lua"),
	},
})

local status, _ = pcall(require, "packer_compiled")
if not status then
	vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end
