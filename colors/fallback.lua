local function HL(name, val)
	vim.api.nvim_set_hl(0, name, val)
end

vim.g.colors_name = "fallback"
vim.o.background = "dark"

local c = require("core.colo.theme.radium")

HL("Character", { foreground = "#E1C58D" })
HL("ColorColumn", { background = "#111419", foreground = "#171A20" })
HL("Comment", { foreground = "#515C68" })
HL("Conceal", { foreground = "#1C2228" })
HL("Conditional", { foreground = "#F87070" })
HL("Constant", { foreground = "#FF6666" })
HL("Cursor", { background = "#DFC184", foreground = "#101317" })
HL("CursorColumn", { background = "#191D21" })
HL("CursorLine", { background = "#191D21" })
HL("CursorLineFold", { background = "#101317", foreground = "#70C0BA" })
HL("CursorLineNr", { bold = true, foreground = "#FFE59E" })
HL("CursorLineSign", { background = "#101317" })
HL("Debug", { foreground = "#FB7373" })
HL("Decorator", { foreground = "#FFE59E" })
HL("Define", { foreground = "#C397D8" })
HL("Delimeter", { foreground = "#7AB0DF" })
HL("Delimiter", { foreground = "#FB7373" })
HL("DiagnosticError", { foreground = "#F87070" })
HL("DiagnosticFloatingError", { foreground = "#F87070" })
HL("DiagnosticFloatingHint", { foreground = "#C397D8" })
HL("DiagnosticFloatingInfo", { foreground = "#7AB0DF" })
HL("DiagnosticFloatingWarn", { foreground = "#F97F7F" })
HL("DiagnosticHint", { foreground = "#C397D8" })
HL("DiagnosticInfo", { foreground = "#7AB0DF" })
HL("DiagnosticSignError", { foreground = "#FB7373" })
HL("DiagnosticSignHint", { foreground = "#C397D8" })
HL("DiagnosticSignInfo", { foreground = "#7AB0DF" })
HL("DiagnosticSignWarn", { foreground = "#F97F7F" })
HL("DiagnosticUnderlineError", { foreground = "#F87070" })
HL("DiagnosticUnderlineHint", { foreground = "#C397D8" })
HL("DiagnosticUnderlineInfo", { foreground = "#7AB0DF" })
HL("DiagnosticUnderlineWarn", { foreground = "#F97F7F" })
HL("DiagnosticVirtualTextError", { foreground = "#F87070" })
HL("DiagnosticVirtualTextHint", { foreground = "#C397D8" })
HL("DiagnosticVirtualTextInfo", { foreground = "#7AB0DF" })
HL("DiagnosticVirtualTextWarn", { foreground = "#F97F7F" })
HL("DiagnosticWarn", { foreground = "#F97F7F" })
HL("DiffAdd", { foreground = "#79DCAA" })
HL("DiffChange", { foreground = "#C397D8" })
HL("DiffDelete", { foreground = "#F87070" })
HL("DiffText", { foreground = "#7AB0DF" })
HL("Directory", { foreground = "#FFE59E" })
HL("EndOfBuffer", { foreground = "#C397D8" })
HL("Error", { foreground = "#F76262" })
HL("ErrorMsg", { foreground = "#F87070" })
HL("Exception", { foreground = "#36C692" })
HL("Float", { foreground = "#F3A4F1" })
HL("FloatBorder", { background = "#151A1F", foreground = "#F76262" })
HL("FloatShadow", { background = "#000000", blend = 80 })
HL("FloatShadowThrough", { background = "#000000", blend = 100 })
HL("FocusedSymbol", { background = "#666666", foreground = "#FFA0A0" })
HL("FoldColumn", { background = "#101317", foreground = "#70C0BA" })
HL("Folded", { background = "#101317", foreground = "#282F3C" })
HL("Function", { foreground = "#BE8FD7" })
HL("Identifier", { foreground = "#36C692" })
HL("IncSearch", { background = "#70C0BA", foreground = "#101317" })
HL("InclineNormal", { background = "#151A1F", foreground = "#BABABE" })
HL("InclineNormalNC", { background = "#151A1F", foreground = "#BABABE" })
HL("Include", { bold = true, foreground = "#6AA6DF" })
HL("Italic", { italic = true })
HL("Keyword", { foreground = "#66B3FF" })
HL("Label", { foreground = "#F87070" })
HL("LineNr", { foreground = "#2E3645" })
HL("LineNrAbove", { foreground = "#2E3645" })
HL("LineNrBelow", { foreground = "#2E3645" })
HL("Macro", { foreground = "#F98989" })
HL("MatchBackground", { background = "#111419", foreground = "#171A20" })
HL("MatchParen", { background = "#202530", bold = true })
HL("MatchParenCur", { background = "#202530", bold = true })
HL("MatchWord", { background = "#202530", bold = true })
HL("ModeMsg", { bold = true, foreground = "#7AB0DF" })
HL("MoreMsg", { foreground = "#FFE59E" })
HL("MsgArea", { foreground = "#CACACD" })
HL("MsgSeparator", { foreground = "#C397D8" })
HL("NonText", { foreground = "#222931" })
HL("Normal", { background = "#101317", foreground = "#D4D4D5" })
HL("NormalFloat", { background = "#151A1F", foreground = "#BABABE" })
HL("Number", { foreground = "#54CED6" })
HL("Operator", { foreground = "#70C0BA" })
HL("Pmenu", { background = "#171D20", foreground = "#A0A0A5" })
HL("PmenuSbar", { background = "#171D20", foreground = "#A0A0A5" })
HL("PmenuSel", { background = "#79DCAA", foreground = "#101317" })
HL("PmenuThumb", { background = "#1E2225" })
HL("PreCondit", { foreground = "#F96262" })
HL("PreProc", { foreground = "#F96262" })
HL("Question", { foreground = "#79DCAA" })
HL("QuickFixLine", { background = "#FFE59E", foreground = "#101317" })
HL("RedrawDebugClear", { background = "#FFFF00" })
HL("RedrawDebugComposed", { background = "#008000" })
HL("RedrawDebugNormal", { reverse = true })
HL("RedrawDebugRecompose", { background = "#FF0000" })
HL("Repeat", { foreground = "#B77EE0" })
HL("Search", { background = "#FFE59E", foreground = "#101317" })
HL("SignColumn", { background = "#101317" })
HL("Special", { foreground = "#FB7373" })
HL("SpecialChar", { foreground = "#C397D8" })
HL("SpecialComment", { foreground = "#FFDF8F" })
HL("SpecialKey", { bold = true, foreground = "#FFE59E" })
HL("SpellBad", { foreground = "#F87070" })
HL("SpellCap", { foreground = "#FCCF67" })
HL("SpellLocal", { foreground = "#FB7373" })
HL("SpellRare", { foreground = "#54CED6" })
HL("Statement", { foreground = "#F87070" })
HL("StatusLine", { background = "#101317", foreground = "#7AB0DF" })
HL("StatusLineNC", { foreground = "#7AB0DF" })
HL("StorageClass", { foreground = "#F75858" })
HL("String", { foreground = "#79DCAA" })
HL("Structure", { foreground = "#5FB0FC" })
HL("Substitute", { background = "#b77ee0", foreground = "#101317" })
HL("TabLine", { background = "#101317", bold = true, foreground = "#2C3640" })
HL("TabLineFill", { background = "#101317", foreground = "#7AB0DF" })
HL("TabLineSel", { background = "#7AB0DF", bold = true, foreground = "#101317" })
HL("Tag", { foreground = "#7AB0DF" })
HL("TermCursor", { reverse = true })
HL("Title", { bold = true, foreground = "#4B5259" })
HL("Todo", { foreground = "#FFE59E" })
HL("Type", { foreground = "#F87070" })
HL("Typedef", { foreground = "#C397D8" })
HL("Underlined", { underline = true })
HL("VertSplit", { foreground = "#171C21" })
HL("Visual", { background = "#192023" })
HL("WarningMsg", { foreground = "#FB7373" })
HL("Whitespace", { foreground = "#1E222A" })
HL("WildMenu", { background = "#7AB0DF", foreground = "#101317" })
HL("WinBar", { bold = true })
HL("WinBarNC", { bold = true })
HL("WinSeparator", { foreground = "#171C21" })

