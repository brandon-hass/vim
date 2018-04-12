set nocompatible

" ---------- vim-plug ----------
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'fatih/vim-go'
Plug 'ngmy/vim-rubocop'

call plug#end()

" ---------- vim-colors-solarized ----------
syntax enable
set background=dark
colorscheme solarized

" ---------- NERDTree ----------
au VimEnter *  NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ---------- syntastic ---------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

" ---------- vim-go ----------
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_test_timeout= '45s'
let g:go_list_type = "quickfix"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>s <Plug>(go-implements)

" ---------- Vim ---------
filetype plugin indent on
set ts=2 sw=2 sts=2 expandtab

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

set number
set noswapfile
set dir=~/tmp
set clipboard=unnamed
set nowrap
