local map = vim.api.nvim_set_keymap

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Main Configuration
map("n", "<Leader>r", "<cmd>luafile %<cr>", { noremap = true })
map("n", "<Leader>h", ":wincmd h<cr>", { noremap = true })
map("n", "<Leader>j", ":wincmd j<cr>", { noremap = true })
map("n", "<Leader>k", ":wincmd k<cr>", { noremap = true })
map("n", "<Leader>l", ":wincmd l<cr>", { noremap = true })
map("n", "<A-h>", ":bprevious<cr>", { noremap = true })
map("n", "<A-l>", ":bnext<cr>", { noremap = true })

-- use jj instead of Esc (later add this)
-- inoremap{"jj", "<Esc><Esc>"}
-- inoremap{"Jj", "<Esc><Esc>"}
-- inoremap{"jJ", "<Esc><Esc>"}
-- inoremap{"JJ", "<Esc><Esc>"}

-- Sayonara
map("n", "<A-j>", ":Sayonara!<cr>", { noremap = true })
map("n", "<A-k>", ":Sayonara<cr>", { noremap = true })

-- Telescope
map('n', '<C-p>', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true, silent = true })
map('n', '<C-f>', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true, silent = true })

-- NvimTree
map('n', '<C-n>', '<cmd>NvimTreeToggle<cr>', { noremap = true })
