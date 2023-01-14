local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function()
  -- General
	use({ "wbthomason/packer.nvim" })

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
  use({ "prettier/vim-prettier", run = "yarn install --frozen-lockfile --production" })

  -- completion
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "saadparwaiz1/cmp_luasnip" })
  use({ "L3MON4D3/LuaSnip" })
  use({ "hrsh7th/cmp-path" })

end)
