return require("packer").startup(function()
	use({ "wbthomason/packer.nvim" })
  use({ "neoclide/coc.nvim", branch = "release" })
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
	use({ "jose-elias-alvarez/buftabline.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
end)
