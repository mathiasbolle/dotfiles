return require('packer').startup(function()
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use({
	"catppuccin/nvim",
	as = "catppuccin"
  })

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  }
  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin


	--[[use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }]]--


	--use 'glepnir/dashboard-nvim'
	--

	use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

	use {
    "nvim-neorg/neorg",
    requires = "nvim-lua/plenary.nvim"
}

	use 'max-0406/autoclose.nvim' -- for auto close quotes, brakcets, etc, ...


	 use 'alvan/vim-closetag'


	 use {
  'romgrk/barbar.nvim',

}
end)

