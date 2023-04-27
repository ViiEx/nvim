local utils = require("core.utils")

require("globals")
require("options")
require("plugins")
require("autocmds")
require("core.colors.fallback")

utils.load_mappings("general", { buffer = bufnr })

vim.ui.select = require("lspactions").select
vim.ui.input = require("lspactions").input

vim.lsp.handlers["textDocument/codeAction"] = require("lspactions").codeaction
vim.lsp.handlers["textDocument/references"] = require("lspactions").references
vim.lsp.handlers["textDocument/definition"] = require("lspactions").definition
vim.lsp.handlers["textDocument/declaration"] = require("lspactions").declaration
vim.lsp.handlers["textDocument/implementation"] = require("lspactions").implementation
