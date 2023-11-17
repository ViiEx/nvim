---------------------------------
-- Completion
---------------------------------
local present, cmp = pcall(require, "cmp")

if not present then
	return
end

local cmp_ui = {
	icons = true,
	lspkind_text = true,
	style = "default", -- default/flat_light/flat_dark/atom/atom_colored
	border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
	selected_item_bg = "colored", -- colored / simple
}

vim.o.completeopt = "menu,menuone,noselect"

local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

local cmp_window = require("cmp.utils.window")

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
	local info = self:info_()
	info.scrollable = false
	return info
end

local options = {
	window = {
		completion = {
			side_padding = 0,
			winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
			scrollbar = false,
			border("CmpBorder"),
		},
		-- completion = {
		-- 	border = border("CmpBorder"),
		-- 	winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
		-- 	scrollbar = "║",
		-- },
		documentation = {
			border = border("CmpDocBorder"),
			winhighlight = "Normal:CmpDoc",
		},
		-- documentation = {
		-- 	border = border("CmpDocBorder"),
		-- 	scrollbar = "║",
		-- },
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(_, vim_item)
			local icons = require("core.icons").lspkind
			local icon = (cmp_ui.icons and icons[vim_item.kind]) or ""

			icon = " " .. icon .. " "
			vim_item.menu = cmp_ui.lspkind_text and "   (" .. vim_item.kind .. ")" or ""
			vim_item.kind = icon
			return vim_item
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp_document_symbol" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "emoji" },
		{ name = "nerdfont" },
		{ name = "greek" },
		{ name = "path" },
	},
}

cmp.setup(options)
