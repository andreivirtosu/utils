-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ','

vim.opt.rnu = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'joshdick/onedark.vim'
  --use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'https://github.com/ms-jpq/chadtree'
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })
  use "EdenEast/nightfox.nvim"

if install_plugins then
 require('packer').sync()
  end
end)

if install_plugins then
  return
end

vim.opt.termguicolors = true
--vim.cmd('colorscheme habamax')
vim.cmd('colorscheme rose-pine')

require('lualine').setup({
  options = {
    icons_enabled = false,
    section_separators = '',
    component_separators = ''
  }
})

require("toggleterm").setup{}

--nnoremap <leader>v <cmd>CHADopen<cr>
vim.keymap.set({'n'},'<leader>v', '<cmd>CHADopen<cr>')

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  --vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  --vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-w>h', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-w>j', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-w>k', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-w>w', [[<Cmd>wincmd w<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

vim.keymap.set({'n', 't'},'<leader>t', '<cmd>ToggleTerm size=20 direction=float <cr>')