-- Telescope Colors
HL("TelescopePreviewBorder", { foreground = c.black:darken(1):HEX(true), background = c.black:darken(1):HEX(true) })
HL("TelescopeResultsBorder", { background = c.black:darken(2):HEX(true), foreground = c.black:darken(2):HEX(true) })
HL(
	"TelescopePromptBorder",
	{ background = c.black:lighten(1):HEX(true), foreground = c.bright_black:darken(1.5):HEX(true) }
)
HL("TelescopePreviewNormal", { background = c.black:darken(1):HEX(true), foreground = c.white:darken(10):HEX(true) })
HL("TelescopeResultsNormal", { background = c.black:darken(2):HEX(true), foreground = c.white:darken(10):HEX(true) })
HL("TelescopePromptNormal", { background = c.black:lighten(1):HEX(true), foreground = c.white:darken(10):HEX(true) })
HL("TelescopePromptPrefix", { background = c.black:lighten(1):HEX(true), foreground = c.red:HEX(true) })
HL("TelescopePromptCounter", { background = c.black:lighten(1):HEX(true), foreground = c.magenta:spin(0.1):HEX(true) })
HL("TelescopePreviewTitle", { background = c.blue:HEX(true), foreground = c.black:HEX(true) })
HL("TelescopeResultsTitle", { background = c.green:HEX(true), foreground = c.black:HEX(true) })
HL("TelescopePromptTitle", { background = c.red:HEX(true), foreground = c.black:HEX(true) })
HL("TelescopeSelection", { background = c.black:HEX(true), foreground = c.bright_cyan:HEX(true) })
HL("TelescopeSelectionCaret", { background = c.black:HEX(true), foreground = c.bright_red:HEX(true) })
HL("TelescopePreviewLine", { background = c.black:lighten(1):brighten(1):HEX(true) })
HL("TelescopeMatching", { foreground = c.magenta:increase_red(10):decrease_blue(5):HEX(true) })

