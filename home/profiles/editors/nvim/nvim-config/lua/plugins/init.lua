return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim', opt = true}
    use {
        'b3nj5m1n/kommentary',
        config = function()
            require('kommentary.config').use_extended_mappings()
        end
    }
    use 'sheerun/vim-polyglot'
    use 'arecarn/vim-crunch'
    use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }
    use 'christoomey/vim-tmux-navigator'
    use 'wellle/context.vim'
    use 'gcmt/wildfire.vim'
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }
    use {
        'npxbr/glow.nvim',
        run = ':GlowInstall',
        cmd = "Glow",
        setup = [[require('plugins.configs.glow_setup')]]
    }
    use 'junegunn/vim-peekaboo'
    use {
        'lervag/vimtex',
        config = [[require('plugins.configs.vimtex')]],
    }
    use 'tpope/vim-dispatch'
    use 'tpope/vim-rhubarb'
    use 'tpope/vim-obsession'
    use 'tpope/vim-jdaddy'
    use {'mrjones2014/legendary.nvim'}
    use {
        'kristijanhusak/vim-dadbod-ui',
        config = [[require('plugins.configs.dbui')]],
    }
    use 'direnv/direnv.vim'
    use {
        'maxbrunsfeld/vim-yankstack',
        config = [[require('plugins.configs.yankstack')]],
    }
    use {
        'puremourning/vimspector',
        run = "python3 install_gadget.py --all --disable-tcl"
    }
    use 'lewis6991/impatient.nvim'
    use {
      "folke/zen-mode.nvim",
      config = [[require('plugins.configs.zen_mode')]],
      setup = [[require('plugins.configs.zen_mode_setup')]],
      cmd = "ZenMode"
    }

    use {
      "folke/twilight.nvim",
      config = [[require('plugins.configs.twilight')]],
    }
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = [[require('plugins.configs.todo_comments')]],
    }
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = [[require('plugins.configs.alpha')]],
    }
    use 'michaeljsmith/vim-indent-object'
    use {
        'myusuf3/numbers.vim',
        config = [[require('plugins.configs.numbers')]],
    }
    use { 'ms-jpq/coq_nvim',
        branch = 'coq',
        setup=function()
            vim.g.coq_settings = { auto_start='shut-up' }
        end,
    }
    use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
    use { 'ms-jpq/coq.thirdparty',
            branch = '3p',
            config = [[require('plugins.configs.coq')]],
        }
    use 'jubnzv/virtual-types.nvim'
    use {
        'ray-x/navigator.lua',
        requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
        config = [[require('plugins.configs.navigator')]],
    }
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        config=[[require('plugins.configs.nvim_lsp')]],
    }
    use 'nicwest/vim-http'
    use {
        'ms-jpq/chadtree', 
        branch = "chad", 
        run = "python3 -m chadtree deps",
        config = [[require('plugins.configs.chadtree')]],
    }
    use 'tpope/vim-bundler'
    use 'tpope/vim-dadbod'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-projectionist'
    use 'tpope/vim-rails'
    use 'tpope/vim-speeddating'
    use {
        'tpope/vim-surround',
        config = [[require('plugins.configs.surround')]],
    }

    use {
        'turbio/bracey.vim',
        run = "npm install --prefix server",
        ft = {'html', 'css', 'javascript'},
        cmd = "Bracey",
        setup = [[require('plugins.configs.bracey_setup')]],
    }
    use {
        'unblevable/quick-scope',
        config = [[require('plugins.configs.quickscope')]],
    }
    use {
        'vim-scripts/vim-auto-save',
        config = [[require('plugins.configs.autosave')]],
    }
    use 'vimwiki/vimwiki'
    use 'wakatime/vim-wakatime'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = [[require('plugins.configs.gitsigns')]],
    }
    use 'ryanoasis/vim-devicons'
    use {
        'zirrostig/vim-schlepp',
        config = [[require('plugins.configs.schlepp')]],
    }
    use 'editorconfig/editorconfig-vim'
    use { 'nvim-treesitter/nvim-treesitter',
    config = [[require('plugins.configs.treesitter')]],
    run = function()
        vf.TSUpdate()
    end}
    use 'rktjmp/lush.nvim'
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = [[require('plugins.configs.lualine')]],
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = [[require('plugins.configs.indent_blankline')]],
    }
    use {
        'akinsho/bufferline.nvim',
        tag="v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = [[require('plugins.configs.bufferline')]],
    }
    use 'kdheepak/lazygit.nvim'
    use {
        {
          'nvim-telescope/telescope.nvim',
          requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'telescope-frecency.nvim',
            'lazygit.nvim'
          },
          wants = {
            'popup.nvim',
            'plenary.nvim',
            'telescope-frecency.nvim',
            'lazygit.nvim'
          },
          config = [[require("plugins.configs.telescope")]],
          cmd = 'Telescope',
          module = 'telescope',
          setup=[[require('plugins.configs.telescope_setup')]]
        },
        {
          'nvim-telescope/telescope-frecency.nvim',
          after = 'telescope.nvim',
          requires = 'tami5/sqlite.lua',
        },
      }

    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = [[require('plugins.configs.hopword')]],
    }

    use {
        "vhyrro/neorg",
        ft = "norg",
        config = [[require('plugins.configs.neorg')]],
    }
    use 'folke/lsp-colors.nvim'
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = [[require('plugins.configs.trouble')]],
    }
    use {
        "folke/which-key.nvim",
        config = [[require('plugins.configs.which_key')]],
    }

end)

