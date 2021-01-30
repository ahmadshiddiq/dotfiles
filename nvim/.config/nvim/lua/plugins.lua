vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim'}

  use {'gruvbox-community/gruvbox'}
  use {'wakatime/vim-wakatime'}
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-dispatch'}
  use {'mattn/emmet-vim'}
  use {'jiangmiao/auto-pairs'}
  use {'junegunn/vim-easy-align'}
  use {'mhinz/vim-sayonara'}
  use {'tjdevries/astronauta.nvim'}

  use {'akinsho/nvim-bufferline.lua', opt = true}

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