-- Cmp
HL("CmpSel", { foreground = "#101317", background = "#79DCAA" })
HL("CmpItemAbbr", { foreground = "#D4D4D5" })
HL("CmpItemAbbrMatch", { foreground = "#7AB0DF", bold = true })
HL("CmpSel", { link = "PmenuSel", bold = true })

HL("CmpItemMenu", { foreground = "#605f6f", italic = true })
HL("CmpPmenu", { background = "#1E222A" })
HL("CmpDoc", { background = "#151A1F" })
HL("CmpDocBorder", { foreground = "#151A1F", background = "#151A1F" })

HL("CmpItemKindConstant", { background = "#FFE59E", foreground = "#101317" })
HL("CmpItemKindFunction", { background = "#7AB0DF", foreground = "#101317" })
HL("CmpItemKindIdentifier", { background = "#FB7373", foreground = "#101317" })
HL("CmpItemKindField", { background = "#FB7373", foreground = "#101317" })
HL("CmpItemKindVariable", { background = "#C397D8", foreground = "#101317" })
HL("CmpItemKindSnippet", { background = "#FB7373", foreground = "#101317" })
HL("CmpItemKindText", { background = "#36C692", foreground = "#101317" })
HL("CmpItemKindStructure", { background = "#C397D8", foreground = "#101317" })
HL("CmpItemKindType", { background = "#FFDF8F", foreground = "#101317" })
HL("CmpItemKindKeyword", { background = "#ffffff", foreground = "#101317" })
HL("CmpItemKindMethod", { background = "#7AB0DF", foreground = "#101317" })
HL("CmpItemKindConstructor", { background = "#54CED6", foreground = "#101317" })
HL("CmpItemKindFolder", { background = "#ffffff", foreground = "#101317" })
HL("CmpItemKindModule", { background = "#FFDF8F", foreground = "#101317" })
HL("CmpItemKindProperty", { background = "#FB7373", foreground = "#101317" })
HL("CmpItemKindEnum", { background = "#54CED6", foreground = "#101317" })
HL("CmpItemKindUnit", { background = "#C397D8", foreground = "#101317" })
HL("CmpItemKindClass", { background = "#70C0BA", foreground = "#101317" })
HL("CmpItemKindFile", { background = "#ffffff", foreground = "#101317" })
HL("CmpItemKindInterface", { background = "#36C692", foreground = "#101317" })
HL("CmpItemKindColor", { background = "#D4D4D5", foreground = "#101317" })
HL("CmpItemKindReference", { background = "#bfc6d4", foreground = "#101317" })
HL("CmpItemKindEnumMember", { background = "#B77EE0", foreground = "#101317" })
HL("CmpItemKindStruct", { background = "#C397D8", foreground = "#101317" })
HL("CmpItemKindValue", { background = "#89DCEB", foreground = "#101317" })
HL("CmpItemKindEvent", { background = "#FAE3B0", foreground = "#101317" })
HL("CmpItemKindOperator", { background = "#bfc6d4", foreground = "#101317" })
HL("CmpItemKindTypeParameter", { background = "#FB7373", foreground = "#101317" })
HL("CmpItemKindCopilot", { background = "#36C692", foreground = "#101317" })

