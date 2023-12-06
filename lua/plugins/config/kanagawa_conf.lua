local status_ok, kanagawa = pcall(require, "kanagawa")

if not status_ok then
	return
end

local options = {
	compile = false, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = { -- add/modify theme and palette colors
		palette = {},
		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	},
	overrides = function(colors) -- add/modify highlights
		return {
			-- GitSigns
			DiffAdd = { fg = colors.palette.dragonGreen },
			DiffChange = { fg = colors.palette.dragonViolet },
			DiffDelete = { fg = colors.palette.dragonRed },
			DiffText = { fg = colors.palette.dragonBlue },

			-- Cmp
			CmpSel = { fg = colors.palette.dragonBlack0, bg = colors.palette.dragonGreen, bold = true },
			CmpItemAbbr = { fg = colors.palette.dragonWhite },
			CmpItemAbbrMatch = { fg = colors.palette.dragonBlue, bold = true },
			-- CmpSel = { link = "PmenuSel", bold = true },

			CmpItemMenu = { fg = colors.palette.dragonWhite, italic = true },
			CmpPmenu = { bg = colors.palette.dragonBlack2 },
			CmpDoc = { bg = colors.palette.dragonBlack3 },
			CmpDocBorder = { fg = colors.palette.dragonBlack3, bg = colors.palette.dragonBlack3 },

			CmpItemKindConstant = { bg = colors.palette.dragonYellow, fg = colors.palette.dragonBlack0 },
			CmpItemKindFunction = { bg = colors.palette.dragonBlue, fg = colors.palette.dragonBlack0 },
			CmpItemKindIdentifier = { bg = colors.palette.dragonRed, fg = colors.palette.dragonBlack0 },
			CmpItemKindField = { bg = colors.palette.dragonOrange, fg = colors.palette.dragonBlack0 },
			CmpItemKindVariable = { bg = colors.palette.dragonViolet, fg = colors.palette.dragonBlack0 },
			CmpItemKindSnippet = { bg = colors.palette.dragonOrange, fg = colors.palette.dragonBlack0 },
			CmpItemKindText = { bg = colors.palette.dragonGreen, fg = colors.palette.dragonBlack0 },
			CmpItemKindStructure = { bg = colors.palette.dragonViolet, fg = colors.palette.dragonBlack0 },
			CmpItemKindType = { bg = colors.palette.dragonYellow, fg = colors.palette.dragonBlack0 },
			CmpItemKindKeyword = { bg = colors.palette.dragonWhite, fg = colors.palette.dragonBlack0 },
			CmpItemKindMethod = { bg = colors.palette.dragonBlue, fg = colors.palette.dragonBlack0 },
			CmpItemKindConstructor = { bg = colors.palette.dragonBlue, fg = colors.palette.dragonBlack0 },
			CmpItemKindFolder = { bg = colors.palette.dragonWhite, fg = colors.palette.dragonBlack0 },
			CmpItemKindModule = { bg = colors.palette.dragonYellow, fg = colors.palette.dragonBlack0 },
			CmpItemKindProperty = { bg = colors.palette.dragonOrange, fg = colors.palette.dragonBlack0 },
			CmpItemKindEnum = { bg = colors.palette.dragonBlue, fg = colors.palette.dragonBlack0 },
			CmpItemKindUnit = { bg = colors.palette.dragonViolet, fg = colors.palette.dragonBlack0 },
			CmpItemKindClass = { bg = colors.palette.dragonAqua, fg = colors.palette.dragonBlack0 },
			CmpItemKindFile = { bg = colors.palette.dragonWhite, fg = colors.palette.dragonBlack0 },
			CmpItemKindInterface = { bg = colors.palette.dragonGreen2, fg = colors.palette.dragonBlack0 },
			CmpItemKindColor = { bg = colors.palette.dragonWhite, fg = colors.palette.dragonBlack0 },
			CmpItemKindReference = { bg = colors.palette.dragonBlue2, fg = colors.palette.dragonBlack0 },
			CmpItemKindEnumMember = { bg = colors.palette.dragonViolet, fg = colors.palette.dragonBlack0 },
			CmpItemKindStruct = { bg = colors.palette.dragonViolet, fg = colors.palette.dragonBlack0 },
			CmpItemKindEvent = { bg = colors.palette.dragonYellow, fg = colors.palette.dragonBlack0 },
			CmpItemKindOperator = { bg = colors.palette.dragonWhite, fg = colors.palette.dragonBlack0 },
			CmpItemKindValue = { bg = colors.palette.dragonAqua, fg = colors.palette.dragonBlack0 },
			CmpItemKindTypeParameter = { bg = colors.palette.peachRed, fg = colors.palette.dragonBlack0 },
			CmpItemKindCopilot = { bg = colors.palette.dragonGreen2, fg = colors.palette.dragonBlack0 },

			-- Alpha
			AlphaKeyPrefix = { bg = colors.palette.dragonBlue, fg = colors.palette.dragonBlack0 },
			AlphaFooting = { fg = colors.palette.dragonViolet },
			AlphaFooter = { fg = colors.palette.dragonYellow },
			AlphaHeading = { fg = colors.palette.dragonBlack2 },
			AlphaHeader = { fg = colors.palette.dragonYellow },
			AlphaLoaded = { fg = colors.palette.dragonBlack5 },
			AlphaScroll = { fg = colors.palette.dragonViolet },
			AlphaButtonLabelText = { fg = colors.palette.dragonYellow },
			MsgSeparator = { fg = colors.palette.dragonRed, bg = colors.palette.dragonBlack3 },

			-- Headline Colors
			Headline1 = { bg = colors.palette.peachRed },
			Headline2 = { bg = colors.palette.dragonAqua },
			Headline3 = { bg = colors.palette.dragonGreen },
			Headline4 = { bg = colors.palette.dragonViolet },
			Headline5 = { bg = colors.palette.dragonOrange },
			Headline6 = { bg = colors.palette.dragonBlue },
			CodeBlock = { bg = colors.palette.dragonBlack2 },
			Dash = { bg = colors.palette.dragonBlack2, bold = true },

			-- StatusLine
			StatusLine = { fg = colors.palette.dragonBlack2, bg = colors.palette.dragonBlack2 },
			TeSTTNormalMode = { fg = colors.palette.dragonBlue, bg = colors.palette.dragonBlack5 },
			TeSTTVisualMode = { fg = colors.palette.dragonViolet, bg = colors.palette.dragonBlack5 },
			TeSTTCommandMode = { fg = colors.palette.dragonRed, bg = colors.palette.dragonBlack5 },
			TeSTTInsertMode = { fg = colors.palette.dragonGreen, bg = colors.palette.dragonBlack5 },
			TeSTTTerminalMode = { fg = colors.palette.dragonRed, bg = colors.palette.dragonBlack5 },
			TeSTTNTerminalMode = { fg = colors.palette.dragonRed, bg = colors.palette.dragonBlack5 },
			TeSTTConfirmMode = { fg = colors.palette.dragonYellow, bg = colors.palette.dragonBlack5 },

			TeSTTNormalModeIcon = { fg = colors.palette.dragonBlack0, bg = colors.palette.dragonBlue },
			TeSTTVisualModeIcon = { fg = colors.palette.dragonBlack0, bg = colors.palette.dragonViolet },
			TeSTTCommandModeIcon = { fg = colors.palette.dragonBlack0, bg = colors.palette.dragonRed },
			TeSTTInsertModeIcon = { fg = colors.palette.dragonBlack0, bg = colors.palette.dragonGreen },
			TeSTTTerminalModeIcon = { fg = colors.palette.dragonBlack0, bg = colors.palette.dragonRed },
			TeSTTNTerminalModeIcon = { fg = colors.palette.dragonBlack0, bg = colors.palette.dragonRed },
			TeSTTConfirmModeIcon = {
				fg = colors.palette.dragonBlack0,
				bg = colors.palette.dragonYellow,
			},

			TeSTTFileIcon = { fg = colors.palette.dragonBlack0, bg = colors.palette.dragonRed },
			TeSTTFileName = {
				fg = colors.palette.dragonRed,
				bg = colors.palette.dragonBlack5,
				bold = true,
			},
			TeSTTFolder = { fg = colors.palette.dragonRed, bg = colors.palette.dragonBlack5 },

			Nothing = { fg = colors.palette.dragonBlack5, bg = colors.palette.dragonBlack5 },
			Nothing2 = { fg = colors.palette.dragonBlack2, bg = colors.palette.dragonBlack2 },

			TeSTTError = { fg = colors.palette.dragonRed, bg = colors.palette.dragonBlack5 },
			TeSTTErrorIcon = { fg = colors.palette.dragonRed, bg = colors.palette.dragonBlack5 },
			TeSTTWarning = { fg = colors.palette.dragonYellow, bg = colors.palette.dragonBlack5 },
			TeSTTWarningIcon = { fg = colors.palette.dragonYellow, bg = colors.palette.dragonBlack5 },
			TeSTTHints = { fg = colors.palette.dragonViolet, bg = colors.palette.dragonBlack5 },
			TeSTTHintsIcon = { fg = colors.palette.dragonViolet, bg = colors.palette.dragonBlack5 },
			TeSTTInfo = { fg = colors.palette.dragonBlue, bg = colors.palette.dragonBlack5 },
			TeSTTInfoIcon = { fg = colors.palette.dragonBlue, bg = colors.palette.dragonBlack5 },

			TeSTTBranchName = { fg = colors.palette.oniViolet, bg = colors.palette.dragonBlack5 },
			TeSTTBranchIcon = { fg = colors.palette.dragonBlack0, bg = colors.palette.oniViolet },
			TeSTTDiffAdd = { fg = colors.palette.dragonGreen, bg = colors.palette.dragonBlack5 },
			TeSTTDiffChange = { fg = colors.palette.autumnYellow, bg = colors.palette.dragonBlack5 },
			TeSTTDiffRemove = { fg = colors.palette.dragonRed, bg = colors.palette.dragonBlack5 },
			TeSTTGithub = { fg = colors.palette.dragonBlack0, bg = colors.palette.dragonBlue },

			TeSTTLsp = { fg = colors.palette.dragonGreen, bg = colors.palette.dragonBlack5 },
			TeSTTLspIcon = { fg = colors.palette.dragonBlack0, bg = colors.palette.dragonGreen },
			TeSTTCopilot = { fg = colors.palette.dragonAqua, bg = colors.palette.dragonBlack5 },

			TeSTTTabIcon = { fg = colors.palette.dragonBlack0, bg = colors.palette.dragonTeal },
			TeSTTTab = { fg = colors.palette.dragonTeal, bg = colors.palette.dragonBlack5 },

			TeSTTProgressIcon = { fg = colors.palette.dragonBlack0, bg = colors.palette.dragonViolet },
			TeSTTProgress = { fg = colors.palette.dragonViolet, bg = colors.palette.dragonBlack5 },

			TeSTTLocationIcon = { fg = colors.palette.dragonBlack0, bg = colors.palette.dragonYellow },
			TeSTTLocation = { fg = colors.palette.dragonYellow, bg = colors.palette.dragonBlack5 },

			-- Mini
			MiniIndentscopeSymbol = { fg = colors.palette.dragonRed },
		}
	end,
	theme = "wave", -- Load "wave" theme when 'bg' option is not set
	background = { -- map the value of 'background' option to a theme
		dark = "dragon", -- try "dragon" !
		light = "lotus",
	},
}

kanagawa.setup(options)
