---------------------------------
-- Plugins
---------------------------------
require("bootstrap.lazy-manager")

local opts = {
	dev = {
		path = "~/Documents/nvim-plugs",
	},
}

require("lazy").setup({
	-- START: UI
	{
		"lewis6991/gitsigns.nvim",
		ft = "gitcommit",
		init = function()
			-- load gitsigns only when a git file is opened
			vim.api.nvim_create_autocmd({ "BufRead" }, {
				group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
				callback = function()
					vim.fn.system("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse")
					if vim.v.shell_error == 0 then
						vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
						vim.schedule(function()
							require("lazy").load({ plugins = "gitsigns.nvim" })
						end)
					end
				end,
			})
		end,
		config = function()
			require("plugins.config.gitsigns_conf")
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("plugins.config.alpha")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.config.toggleterm")
		end,
	},
	"MunifTanjim/nui.nvim",
	"nvim-lua/popup.nvim",
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for v0.4.0+
			"kyazdani42/nvim-web-devicons", -- If you want devicons
		},
		config = function()
			require("plugins.config.cokeline_conf")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		config = function()
			require("plugins.config.neo-tree")
		end,
	},
	{
		"yamatsum/nvim-cursorline",
		config = function()
			require("plugins.config.cursorline")
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		config = function()
			require("plugins.config.window-picker")
		end,
	},
	"itchyny/vim-highlighturl",
	"tyru/open-browser.vim",
	"sindrets/diffview.nvim",
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("plugins.config.hlslens_conf")
		end,
	},
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("plugins.config.mini_conf")
			require("core.utils").load_mappings("mini")
		end,
	},
	-- Breadcrumb plugin
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		config = function()
			local status_ok, dropbar = pcall(require, "dropbar")

			if not status_ok then
				return
			end

			dropbar.setup()
		end,
	},
	{
		"Wansmer/symbol-usage.nvim",
		event = "BufReadPre",
		config = function()
			require("plugins.config.symbol-usage_conf")
		end,
	},
	-- END: UI

	-- START: LSP
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
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("plugins.config.lspsaga_conf")
			vim.cmd([[autocmd! CursorHold * Lspsaga show_line_diagnostics ++unfocus]])
		end,
	},
	"RishabhRD/lspactions",
	{
		"stevearc/aerial.nvim",
		config = function()
			require("plugins.config.aerial_conf")
		end,
	},
	"folke/neodev.nvim",
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require("plugins.config.fidget_conf")
		end,
	},
	-- END: LSP

	-- START: Completion
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.config.cmp")
		end,
	},
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-emoji",
	"chrisgrieser/cmp-nerdfont",
	"max397574/cmp-greek",
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins.config.luasnip")
		end,
	},
	"saadparwaiz1/cmp_luasnip",
	"lukas-reineke/cmp-under-comparator",
	{
		"rafamadriz/friendly-snippets",
		module = { "cmp", "cmp_nvim_lsp" },
		event = "InsertEnter",
	},
	"hrsh7th/cmp-nvim-lsp-document-symbol",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	-- END: Completion

	-- START: Formatting
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.config.null-ls")
		end,
	},
	-- END: Formatting

	-- START: Dev Plugins
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.config.treesitter")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-angular",
	},
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
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.config.comment")
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"danymat/neogen",
		config = function()
			require("plugins.config.neogen_conf")
		end,
	},
	{ "github/copilot.vim" },
	{
		"rbong/vim-flog",
		dependencies = {
			"tpope/vim-fugitive",
		},
	},
	-- END: Dev Plugins

	-- START: Telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		init = function()
			require("core.utils").load_mappings("telescope")
		end,
		config = function()
			require("plugins.config.telescope")
		end,
	},
	"nvim-telescope/telescope-symbols.nvim",
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").load_extension("ui-select")
		end,
		event = "LspAttach",
	},
	{
		"dharmx/telescope-media.nvim",
		config = function()
			require("telescope").load_extension("media")
		end,
		keys = { "<leader>i" },
		dev = true,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	},
	{
		"danielvolchek/tailiscope.nvim",
	},
	-- END: Telescope

	-- START: Utility
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons",
	"matze/vim-move",
	{
		"folke/todo-comments.nvim",
		config = function()
			require("plugins.config.todo")
		end,
	},
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.config.neorg_conf")
			require("core.utils").load_mappings("norg")
		end,
	},
	-- END: Utility

	-- START: Colotscheme
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("plugins.config.kanagawa_conf")
			vim.cmd("colorscheme kanagawa")
		end,
	},
	-- END: Colorscheme
}, opts)
