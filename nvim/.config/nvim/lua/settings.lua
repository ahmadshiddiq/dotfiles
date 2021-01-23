local command = vim.api.nvim_command

local apply = function(option)
  for key, value in pairs(option) do
    if value == true then
      command('set ' .. key)
    elseif value == false then
      command(string.format('set no%s', key))
    else
      command(string.format('set %s=%s', key, value))
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
        
  -- number
	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2,

  -- string
  mouse = 'a',
}

apply(options)
