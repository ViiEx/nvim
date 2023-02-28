local options = {
	ensure_installed = {
		"lua-language-server",
		"angular-language-server",
		"bash-language-server",
		"css-lsp",
		"cssmodules-language-server",
		"emmet-ls",
		"hmtl-lsp",
		"intelephense",
		"json-lsp",
		"marksman",
		"phpactor",
		"phpcbf",
		"prettier",
		"shellcheck",
		"stylua",
		"tailwindcss-language-server",
		"typescript-language-server",
		"vim-language-server",
	},

	PATH = "prepend",

	ui = {
		icons = {
			package_pending = " ",
			package_installed = " ",
			package_uninstalled = " ﮊ",
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
