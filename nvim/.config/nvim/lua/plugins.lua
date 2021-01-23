vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  use {'gruvbox-community/gruvbox', opt = true}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    opt = true
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    opt = true
  }
end)
