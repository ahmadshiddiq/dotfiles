local k = require"astronauta.keymap"

local noremap =  k.noremap
local nnoremap = k.nnoremap
local inoremap = k.inoremap
local vnoremap = k.vnoremap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

nnoremap({"<Leader>r", "<cmd>luafile %<cr>"})

nnoremap({"<Leader>h", ":wincmd h<cr>"})
nnoremap({"<Leader>j", ":wincmd j<cr>"})
nnoremap({"<Leader>k", ":wincmd k<cr>"})
nnoremap({"<Leader>l", ":wincmd l<cr>"})

nnoremap({"<A-h>", ":bprevious<cr>"})
nnoremap({"<A-l>", ":bnext<cr>"})

inoremap{"jj", "<Esc><Esc>"}
inoremap{"Jj", "<Esc><Esc>"}
inoremap{"jJ", "<Esc><Esc>"}
inoremap{"JJ", "<Esc><Esc>"}


-- Sayonara
nnoremap({"<A-j>", ":Sayonara!<cr>"})
nnoremap({"<A-k>", ":Sayonara<cr>"})

-- Telescope
nnoremap({"<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>"})
nnoremap({"<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<cr>"})

-- NvimTree
nnoremap({'<C-n>', '<cmd>NvimTreeToggle<cr>'})
