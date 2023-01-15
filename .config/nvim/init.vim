call plug#begin('~/.vim/plugged')

Plug 'crusoexia/vim-monokai'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'fladson/vim-kitty'
call plug#end()

" Enable true color
set termguicolors
" Enable italics, Make sure this is immediately after colorscheme
" https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
highlight Comment cterm=italic gui=italic

"enable line numbers in nerdtree
let NERDTreeShowLineNumbers = 1
autocmd FileType nerdtree setlocal number

"enable deoplete at startup
let g:deoplete#enable_at_startup = 1

"copy to system clipboard (`+` regsiter) by default
set clipboard=unnamedplus

filetype plugin indent on

syntax on
set t_Co=256
colorscheme monokai
hi Normal guibg=NONE ctermbg=NONE

set number relativenumber

set ignorecase smartcase

set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set shiftround

set showcmd

set hlsearch

set ttyfast
set lazyredraw

set splitbelow
set splitright

set cursorline
set wrapscan
set laststatus=2 
set report=0

" mouse scroll
set mouse=a

map <Tab> :NERDTreeToggle<CR>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
