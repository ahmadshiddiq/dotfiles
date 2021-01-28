vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim'}

  use {'gruvbox-community/gruvbox'}
  use {'wakatime/vim-wakatime'}
  use {'tpope/vim-fugitive'}
  use {'akinsho/nvim-bufferline.lua', opt = true}
  use {'tpope/vim-dispatch'}
  use {'mattn/emmet-vim'}
  use {'windwp/nvim-autopairs'}

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      {'romgrk/nvim-treesitter-context'},
      {'nvim-treesitter/nvim-treesitter-refactor'}
    }
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    },
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {{'kyazdani42/nvim-web-devicons'}},
    opt = true,
  }
end)
