"Begin NeoBundle Scripts-----------------------------
if has('vim_starting')
	set nocompatible
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'tpope/vim-sensible'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'bling/vim-airline'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
"End NeoBundle Scripts-------------------------

set encoding=utf-8
set laststatus=2
set t_Co=256

" Vim Basic Settings
"set relativenumber
set number
set scrolloff=10
set ignorecase
set nostartofline
set hidden
set visualbell
set smartcase
set mouse=a
set cmdheight=2
set hlsearch
set incsearch
set timeoutlen=1000 ttimeoutlen=0
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set cursorline
"set autowrite
set encoding=utf-8
silent execute '!mkdir -p $HOME/.vim/backup'
silent execute '!mkdir -p $HOME/.vim/swap'
silent execute '!mkdir -p $HOME/.vim/undo'
set undodir=$HOME/.vim/undo//
set backupdir=$HOME/.vim/backup//
set directory=~/.vim/swap//
set backup
set swapfile
set splitbelow
set splitright
map <Space> \
let maplocalleader = ","
noremap <C-r> :nohls<CR><C-l>

" Theme
colorscheme 256-grayvim
set background=dark

" Font
set guifont=Monospace\ 11
