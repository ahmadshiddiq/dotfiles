local remap = vim.api.nvim_set_keymap

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Telescope
remap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true, silent = true })
remap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true, silent = true })
