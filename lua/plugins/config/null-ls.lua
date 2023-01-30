---------------------------------
-- Formatting
---------------------------------
local diagnostics = require("null-ls").builtins.diagnostics
local formatting = require("null-ls").builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
	debug = true,
	sources = {
		formatting.black,
		formatting.rustfmt,
		formatting.phpcsfixer,
		formatting.prettier,
		formatting.stylua,
        formatting.phpcbf,
		diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
	},
	on_attach = function(client, bufnr)
		if client.name == "tsserver" or client.name == "rust_analyzer" or client.name == "pyright" then
			client.resolved_capabilities.document_formatting = false
		end

		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				callback = function()
					--vim.lsp.buf.format({ bufnr = bufnr })
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
