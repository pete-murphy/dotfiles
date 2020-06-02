call plug#begin('~/.vim/plugged')
 Plug 'vim-scripts/ReplaceWithRegister'
 Plug 'kana/vim-textobj-user'
 Plug 'Julian/vim-textobj-variable-segment'
 Plug 'vim-airline/vim-airline'
 Plug 'w0rp/ale'
 Plug 'vim-airline/vim-airline-themes'
" Plug 'nbouscal/vim-stylish-haskell'
" Plug 'alx741/vim-hindent'
 Plug 'chriskempson/base16-vim'
 Plug 'tpope/vim-repeat'
 Plug 'wellle/targets.vim'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-unimpaired'
 Plug '/usr/local/opt/fzf'
 Plug 'junegunn/fzf.vim'
 Plug 'prabirshrestha/async.vim'
 Plug 'prabirshrestha/vim-lsp'
 Plug 'preservim/nerdtree'
 Plug 'junegunn/goyo.vim'
 Plug 'godlygeek/tabular'
 Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

" let g:deoplete#enable_at_startup = 1

let g:ale_linters_explicit = 1
" let g:ale_linters = { 'haskell': ['hlint'] }
let g:ale_fixers = { 'javascript': ["eslint"], 'html': ["prettier"] }
" let g:ale_sign_column_always = 1
" let g:haskell_hlint_executable


" ghcide
" au User lsp_setup call lsp#register_server({
"     \ 'name': 'ghcide',
"     \ 'cmd': {server_info->['/Users/peter/.local/bin/ghcide', '--lsp']},
"     \ 'whitelist': ['haskell'],
"     \ })

syntax enable
filetype on
filetype plugin indent on

" Change cursor for INSERT mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Squash delay after pressing ESC
set timeoutlen=1000 ttimeoutlen=0

set background=light
set expandtab
set number
" set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set hlsearch
set splitright
set wildmenu
set wildmode=longest:full,full

" Make backspace behave as expected
set backspace=indent,eol,start

" Keep color scheme in sync with terminal
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Comments in italics
highlight Comment cterm=italic

" Gutter color
highlight LineNr ctermbg=Black

" No annoying sound on errors
set noerrorbells
set novisualbell
set tm=500
set t_vb=
set belloff=all

" Spacebar as leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" Quick-save
nmap <Leader>w :w<CR>

noremap <Leader>d :ALEDetail<CR>
noremap <Leader>f :ALEFix<CR>
" noremap <Leader>x :Vexplore<CR>
" noremap <Leader>o :Files<CR>
noremap <Leader>o :NERDTreeToggle<CR>
noremap <Leader>b :Buffer<CR>
noremap <Leader>p :Rg<CR>
noremap [[ :bp<CR>
noremap ]] :bn<CR>
map <Leader><Leader>hl :!hlint %<CR>

" set signcolumn=yes
" hi SignColumn ctermbg=black

set list
set listchars=nbsp:¬,tab:>-,precedes:<,extends:>,trail:·

" Smart way to move between windows
map , <C-W>w
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>h <C-W>h
map <Leader>l <C-W>l

" Yank to end of line
nnoremap Y y$

" Jump to start and end of line using the home row keys
map H ^
map L $

" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" SpellBad/SpellCap defaults are hideous with current theme
hi clear SpellBad
hi SpellBad cterm=italic
hi clear SpellCap
hi SpellCap cterm=italic

set tags=tags;/

set foldmethod=indent
set foldlevelstart=99

" Clear recent highlight (by clearing search register)
nnoremap <Leader><esc> :let @/=""<return>