-- BufferLine
HL("BufferLineFill", {
	foreground = c.black:lighten(10):brighten(5):HEX(true),
	background = c.black:HEX(true),
})
HL("BufferLineBackground", {
	foreground = c.black:lighten(10):HEX(true),
	background = c.black:lighten(2):HEX(true),
})
HL("BufferLineTabSeparator", {
	foreground = c.black:lighten(2):HEX(true),
	background = c.black:lighten(2):HEX(true),
})
HL("BufferLineTabSeparatorSelected", {
	foreground = c.black:HEX(true),
})
HL("BufferLineTabSelected", {
	foreground = c.blue:HEX(true),
	background = c.black:HEX(true),
	bold = true,
})
HL("BufferLineTabClose", {
	foreground = c.red:HEX(true),
	background = c.black:HEX(true),
})
HL("BufferLineCloseButton", {
	foreground = c.red:HEX(true),
	background = c.black:lighten(2):HEX(true),
})
HL("BufferLineCloseButtonVisible", {
	foreground = c.red:HEX(true),
	background = c.black:lighten(2):HEX(true),
})
HL("BufferLinecloseButtonSelected", {
	foreground = c.black:HEX(true),
	background = c.blue:HEX(true),
})
HL("BufferLineBuffer", {
	foreground = c.black:lighten(2):HEX(true),
	background = c.black:lighten(2):HEX(true),
})
HL("BufferLineBufferVisible", {
	foreground = c.blue:HEX(true),
	background = c.black:lighten(2):HEX(true),
})
HL("BufferLineBufferSelected", {
	foreground = c.black:HEX(true),
	background = c.blue:HEX(true),
	bold = true,
	italic = false,
})
HL("BufferLineModified", {
	foreground = c.green:HEX(true),
	background = c.black:lighten(2):HEX(true),
})
HL("BufferLineModifiedVisible", {
	foreground = c.green:HEX(true),
	background = c.black:lighten(2):HEX(true),
})
HL("BufferLineModifiedSelected", {
	foreground = c.black:HEX(true),
	background = c.blue:HEX(true),
})
HL("BufferLineDuplicateSelected", {
	foreground = c.black:lighten(10):HEX(true),
	background = c.black:lighten(2):HEX(true),
	italic = false,
})
HL("BufferLineDuplicateVisible", {
	foreground = c.black:lighten(10):HEX(true),
	background = c.black:lighten(2):HEX(true),
	italic = false,
})
HL("BufferLineDuplicate", {
	foreground = c.black:lighten(10):HEX(true),
	background = c.black:lighten(2):HEX(true),
	italic = false,
})
HL("BufferLinePickSelected", {
	foreground = c.green:lighten(10):HEX(true),
	background = c.blue:HEX(true),
	bold = true,
	italic = false,
})
HL("BufferLinePickVisible", {
	background = c.black:lighten(2):HEX(true),
	foreground = c.bright_yellow:HEX(true),
	bold = true,
	italic = false,
})
HL("BufferLinePick", {
	foreground = c.magenta:spin(0.1):HEX(true),
	background = c.black:lighten(2):HEX(true),
	bold = true,
	italic = false,
})
HL("BufferLineSeparator", {
	foreground = c.black:lighten(2):HEX(true),
	background = c.black:lighten(2):HEX(true),
})
HL("BufferLineIndicatorVisible", {
	foreground = c.black:lighten(2):HEX(true),
	background = c.black:lighten(2):HEX(true),
})
HL("BufferLineIndicatorSelected", {
	background = c.blue:HEX(true),
	foreground = c.blue:HEX(true),
})
HL("BufferLineSeparatorVisible", {
	foreground = c.black:lighten(2):HEX(true),
	background = c.black:lighten(2):HEX(true),
})
HL("BufferLineSeparatorSelected", {
	background = c.blue:HEX(true),
	foreground = c.blue:HEX(true),
})
HL("BufferLineOffsetSeparator", {
	foreground = c.blue:HEX(true),
	background = c.blue:HEX(true),
})

