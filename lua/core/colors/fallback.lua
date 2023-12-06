-- NOTE: This file is used to override the colorscheme and to add new Highlights.

local current_theme = require("colo.api").theme.current()

local HL = require("core.utils").HL

-- GitSigns
HL("DiffAdd", { foreground = current_theme.green:HEX(true) })
HL("DiffChange", { foreground = current_theme.magenta:HEX(true) })
HL("DiffDelete", { foreground = current_theme.red:HEX(true) })
HL("DiffText", { foreground = current_theme.blue:HEX(true) })

-- Cmp
HL("CmpSel", { foreground = current_theme.black:HEX(true), background = current_theme.green:HEX(true) })
HL("CmpItemAbbr", { foreground = current_theme.white:HEX(true) })
HL("CmpItemAbbrMatch", { foreground = current_theme.blue:HEX(true), bold = true })
HL("CmpSel", { link = "PmenuSel", bold = true })

HL("CmpItemMenu", { foreground = current_theme.white:darken(3):HEX(true), italic = true })
HL("CmpPmenu", { background = current_theme.bright_black:lighten(3):HEX(true) })
HL("CmpDoc", { background = current_theme.bright_black:lighten(5):HEX(true) })
HL("CmpDocBorder", {
	foreground = current_theme.bright_black:lighten(5):HEX(true),
	background = current_theme.bright_black:lighten(5):HEX(true),
})

HL("CmpItemKindConstant", { background = current_theme.yellow:HEX(true), foreground = current_theme.black:HEX(true) })
HL("CmpItemKindFunction", { background = current_theme.blue:HEX(true), foreground = current_theme.black:HEX(true) })
HL("CmpItemKindIdentifier", { background = current_theme.red:HEX(true), foreground = current_theme.black:HEX(true) })
HL("CmpItemKindField", { background = current_theme.bright_red:HEX(true), foreground = current_theme.black:HEX(true) })
HL("CmpItemKindVariable", { background = current_theme.magenta:HEX(true), foreground = current_theme.black:HEX(true) })
HL(
	"CmpItemKindSnippet",
	{ background = current_theme.bright_red:HEX(true), foreground = current_theme.black:HEX(true) }
)
HL("CmpItemKindText", { background = current_theme.bright_green:HEX(true), foreground = current_theme.black:HEX(true) })
HL("CmpItemKindStructure", { background = current_theme.magenta:HEX(true), foreground = current_theme.black:HEX(true) })
HL(
	"CmpItemKindType",
	{ background = current_theme.yellow:darken(3):HEX(true), foreground = current_theme.black:HEX(true) }
)
HL(
	"CmpItemKindKeyword",
	{ background = current_theme.bright_white:HEX(true), foreground = current_theme.black:HEX(true) }
)
HL("CmpItemKindMethod", { background = current_theme.blue:HEX(true), foreground = current_theme.black:HEX(true) })
HL(
	"CmpItemKindConstructor",
	{ background = current_theme.bright_blue:HEX(true), foreground = current_theme.black:HEX(true) }
)
HL(
	"CmpItemKindFolder",
	{ background = current_theme.bright_white:HEX(true), foreground = current_theme.black:HEX(true) }
)
HL(
	"CmpItemKindModule",
	{ background = current_theme.yellow:darken(3):HEX(true), foreground = current_theme.black:HEX(true) }
)
HL(
	"CmpItemKindProperty",
	{ background = current_theme.bright_red:HEX(true), foreground = current_theme.black:HEX(true) }
)
HL("CmpItemKindEnum", { background = current_theme.bright_blue:HEX(true), foreground = current_theme.black:HEX(true) })
HL("CmpItemKindUnit", { background = current_theme.magenta:HEX(true), foreground = current_theme.black:HEX(true) })
HL("CmpItemKindClass", { background = current_theme.cyan:HEX(true), foreground = current_theme.black:HEX(true) })
HL("CmpItemKindFile", { background = current_theme.bright_white:HEX(true), foreground = current_theme.black:HEX(true) })
HL(
	"CmpItemKindInterface",
	{ background = current_theme.bright_green:HEX(true), foreground = current_theme.black:HEX(true) }
)
HL("CmpItemKindColor", { background = current_theme.white:HEX(true), foreground = current_theme.black:HEX(true) })
HL(
	"CmpItemKindReference",
	{ background = current_theme.white:darken(2):HEX(true), foreground = current_theme.black:HEX(true) }
)
HL(
	"CmpItemKindEnumMember",
	{ background = current_theme.bright_magenta:HEX(true), foreground = current_theme.black:HEX(true) }
)
HL("CmpItemKindStruct", { background = current_theme.magenta:HEX(true), foreground = current_theme.black:HEX(true) })
HL(
	"CmpItemKindValue",
	{ background = current_theme.cyan:lighten(3):HEX(true), foreground = current_theme.black:HEX(true) }
)
HL(
	"CmpItemKindEvent",
	{ background = current_theme.yellow:lighten(2):HEX(true), foreground = current_theme.black:HEX(true) }
)
HL(
	"CmpItemKindOperator",
	{ background = current_theme.white:darken(2):HEX(true), foreground = current_theme.black:HEX(true) }
)
HL(
	"CmpItemKindTypeParameter",
	{ background = current_theme.bright_red:HEX(true), foreground = current_theme.black:HEX(true) }
)
HL(
	"CmpItemKindCopilot",
	{ background = current_theme.bright_green:HEX(true), foreground = current_theme.black:HEX(true) }
)

-- Headline Colors
HL("Headline1", { background = current_theme.bright_red:lighten(2):HEX(true) })
HL("Headline2", { background = current_theme.bright_blue:HEX(true) })
HL("Headline3", { background = current_theme.green:HEX(true) })
HL("Headline4", { background = current_theme.magenta:HEX(true) })
HL("Headline5", { background = current_theme.yellow:HEX(true) })
HL("Headline6", { background = current_theme.bright_black:HEX(true) })
HL("CodeBlock", { background = current_theme.bright_black:lighten(1):HEX(true) })
HL("Dash", { background = current_theme.bright_black:HEX(true), bold = true })

---vim:filetype=lua
