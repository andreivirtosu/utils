--vim.opt.runtimepath:remove(vim.fn.expand('~/.config/nvim'))
--vim.opt.packpath:remove(vim.fn.expand('~/.local/share/nvim/site'))
--vim.opt.runtimepath:append(vim.fn.expand('~/projects/nvim-conf'))
--vim.opt.packpath:append(vim.fn.expand('~/projects/nvim-conf'))


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
vim.opt.termguicolors = true
vim.opt.updatetime = 300
--vim.opt.signcolumn = "no"
vim.o.cursorline = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.swapfile = false
vim.opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor


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
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
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
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "williamboman/mason.nvim" }
  use { "neoclide/coc.nvim", branch = 'release'}
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use 'kdheepak/lazygit.nvim'
  use 'udalov/kotlin-vim'
  use { "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
    end
  }
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
  }
  use({ "wesleimp/stylua.nvim" })
  use {'preservim/tagbar'}
  use { 'lewis6991/gitsigns.nvim', tag = 'release' }
  use { 'moll/vim-bbye' }
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
  }
  --use { 'anuvyklack/pretty-fold.nvim',
  -- config = function()
  --    require('pretty-fold').setup()
  -- end
  --}
  use {
    'jedrzejboczar/toggletasks.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'akinsho/toggleterm.nvim',
--        'nvim-telescope/telescope.nvim/',
    },
    -- To enable YAML config support
    rocks = 'lyaml',
  }
  --use {
  --  'stevearc/overseer.nvim',
  --  config = function() require('overseer').setup() end
  --}
  --use {
  --'EthanJWright/vs-tasks.nvim',
  --  requires = {
  --    'nvim-lua/popup.nvim',
  --    'nvim-lua/plenary.nvim',
  --    'nvim-telescope/telescope.nvim'
  --  }
  --}

  -- use {
  --   "windwp/nvim-autopairs"
  --   --, config = function() require("nvim-autopairs").setup {} end
  -- }
  -- use { "terrortylor/nvim-comment", 
  --   config = function() 
  --     require('nvim_comment').setup() end
  -- }
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  --use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  }
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      -- you'll need at least one of these
      -- {'nvim-telescope/telescope.nvim'},
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup()
    end,
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  if install_plugins then
    require('packer').sync()
  end

end)

if install_plugins then
  return
end

--vim.cmd('colorscheme habamax')
--vim.cmd('colorscheme rose-pine')
require('rose-pine').setup({
  dark_variant = 'moon'
})

-- require("vstask").setup({
--   cache_json_conf = false, -- don't read the json conf every time a task is ran
--   cache_strategy = "last", -- can be "most" or "last" (most used / last used)
--   use_harpoon = false, -- use harpoon to auto cache terminals
--   telescope_keys = { -- change the telescope bindings used to launch tasks
--       vertical = '<C-v>',
--       split = '<C-p>',
--       tab = '<C-t>',
--       current = '<CR>',
--   },
--   autodetect = { -- auto load scripts
--     npm = "on"
--   },
--   terminal = 'toggleterm',
--   term_opts = {
--     vertical = {
--       direction = "vertical",
--       size = "80"
--     },
--     horizontal = {
--       direction = "horizontal",
--       size = "10"
--     },
--     current = {
--       direction = "float",
--     },
--     tab = {
--       direction = 'tab',
--     }
--   }
-- })

--require('overseer').setup()

require("bufferline").setup{
  options = {
    numbers = "both",
    diagnostics = "coc",
    truncate_names = false,
    -- rest of config ...

    --- count is an integer representing total count of errors
    --- level is a string "error" | "warning"
    --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
    --- this should return a string
    --- Don't get too fancy as this function will be executed a lot
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end

  }
}

require('lualine').setup({
  options = {
    icons_enabled = false,
    section_separators = '',
    component_separators = ''
  }
})

require("nvim-tree").setup({
  open_on_setup = true,
  open_on_tab = true,
  view = {
    adaptive_size = false,
    relativenumber = true
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = "none" 
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false
  },
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {
 --     "fzf", 
   -- "git", 
    "help"
  },
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = false,
    }
  }
})

require("toggleterm").setup{}
require("mason").setup()
require("gitsigns").setup()
-- require("refactoring").setup({
--   prompt_func_return_type = {
--     cpp = true,
--     c = true,
--     h = true,
--     hpp = true,
--     cxx = true
--   },
--   prompt_func_param_type = {
--     cpp = true,
--     c = true,
--     h = true,
--     hpp = true,
--     cxx = true
--   },
-- })

 require'nvim-treesitter.configs'.setup {
   highlight = {
     enable = true,
     additional_vim_regex_highlighting = false,
   },
 }


