vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim'}

  use {'gruvbox-community/gruvbox'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'wakatime/vim-wakatime'}
  use {'tpope/vim-fugitive'}
  use {'akinsho/nvim-bufferline.lua', opt = true}
  use {'tpope/vim-dispatch'}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {{'kyazdani42/nvim-web-devicons'}},
  }
end)
