local remap = vim.api.nvim_set_keymap

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Main Configuration
remap("n", "<Leader>r", "<CMD>luafile %<CR>", { noremap = true })

-- Telescope
remap('n', '<C-p>', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true, silent = true })
remap('n', '<C-f>', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true, silent = true })
