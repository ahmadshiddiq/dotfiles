-- Basic settings
local cmd = vim.api.nvim_command

local set = function(option)
  for key, value in pairs(option) do
    if value == true then
      cmd('set ' .. key)
    elseif value == false then
      cmd(string.format('set no%s', key))
    else
      cmd(string.format('set %s=%s', key, value))
    end
  end
end

local options = {
	-- boolean
	smarttab = true,
	expandtab = true,
	autoindent = true,
	smartindent = true,
  number = true,
  relativenumber = true,
  splitright = true,
  splitbelow = true,
  hidden = true,
  termguicolors = true,
        
  -- number
	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2,
  cmdheight = 2,
  colorcolumn = 80,
  scrolloff = 8,

  -- string
  mouse = 'a',
  encoding = 'UTF-8',
  completeopt = 'menu,menuone,noselect',
}

set(options)

-------------------------------------------------------------------------------

-- Interface settings
cmd('colorscheme gruvbox')
cmd('let g:gruvbox_contrast_dark = "hard"')
cmd('let g:gruvbox_italic = 1')
