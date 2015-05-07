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
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mbbill/undotree'
NeoBundle 'tomtom/tcomment_vim'
if v:version > 703 || (v:version == 703 && has('patch584'))
	NeoBundle 'Valloric/YouCompleteMe'
endif
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'Chiel92/vim-autoformat'
if executable('ranger')
	NeoBundle 'koreyconway/ranger.vim'
endif
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
if has("persistent_undo")
	set undodir=$HOME/.vim/undo//
	set undofile
endif
set backupdir=$HOME/.vim/backup//
set directory=~/.vim/swap//
set backup
set swapfile
set splitbelow
set splitright
set autochdir
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
map <space> \
let maplocalleader = ","

" Style
" colorscheme 256-grayvim
" set background=dark

" Command Line Window
noremap g: q:

" Visual Mode Specials
vnoremap q <esc>
vnoremap $ $h

" Escape
inoremap jj <esc>`^
nnoremap q <nop>

" Undo
noremap U <c-r>
noremap <leader>u :UndotreeToggle<cr>:UndotreeFocus<cr>

" Saving and Quitting
noremap <leader>q :q<cr>
noremap W :w<cr>
noremap Q :q<cr>
nnoremap q: :q<cr>

" Navigation
set whichwrap+=<,>,h,l,[,],~
noremap <up> gk
noremap <down> gj
noremap k gk
noremap j gj
noremap <home> g<home>
noremap <end> g<end>

" Easy Motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
map f <Plug>(easymotion-bd-f)
map t <Plug>(easymotion-bd-t)
map <leader>fj <Plug>(easymotion-j)
map <leader>fk <Plug>(easymotion-k)
map <leader>fh <Plug>(easymotion-linebackward)
map <leader>fl <Plug>(easymotion-lineforward)
map <leader>fw <Plug>(easymotion-bd-w)
map <leader>fe <Plug>(easymotion-bd-e)

" Window Navigation
noremap <esc>h <c-w>h
noremap <esc>j <c-w>j
noremap <esc>k <c-w>k
noremap <esc>l <c-w>l
noremap <leader>\ :vsplit<cr>:Unite -no-split -buffer-name=mru file_mru<cr>
noremap <leader>- :split<cr>:Unite -no-split -buffer-name=mru file_mru<cr>
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

" Text modifiers
noremap gU gu
noremap gu gU

" Commenting
nmap <leader>c gcc
vmap <leader>c gcgv

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
noremap gy "+y`]
noremap gY "+Y`]
vnoremap y y`]
vnoremap Y Y`]
nnoremap yyy yyp

" Cut
nnoremap x "0d
nnoremap xx "0dd
nnoremap XX :let @0=@0.getline('.')<cr>"_dd
vnoremap x "0d

" Search
set hlsearch
set incsearch
vnoremap // y/<c-r>"<cr>

" Open Files/Buffers/Whatevers
if executable('ag')
	let g:unite_source_rec_async_command='ag --nocolor --nogroup --hidden -g ""'
endif
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\.jpe?g$|\.gif$|\.png$|\.pdf$')
map <leader>of :Unite -no-split -buffer-name=files -start-insert file_rec/async<cr>
map <leader>ob :Unite -no-split -buffer-name=buffer buffer<cr>
map <leader>or :Unite -no-split -buffer-name=mru file_mru<cr>
map <leader>oy :Unite -no-split -buffer-name=yank history/yank<cr>
map <f4> :Unite -no-split -buffer-name=buffer buffer<cr>
nnoremap <leader>r :Ranger<cr>
nnoremap gw :bw<cr>

" Tagbar Settings
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_sort = 0
noremap <f2> :TagbarToggle<cr>

" Autoformat Settings
nnoremap <Leader><Space> :Autoformat<CR>

