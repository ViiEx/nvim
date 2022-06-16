local utils = require('utils')
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd("packadd packer.nvim")
local util = require('packer.util')

require("packer").startup({
  function(use)
    use({"wbthomason/packer.nvim", opt = true})
    use({'neovim/nvim-lspconfig', config=[[require('config.lsp')]]})
    use { 'ctrlpvim/ctrlp.vim' }
    use { 'preservim/nerdcommenter' }
    use { 'morhetz/gruvbox' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'MunifTanjim/nui.nvim' }
    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      },
      config = [[require('config.neo-tree')]]
    }
    use { 'kdheepak/lazygit.nvim' }
    use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
      end
    }
    use({ "nvim-treesitter/nvim-treesitter", event = 'BufEnter', run = ":TSUpdate", config = [[require('config.treesitter')]] })
    use {
      'phaazon/hop.nvim',
      event = "VimEnter",
      config = function()
        vim.defer_fn(function() require('config.nvim_hop') end, 2000)
      end
    }
    use {
      'kevinhwang91/nvim-hlslens',
      branch = 'main',
      keys = {{'n', '*'}, {'n', '#'}, {'n', 'n'}, {'n', 'N'}},
      config = [[require('config.hlslens')]]
    }
    use({"haya14busa/vim-asterisk", event = 'VimEnter'})
    use({ "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" })
    use {
      'nvim-telescope/telescope.nvim', cmd = 'Telescope',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-symbols.nvim', after = 'telescope.nvim'}
    use({"mhinz/vim-signify", event = 'BufEnter'})
    use {
      'nvim-lualine/lualine.nvim',
      event = 'VimEnter',
      config = [[require('config.statusline')]]
    }
    use({ "akinsho/bufferline.nvim", event = "VimEnter", config = [[require('config.bufferline')]] })
    use({
      "lukas-reineke/indent-blankline.nvim",
      event = 'VimEnter',
      config = [[require('config.indent-blankline')]]
    })
    use({"itchyny/vim-highlighturl", event = "VimEnter"})
    use({
      "rcarriga/nvim-notify",
      event = "BufEnter",
      config = function()
        vim.defer_fn(function() require('config.nvim-notify') end, 2000)
      end
    })
    use({"tpope/vim-eunuch", cmd = {"Rename", "Delete"}})
    use({ "elzr/vim-json", ft = { "json", "markdown" } })
    use({"chrisbra/unicode.vim", event = "VimEnter"})
    use({
      "karb94/neoscroll.nvim",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function() require('config.neoscroll') end, 2000)
      end
    })
    use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function() require('config.which-key') end, 2000)
      end
    }
    use {'jdhao/whitespace.nvim', event = 'VimEnter'}
    use { 'jose-elias-alvarez/null-ls.nvim', config = [[require('config.null-ls')]] }
    use {
      "akinsho/toggleterm.nvim", tag = 'v1.*', config = [[require('config.toggleterm')]]
    }

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    max_jobs = 16,
    compile_path = util.join_paths(fn.stdpath('data'), 'site', 'lua', 'packer_compiled.lua'),
  },
})

local status, _ = pcall(require, 'packer_compiled')
if not status then
  vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end
