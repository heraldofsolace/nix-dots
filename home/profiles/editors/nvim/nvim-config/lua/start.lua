local execute = vim.api.nvim_command
local fn = vim.fn

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost configs.lua PackerCompile' -- Auto compile when there are changes in configs.lua

require('plugins')

require('core.keys')
require('core.styles')
require('core.opts')