-- require('toggletasks').setup({
-- })
require('telescope').load_extension('toggletasks')
require('telescope').load_extension('neoclip')
--require('telescope').load_extension('file_browser')

require('Comment').setup({
})

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- local remap = vim.api.nvim_set_keymap
-- local npairs = require('nvim-autopairs')
-- npairs.setup({map_cr=false})
--
-- -- skip it, if you use another global object
-- _G.MUtils= {}
--
-- MUtils.completion_confirm=function()
--   if vim.fn.pumvisible() ~= 0  then
--     --return vim.fn[[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]]
--     --return vim.fn["coc#pum#confirm"]()
--     vim.fn["coc#_select_confirm"]()
--   else
--     return npairs.autopairs_cr()
--   end
-- end
--remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
--------------------

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  --vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  --vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-w>h', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-w>j', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-w>k', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-w>w', [[<Cmd>wincmd w<CR>]], opts)

  -- switch to normal-mode
  vim.keymap.set({'t'},'<Esc><Esc>', '<C-\\><C-n>', opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
vim.keymap.set({'n', 't'},'<leader>t', '<cmd>1ToggleTerm size=20 direction=float <cr>')
--vim.keymap.set({'n', 't'},'<leader>z', '<cmd>4ToggleTerm size=10 direction=float <cr>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local keyset = vim.keymap.set
-- Auto complete
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)


-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)


local function cmd(command)
  return table.concat({ '<Cmd>', command, '<CR>' })
end

keyset('n', '<C-w>z', cmd 'WindowsMaximize')
keyset('n', '<C-w>_', cmd 'WindowsMaximizeVertically')
keyset('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally')
keyset('n', '<C-w>=', cmd 'WindowsEqualize')
keyset('n', '<C-w>=', cmd 'WindowsEqualize')

--nnoremap <silent> gb :BufferLinePick<CR>,
keyset("n", "<leader>bb", cmd 'BufferLinePick' )
keyset("n", "<leader>bd", cmd 'BufferLinePickClose' )
keyset("n", "<C-k>", cmd 'BufferLineCycleNext' )
keyset("n", "<C-j>", cmd 'BufferLineCyclePrev' )

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,globals"

keyset('n', '<leader>1', cmd 'BufferLineGoToBuffer 1') 
keyset('n', '<leader>2', cmd 'BufferLineGoToBuffer 2') 
keyset('n', '<leader>3', cmd 'BufferLineGoToBuffer 3') 
keyset('n', '<leader>4', cmd 'BufferLineGoToBuffer 4') 
keyset('n', '<leader>5', cmd 'BufferLineGoToBuffer 5') 
keyset('n', '<leader>6', cmd 'BufferLineGoToBuffer 6') 
keyset('n', '<leader>7', cmd 'BufferLineGoToBuffer 7') 
keyset('n', '<leader>8', cmd 'BufferLineGoToBuffer 8') 
keyset('n', '<leader>9', cmd 'BufferLineGoToBuffer 9') 
keyset('n', '<leader>$', cmd 'BufferLineGoToBuffer $') 

keyset('n', '<F8>', cmd 'TagbarToggle') 
keyset('n', '<M-o>', cmd 'CocCommand clangd.switchSourceHeader') 

-- testing
--keyset('n', '<leader>x', cmd "lua require('telescope.builtin').find_files({default_text='constraint'})<cr>")

-- Symbol renaming.
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})
-- Formatting selected code.
keyset({"x","n"}, "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

-- Apply AutoFix to problem on the current line.
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", {silent = true, nowait = true})

-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- GoTo code navigation.
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Add `:Format` command to format current buffer.
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer.
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer.
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support.
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline.
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

keyset("n", "<leader>n", cmd "NvimTreeFindFile!")
keyset("n", "<leader>v", cmd "NvimTreeToggle")


-- vs-tasks
--keyset("n", "<leader>ra", cmd "lua require('telescope').extensions.vstask.tasks(require('telescope.themes').get_dropdown())")



--Change comments to //
-- function nvim_create_augroups(definitions)
--     for group_name, definition in pairs(definitions) do
--         vim.api.nvim_command("augroup " .. group_name)
--         vim.api.nvim_command("autocmd!")
--         for _, def in ipairs(definition) do
--             local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
--             vim.api.nvim_command(command)
--         end
--         vim.api.nvim_command("augroup END")
--     end
-- end
--
--
-- local autocmds = {
--   fix_commentstring = {
--     {"Bufenter", "*.cpp,*.h", "set commentstring=//%s"}
--   }
-- }
--
-- nvim_create_augroups(autocmds)

--vim.cmd('Gitsigns toggle_current_line_blame')
