require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.prettier,
        require('null-ls').builtins.formatting.lua_format,
        require("null-ls").builtins.diagnostics.eslint,
        require('null-ls').builtins.diagnostics.markdownlint,
        require('null-ls').builtins.diagnostics.stylint,
        require("null-ls").builtins.completion.spell,
        require('null-ls').builtins.completion.luasnip,
        require('null-ls').builtins.completion.vsnip,
    },
})
