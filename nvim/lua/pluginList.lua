local present, packer = pcall(require, "packerInit")

if present then
  packer = require "packer"
else
  return false
end

local use = packer.use
return packer.startup(function()
  -- Have packer manage itself
  use {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }

  -- https://github.com/nathom/filetype.nvim
  use { "nathom/filetype.nvim" }

  -- https://github.com/lewis6991/impatient.nvim
  use { "lewis6991/impatient.nvim" }

  -- https://github.com/tweekmonster/startuptime.vim
  use {
    "tweekmonster/startuptime.vim",
    cmd = "StartupTime",
  }

  -- https://github.com/max397574/better-escape.nvim
  use {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        mapping = { "jk", "jj" },
        clear_empty_lines = true,
        keys = "<Esc>",
      }
    end,
  }

  -- https://github.com/shaunsingh/nord.nvim
  use {
    "shaunsingh/nord.nvim",
    config = function()
      require("nord").set()
    end,
  }

  -- https://github.com/folke/which-key.nvim
  use {
    "folke/which-key.nvim",
    keys = "<space>",
    config = function()
      require("which-key").setup()
    end,
  }

  -- https://github.com/kyazdani42/nvim-web-devicons
  use {
    "kyazdani42/nvim-web-devicons",
    after = "nord.nvim",
  }

  -- https://github.com/NTBBloodbath/galaxyline.nvim
  use {
    "NTBBloodbath/galaxyline.nvim",
    config = function()
      require "plugins.statusline"
      -- require("galaxyline.themes.eviline")
    end,
    -- requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  -- https://github.com/akinsho/bufferline.nvim
  use {
    "akinsho/bufferline.nvim",
    config = function()
      require "plugins.bufferline"
    end,
  }

  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.others").blankline()
    end,
  }

  -- https://github.com/norcalli/nvim-colorizer.lua
  use {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function()
      require("plugins.others").colorizer()
    end,
  }

  -- https://github.com/nvim-treesitter/nvim-treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins.treesitter"
    end,
  }

  -- https://github.com/nvim-treesitter/playground
  use {
    "nvim-treesitter/playground",
    cmd = "TSPlayground",
  }

  -- https://github.com/p00f/nvim-ts-rainbow
  use {
    "p00f/nvim-ts-rainbow",
    after = "nvim-treesitter",
  }

  -- https://github.com/lewis6991/gitsigns.nvim
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gitsigns").setup()
    end,
  }

  -- https://github.com/kyazdani42/nvim-tree.lua
  use {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require "plugins.nvimtree"
    end,
  }

  -- https://github.com/github/copilot.vim
  use {
    "github/copilot.vim",
    event = "InsertEnter",
  }

  -- https://github.com/neovim/nvim-lspconfig
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.lspconfig"
    end,
  }

  -- https://github.com/williamboman/nvim-lsp-installer
  --
  --   :LspInstall elixirls eslint solargraph rust_analyzer sumneko_lua tailwindcss
  use {
    "williamboman/nvim-lsp-installer",
  }

  -- https://github.com/ray-x/lsp_signature.nvim
  use {
    "ray-x/lsp_signature.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("plugins.others").signature()
    end,
  }

  -- https://github.com/rafamadriz/friendly-snippets
  use {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
   }

  -- https://github.com/numToStr/Comment.nvim
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.others").comment()
    end,
  }

  -- https://github.com/hrsh7th/nvim-cmp
  use {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require "plugins.cmp"
    end,
  }

  -- https://github.com/L3MON4D3/LuaSnip
  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("plugins.others").luasnip()
    end,
  }

  -- https://github.com/saadparwaiz1/cmp_luasnip
  use {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip",
  }

  -- https://github.com/hrsh7th/cmp-nvim-lua
  use {
    "hrsh7th/cmp-nvim-lua",
    after = "nvim-cmp",
  }

  -- https://github.com/hrsh7th/cmp-nvim-lsp
  use {
    "hrsh7th/cmp-nvim-lsp",
    after = "nvim-cmp",
  }

  -- https://github.com/lukas-reineke/cmp-rg
  use {
    "lukas-reineke/cmp-rg",
    after = "nvim-cmp",
  }

  -- https://github.com/ray-x/cmp-treesitter
  use {
    "ray-x/cmp-treesitter",
    after = "nvim-cmp",
  }

  -- https://github.com/hrsh7th/cmp-path
  use {
    "hrsh7th/cmp-path",
    after = "nvim-cmp",
  }

  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    requires = {
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          "nvim-lua/plenary.nvim",
          run = "make",
        },
    },
    config = function()
        require "plugins.telescope"
    end,
  }

  -- https://github.com/VonHeikemen/fine-cmdline.nvim
  use {
    "VonHeikemen/fine-cmdline.nvim",
    requires = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("plugins.others").fineCmdline()
    end,
  }

  -- https://github.com/VonHeikemen/searchbox.nvim
  use {
    "VonHeikemen/searchbox.nvim",
    requires = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("plugins.others").searchbox()
    end,
  }

  -- https://github.com/rcarriga/nvim-notify
  use {
    "rcarriga/nvim-notify",
    after = "nord.nvim",
    config = function()
        vim.notify = require "notify"
        require("notify").setup {
          stages = "slide",
          timeout = 2500,
          minimum_width = 50,
          icons = {
              ERROR = "",
              WARN = "",
              INFO = "",
              DEBUG = "",
              TRACE = "✎",
          },
        }
    end,
  }

  -- https://github.com/Pocco81/TrueZen.nvim
  use {
    "Pocco81/TrueZen.nvim",
    cmd = {
        "TZAtaraxis",
        "TZMinimalist",
        "TZFocus",
    },
    config = function()
        require "plugins.zenmode"
    end,
  }

  -- https://github.com/folke/twilight.nvim
  use {
    "folke/twilight.nvim",
    cmd = {
        "Twilight",
        "TwilightEnable",
    },
    config = function()
        require("twilight").setup {}
    end,
  }

  -- https://github.com/phaazon/hop.nvim
  use {
    "phaazon/hop.nvim",
    cmd = {
        "HopWord",
        "HopLine",
        "HopChar1",
        "HopChar2",
        "HopPattern",
    },
    as = "hop",
    config = function()
        require("hop").setup()
    end,
  }

  -- https://github.com/sindrets/diffview.nvim
  use {
    "sindrets/diffview.nvim",
    after = "neogit",
  }

  -- https://github.com/TimUntersberger/neogit
  use {
    "TimUntersberger/neogit",
    cmd = {
        "Neogit",
        "Neogit commit",
    },
    config = function()
        require "plugins.neogit"
    end,
  }

  -- https://github.com/nvim-neorg/neorg
  use {
    "nvim-neorg/neorg",
    branch = "unstable",
    setup = vim.cmd "autocmd BufRead,BufNewFile *.norg setlocal filetype=norg",
    after = { "nvim-treesitter" }, -- you may also specify telescope
    ft = "norg",
    config = function()
        require "plugins.neorg"
    end,
  }

  -- https://github.com/jceb/vim-orgmode
  use {
    "nvim-orgmode/orgmode",
    --ft = "org",
    --setup = vim.cmd("autocmd BufRead,BufNewFile *.org setlocal filetype=org"),
    after = { "nvim-treesitter" },
    config = function()
        require("orgmode").setup {}
    end,
  }

  -- https://github.com/nvim-neorg/neorg-telescope
  use {
    "nvim-neorg/neorg-telescope",
    ft = "norg",
  }

  -- https://github.com/voldikss/vim-floaterm
  use {
    'voldikss/vim-floaterm'
  }

  -- https://github.com/glacambre/firenvim
  use {
    'glacambre/firenvim',
    run = function()
      vim.fn['firenvim#install'](0)
    end
  }
end)
