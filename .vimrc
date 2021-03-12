set number
syntax on 
set ts=4 softtabstop=4
set expandtab
set sw=4
set clipboard=unnamedplus
set showcmd
set smartindent
set showcmd
set nowrap
set noswapfile
set incsearch
set colorcolumn=120
set nohlsearch
set hidden
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set signcolumn=yes

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'jiangmiao/auto-pairs'
call plug#end()



nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR> 
nnoremap <C-n> :NERDTree<CR>


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_java_javac_classpath = "/home/jakub/codes/cviko3/src"
