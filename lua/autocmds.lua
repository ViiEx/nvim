-- vim.cmd([[
--   filetype plugin indent on
--   syntax on
--   colorscheme sobrio
-- ]])

vim.cmd([[colorscheme mellow]])

vim.cmd(
	[[autocmd FileType typescript,typescriptreact,javascript,javascriptreact autocmd BufWritePre <buffer> OrganizeImports]]
)

vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
