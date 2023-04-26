-- NOTE: This file is used to overide the colorscheme and to add new Highlights.

vim.g.colors_name = "fallback"
vim.o.background = "dark"

local c = require("core.colo.theme.radium")

local HL = require("core.utils").HL

-- GitSigns
HL("DiffAdd", { foreground = "#79DCAA" })
HL("DiffChange", { foreground = "#C397D8" })
HL("DiffDelete", { foreground = "#F87070" })
HL("DiffText", { foreground = "#7AB0DF" })

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
