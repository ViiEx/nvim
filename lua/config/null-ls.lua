require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.lua_format,
		require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.diagnostics.markdownlint,
		require("null-ls").builtins.diagnostics.stylint,
		require("null-ls").builtins.completion.spell,
		require("null-ls").builtins.completion.luasnip,
		require("null-ls").builtins.completion.vsnip,
	},
	on_attach = function(client)
		-- NOTE: You can remove this on attach function to disable format on save
		if client.resolved_capabilities.document_formatting then
			vim.api.nvim_create_autocmd("BufWritePre", {
				desc = "Auto format before save",
				pattern = "<buffer>",
				callback = vim.lsp.buf.formatting_sync,
			})
		end
	end,
})
