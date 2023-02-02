---------------------------------
-- Plugins
---------------------------------
require("bootstrap.lazy-manager")

require("lazy").setup({
    -- START: UI
    {
        "lewis6991/gitsigns.nvim",
        ft = "gitcommit",
        init = function()
            -- load gitsigns only when a git file is opened
            vim.api.nvim_create_autocmd({ "BufRead" }, {
                group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
                callback = function()
                    vim.fn.system("git -C " .. vim.fn.expand "%:p:h" .. " rev-parse")
                    if vim.v.shell_error == 0 then
                        vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
                        vim.schedule(function()
                            require("lazy").load { plugins = "gitsigns.nvim" }
                        end)
                    end
                end,
            })
        end,
        config = function()
            require("plugins.config.gitsigns_conf")
        end
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require("plugins.config.alpha")
        end
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("plugins.config.toggleterm")
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.config.blankline")
        end
    },
    "MunifTanjim/nui.nvim",
    "nvim-lua/popup.nvim",
    {
        "akinsho/bufferline.nvim",
        config = function()
            require("plugins.config.buffer-line")
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        config = function()
            require("plugins.config.neo-tree")
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins.config.lualine")
        end
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {"kevinhwang91/promise-async"},
        config = function ()
            require("plugins.config.ufo")
        end
    },
    -- END: UI

    -- START: LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.config.lspconfig")
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("plugins.config.mason_conf")
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end
    },
    "RishabhRD/lspactions",
    -- END: LSP

    -- START: Completion
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.config.cmp");
        end
    },
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("plugins.config.luasnip")
        end
    },
    "saadparwaiz1/cmp_luasnip",
    "lukas-reineke/cmp-under-comparator",
    {
        "rafamadriz/friendly-snippets",
        module = { "cmp", "cmp_nvim_lsp" },
        event = "InsertEnter",
    },
    -- END: Completion

    -- START: Formatting
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("plugins.config.null-ls")
        end
    },
    -- END: Formatting

    -- START: Dev Plugins
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("plugins.config.treesitter")
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("plugins.config.nvim-autopairs")
        end
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("plugins.config.comment")
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },
    -- END: Dev Plugins

    -- START: Telescope
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        init = function()
            require("core.utils").load_mappings("telescope")
        end,
        config = function()
            require("plugins.config.telescope")
        end
    },
    "nvim-telescope/telescope-symbols.nvim",
    -- END: Telescope

    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "kvrohit/mellow.nvim",
})
