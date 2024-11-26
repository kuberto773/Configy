syntax on 
set textwidth=0
set nocompatible
set relativenumber
set autowrite
set wildmenu
set number
set ts=4 softtabstop=4
set expandtab
set sw=4
set clipboard=unnamedplus
set showcmd
set smartindent
set autoindent
set showcmd
" set nowrap
set noswapfile
set incsearch
set colorcolumn=200
set nohlsearch
set hidden
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=6
set sidescroll=5
set signcolumn=yes
set background=dark
set cmdheight=2
set whichwrap=b,s,<,>,[,]
set statusline=

call plug#begin('~/.vim/plugged')

" plugin na fuzzy search
Plug 'junegunn/fzf.vim'


" Tagy, zatial moc nevyuzivam
"Plug 'lyuts/vim-rtags'
"
" Prehladavanie file systemu
Plug 'scrooloose/nerdtree'

" Automaticke doplnenie dalsej zatvorky / uvodzovky
Plug 'jiangmiao/auto-pairs'

" Colorschemy
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'tomasiser/vim-code-dark'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'

" Autocompleter + mozno vykonavat s nim plno veci, ale primarne mi sluzi ako autocompleter, vyuzival LSP(Language server protocol)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
 
"Plug 'vim-scripts/AutoComplPop' .. automaticke ukazovanie autocompleteru, cisto len cez vim

" Syntax validator, linter, ... najma pre nasm
Plug 'dense-analysis/ale'
call plug#end()


set t_Co=256
colorscheme gruvbox

"Pohybovanie sa medzi splitami, pomocou altu
map  <silent> <A-Up> <Esc>:wincmd k<CR>
map  <silent> <A-Down> <Esc>:wincmd j<CR>
map  <silent> <A-Left> <Esc>:wincmd h<CR>
map  <silent> <A-Right> <Esc>:wincmd l<CR> 

map <C-n> <Esc>:NERDTree<CR>

map <F2> GoDate: <Esc>:read !date<CR>kJ

" Aby mohol ale rozpoznavat nasm 
autocmd BufNewFile,BufRead *.asm set filetype=nasm
set path+=**
set path+=;

"set completeopt=menuone
set pumheight=10
set shortmess+=c

set laststatus=2

map <C-f> <Esc>:Files <CR> 
map <C-h> <Esc>:History<CR> 

"Moving lines
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv
nmap <C-k> :m +1<CR>
nmap <C-j> :m -2<CR>

"vnoremap <C-q> :w !tac<CR>
vnoremap <C-q> :!xargs nmap -T5 -F<CR>

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

