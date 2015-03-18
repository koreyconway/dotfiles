"--Begin NeoBundle Scripts--
if has('vim_starting')
	set nocompatible
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles
NeoBundle 'tpope/vim-sensible'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-scripts/Tagbar'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'h1mesuke/unite-outline'
if executable('ag')
	NeoBundle 'rking/ag.vim'
endif

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
"--End NeoBundle Scripts--

set encoding=utf-8
set laststatus=2
set t_Co=256

" Vim Basic Settings
set number
set scrolloff=10
set ignorecase
set smartcase
set hlsearch
set incsearch
set nostartofline
set hidden
set visualbell
set mouse=a
set cmdheight=1
set timeoutlen=1000 ttimeoutlen=0
filetype plugin on
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
set autochdir
map <space> \
let maplocalleader = ","

" Style
" colorscheme 256-grayvim
" set background=dark

" Command Line Window
noremap g: q:

" Escape
inoremap jj <esc>`^
" vnoremap jj <esc>

" Undo
noremap U <c-r>

" Saving and quitting
noremap <leader>q :q<cr>
noremap W :w<cr>
noremap Q :q<cr>
noremap q: :q<cr>

" Navigation
noremap <up> gk
noremap <down> gj
noremap <home> g<home>
noremap <end> g<end>

" Window Navigation
noremap <esc>h <c-w>h
noremap <esc>j <c-w>j
noremap <esc>k <c-w>k
noremap <esc>l <c-w>l
noremap ˙ <c-w>h
noremap ∆ <c-w>j
noremap ˚ <c-w>k
noremap ¬ <c-w>l
noremap <esc>\ :vsplit<cr>:Unite -no-split -buffer-name=buffer buffer<cr>
noremap <esc>- :split<cr>:Unite -no-split -buffer-name=buffer buffer<cr>
noremap « :vsplit<cr>:Unite -no-split -buffer-name=buffer buffer<cr>
noremap – :split<cr>:Unite -no-split -buffer-name=buffer buffer<cr>
nnoremap < :bp<cr>
nnoremap > :bn<cr>

" Line insertion
noremap o o<esc>
noremap O O<esc>
nnoremap <cr> i<cr><esc>

" Indentation
vnoremap > >`<v`>
vnoremap < <`<v`>

" Pasting
nnoremap p "0gp
nnoremap P "0P
vnoremap p "0gp
vnoremap P "0P
nnoremap gp "+gp
nnoremap gP "+P
vnoremap gp "+gp
vnoremap gP "+P

" Copying
noremap gy "+y
noremap gY "+Y
noremap yyy yyp
vnoremap y y`]
vnoremap Y Y`]

" Cut
nnoremap x "0d
nnoremap xx "0dd
vnoremap x "0d

" Search
vnoremap // y/<c-r>"<cr>

" Open Files/Buffers/Whatevers
if executable('ag')
	let g:unite_source_rec_async_command='ag --nocolor --nogroup --hidden -g ""'
endif
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\.jpe?g$|\.gif$|\.png$|\.pdf$')
map <leader>ff :Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
map <leader>fb :Unite -no-split -buffer-name=buffer buffer<cr>
map <leader>fr :Unite -no-split -buffer-name=mru file_mru<cr>
map <leader>fy :Unite -no-split -buffer-name=yank history/yank<cr>
map <f4> :Unite -no-split -buffer-name=buffer buffer<cr>

" Tagbar Settings
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_sort = 0
noremap <f2> :TagbarToggle<cr>

