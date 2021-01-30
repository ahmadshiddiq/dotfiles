vim.cmd[[packadd nvim-bufferline.lua]]

require'bufferline'.setup{
  options = {
    diagnostics = "nvim_lsp"
  }
}
