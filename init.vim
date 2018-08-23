call plug#begin('~/.local/share/nvim/plugged')
" Plug 'vim-syntastic/syntastic'
 Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
 Plug 'mhartington/oceanic-next'
" Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'eagletmt/neco-ghc', {'for': 'haskell'}
 Plug 'vim-airline/vim-airline'
 Plug 'w0rp/ale'
 Plug 'sbdchd/neoformat'
 Plug 'alx741/vim-hindent'
 Plug 'frigoeu/psc-ide-vim'
 Plug 'lervag/vimtex'
 Plug 'Shougo/vimproc'
 Plug 'nbouscal/vim-stylish-haskell'
call plug#end()

" Use neco-ghc for completion
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" PureScript linting
let g:psc_ide_syntastic_mode = 1

let g:vimtex_latexmk_options='-pdf -pdflatex="xelatex -synctex=1 \%S \%O" -verbose -file-line-error -interaction=nonstopmode'
let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_linters = { 'haskell': ['stack-ghc'] }

autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>

" Just for screen-sharing
let g:hindent_line_length = 55

if (has("termguicolors"))
 set termguicolors
endif

set expandtab
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set nohlsearch
set tags=tags
set splitright

syntax enable
filetype on
filetype plugin indent on
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

nnoremap <SPACE> <Nop>
let mapleader=" "

noremap <Leader>d :ALEFix<CR>

