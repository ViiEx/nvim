vim.cmd(
	[[autocmd FileType typescript,typescriptreact,javascript,javascriptreact autocmd BufWritePre <buffer> OrganizeImports]]
)

-- vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua require'lspsaga.diagnostic'.show_line_diagnostics()]]
