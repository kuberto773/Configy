syntax on 
set backspace=indent,eol,start " backspace over everything in insert mode
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
set nowrap
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

" aby som nepocuval beeps
set visualbell
set t_vb=

" language server bude bezat pre coc-nvim, ALE sa do neho integruje
let g:ale_disable_lsp = 1

let mapleader = 'q'

call plug#begin('~/.vim/plugged')
" Tagy, zatial moc nevyuzivam, zakomentovane kvoli rovnakemu mappingu
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

" indent pre python
" Plug 'vim-scripts/indentpython.vim'


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



let g:ale_linters = {'python': ['flake8']}
let g:ale_lint_on_text_changed = 1


inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
