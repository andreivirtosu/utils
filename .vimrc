set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t'

Plugin 'https://github.com/kien/ctrlp.vim'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
"
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/scrooloose/nerdcommenter'
Plugin 'https://github.com/rosenfeld/rgrep.vim'
Plugin 'https://github.com/Valloric/YouCompleteMe'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/Townk/vim-autoclose'

" colors
Plugin 'https://github.com/nanotech/jellybeans.vim'
Plugin 'https://github.com/hachy/eva01.vim'
Plugin 'https://github.com/MPiccinato/wombat256'
"Plugin 'https://github.com/nilium/vimrc'
Plugin 'https://github.com/toupeira/vim-desertink'
"Plugin 'https://github.com/freeo/vim-kalisi'
Plugin 'https://github.com/vim-scripts/LustyExplorer'


"Bundle 'christoomey/vim-run-interactive'
Plugin 'NLKNguyen/papercolor-theme'
"Bundle "yearofmoo/Vim-Darkmate"
"Bundle "morhetz/gruvbox"

Plugin 'JesseKPhillips/d.vim'

set background=dark

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

syntax on
set t_Co=256

"colorscheme eva01
"colorscheme desert

"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p   " move cursor

set expandtab
set tabstop=4
set smartindent
set shiftwidth=4

" start NERDTree on start-up and focus active window
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>

let NERDTreeIgnore = ['\.pyc$']
"This option forces vim to source .vimrc file if it present in working directory, thus providing a place to store project-specific configuration.
set exrc
set secure

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

autocmd CompleteDone * pclose

"CtrlP options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_working_path_mode = 0

"set colorcolumn=100
"highlight colorcolumn ctermbg=7
"set cursorline
"set nowrap

function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

set hidden

"when you press <f4> you will be shown the list of buffers and prompted for the one to open
map <F4> :ls<CR>:buffer<space>

nmap <F7> :w<CR>:! cd ~/sources/cmake_proj/olympia/build && na

nnoremap <leader>ri :RunInInteractiveShell<space>

set nu

"Enable Project settings
set exrc
set secure

au FocusLost * silent! wa

set rnu

