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
NeoBundle 'vim-scripts/Tagbar'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
"End NeoBundle Scripts-------------------------

set encoding=utf-8
set laststatus=2
set t_Co=256

" Vim Basic Settings
set number
set scrolloff=10
set ignorecase
set nostartofline
set hidden
set visualbell
set smartcase
set mouse=a
set cmdheight=1
set hlsearch
set incsearch
set timeoutlen=1000 ttimeoutlen=0
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set cursorline
set encoding=utf-8
silent execute '!mkdir -p $HOME/.vim/backup'
silent execute '!mkdir -p $HOME/.vim/swap'
if version >= 703
	set undodir=$HOME/.vim/undo//
endif
set backupdir=$HOME/.vim/backup//
set directory=~/.vim/swap//
set backup
set swapfile
set splitbelow
set splitright
map <Space> \
let maplocalleader = ","

" Style
colorscheme 256-grayvim
set background=dark
set guifont=Monospace\ 11

" Remaps
noremap U <c-r>
noremap <Leader>q :q<CR>
noremap Q :q<CR>
noremap q: :q
noremap W :w<CR>

" Tagbar Settings
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_sort = 0
noremap <F2> :TagbarToggle<CR>
