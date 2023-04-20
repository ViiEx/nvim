local set = vim.opt
local g = vim.g

set.background = "dark"
set.clipboard = "unnamedplus"
set.completeopt = "noinsert,menuone,noselect"
set.cursorline = true
set.expandtab = true
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldmethod = "expr"
-- set.foldcolumn = "1"
set.foldlevel = 99
set.foldlevelstart = 99
set.foldenable = true
set.fillchars = [[eob: ]]
set.hidden = true
set.inccommand = "split"
set.mouse = "a"
set.number = true
set.numberwidth = 2
set.shiftwidth = 4
set.smarttab = true
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.tabstop = 4
set.softtabstop = 2
set.termguicolors = true
set.title = true
set.ttimeoutlen = 400
set.updatetime = 250
set.wildmenu = true
set.wrap = false
set.laststatus = 3
set.showmode = false
set.smartindent = true
set.ruler = false
set.ignorecase = true
set.smartcase = true
set.undofile = true
set.whichwrap:append("<>[]hl")
set.shortmess:append("sI")

g.mapleader = " "

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
})

-- disable some builtin vim plugins
local default_plugins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"syntax",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
}

for _, plugin in pairs(default_plugins) do
	g["loaded_" .. plugin] = 1
end

local default_providers = {
	"node",
	"perl",
	"python3",
	"ruby",
}

for _, provider in ipairs(default_providers) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end
