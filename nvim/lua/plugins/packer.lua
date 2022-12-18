return require("packer").startup(function()
  -- General
	use({ "wbthomason/packer.nvim" })

  -- Theme
  use({ "shaunsingh/oxocarbon.nvim", run = './install.sh' })

  -- Editting
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-tree/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons",  } })
	use({ "jose-elias-alvarez/buftabline.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- LSP
  use({ "neovim/nvim-lspconfig" })
  use({ "hrsh7th/nvim-cmp" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-path" })
  use({ "saadparwaiz1/cmp_luasnip" })
  use({ "L3MON4D3/LuaSnip" })
  use({ "prettier/vim-prettier", run = "yarn install --frozen-lockfile --production" })

end)
