local present, lspconfig = pcall(require, "lspconfig")

if not present then
	return
end

require("base46").load_highlight("lsp")
require("nvchad_ui.lsp")

local M = {}
local utils = require("core.utils")

M.on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	utils.load_mappings("lspconfig", { buffer = bufnr })

	if client.server_capabilities.signatureHelpProvider then
		require("nvchad_ui.signature").setup(client)
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

lspconfig.sumneko_lua.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})

lspconfig.intelephense.setup({
	on_attach = M.on_attach,
	capabilities = M.capabilities,
	settings = {
		intelephense = {
			stubs = {
				"bcmath",
				"bz2",
				"calendar",
				"Core",
				"curl",
				"zip",
				"zlib",
				"wordpress",
				"woocommerce",
				"acf-pro",
				"wordpress-globals",
				"wp-cli",
				"genesis",
				"polylang",
			},
			environment = {
				includePaths = "/home/your-user/.composer/vendor/php-stubs/", -- this line forces the composer path for the stubs in case inteliphense don't find it...
			},
			files = {
				maxSize = 5000000,
			},
		},
	},
})

local servers = { "html", "cssls", "emmet_ls", "clangd", "jsonls", "phpactor" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,
	})
end
