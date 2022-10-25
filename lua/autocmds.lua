-- vim.cmd([[
--   filetype plugin indent on
--   syntax on
--   colorscheme sobrio
-- ]])

vim.cmd([[
    colorscheme sobrio
]])

vim.cmd([[
    autocmd FileType typescript,typescriptreact,javascript,javascriptreact autocmd BufWritePre <buffer> OrganizeImports
]])