HL("NeoTreeCursorLine", { foreground = c.bright_green:HEX(true) })
HL("NeoTreeDirectoryIcon", { foreground = c.bright_magenta:HEX(true) })
HL("NeoTreeDirectoryName", { link = "NvimTreeFolderIcon" })
HL("NeoTreeGitAdded", { foreground = c.yellow:HEX(true) })
HL("NeoTreeGitDeleted", { foreground = c.red:HEX(true) })
HL("NeoTreeGitIgnored", { foreground = c.bright_black:HEX(true) })
HL("NeoTreeGitModified", { foreground = c.cyan:HEX(true) })
HL("NeoTreeGitRenamed", { foreground = c.bright_blue:HEX(true) })
HL("NeoTreeGitStaged", { foreground = c.magenta:spin(0.1):HEX(true) })
HL("NeoTreeNormal", { background = c.black:darken(2):HEX(true), foreground = c.white:darken(10):HEX(true) })
HL("NeoTreeNormalNC", { background = c.black:darken(2):HEX(true), foreground = c.white:darken(10):HEX(true) })
HL("NeoTreeVertSplit", { background = c.black:darken(2):HEX(true), foreground = c.black:darken(2):HEX(true) })
HL("NeoTreeWinSeparator", { background = c.black:darken(2):HEX(true), foreground = c.black:darken(2):HEX(true) })
HL("NeoTreeRootName", { foreground = c.red:HEX(true) })
HL("NeoTreeSymbolicLinkTarget", { foreground = c.cyan:HEX(true) })
HL("NeoTreeIndentMarker", { foreground = c.black:brighten(1):lighten(5):HEX(true) })

-- Headline Colors
HL("Headline1", { background = "#FFA0A0" })
HL("Headline2", { background = "#54CED6" })
HL("Headline3", { background = "#79DCAA" })
HL("Headline4", { background = "#C397D8" })
HL("Headline5", { background = "#FFE59E" })
HL("Headline6", { background = "#171D20" })
HL("CodeBlock", { background = "#151A1F" })
HL("Dash", { background = "#171C21", bold = true })

---vim:filetype=lua
