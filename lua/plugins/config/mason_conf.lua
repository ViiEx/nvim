local options = {
	ensure_installed = {
		-- LSPs
		"lua-language-server",
		"angular-language-server",
		"css-lsp",
		"cssmodules-language-server",
		"emmet-ls",
		"html-lsp",
		"intelephense",
		"json-lsp",
		"phpactor",
		"tailwindcss-language-server",
		"typescript-language-server",
		"yaml-language-server",

		-- Formatters
		"black",
		"php-cs-fixer",
		"prettier",
		"stylua",
		"phpcbf",
		"shellcheck",
		"rustfmt",
	},

	PATH = "prepend",

	ui = {
		icons = {
			package_pending = " ",
			package_installed = "󰄳 ",
			package_uninstalled = " 󰚌",
		},

		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},

	max_concurrent_installers = 10,
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
	vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
end, {})

require("mason").setup(options)
