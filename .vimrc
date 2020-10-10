call plug#begin('~/.vim/plugged')
 Plug 'vim-scripts/ReplaceWithRegister'
 Plug 'kana/vim-textobj-user'
 Plug 'Julian/vim-textobj-variable-segment'
 Plug 'vim-airline/vim-airline'
 Plug 'w0rp/ale'
 Plug 'vim-airline/vim-airline-themes'
" Plug 'nbouscal/vim-stylish-haskell'
" Plug 'alx741/vim-hindent'
 Plug 'vimwiki/vimwiki'
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
 Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'tpope/vim-fugitive'
 Plug 'neovimhaskell/haskell-vim'
" Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
 Plug 'purescript-contrib/purescript-vim'
call plug#end()

let g:ale_linters_explicit = 1
let g:ale_fixers =
      \  { 'javascript': ["eslint"]
      \  , 'json': ["prettier"]
      \  , 'html': ["prettier"]
      \  }

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

syntax on
filetype on
filetype plugin indent on
set nocompatible

" Change cursor for INSERT mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Squash delay after pressing ESC
set timeoutlen=1000 ttimeoutlen=0

set background=light
set expandtab
set number
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
" noremap <Leader>o :NERDTreeToggle<CR>
" noremap <Leader>b :Buffer<CR>
map <Leader>[ :tabprevious<CR>
map <Leader>] :tabnext<CR>
" map <Leader><Leader>hl :!hlint %<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-p> :Rg<CR>

" Haskell
nnoremap <Leader>le ggO{-# LANGUAGE  #-}<esc>3hi

set list
set listchars=nbsp:¬,tab:>-,precedes:<,extends:>,trail:·

" Nicer way to move between windows
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

" Comments in italics
highlight Comment cterm=italic

" Gutter color
highlight LineNr ctermbg=Black

" Highlight in Visual mode
highlight Visual cterm=reverse ctermbg=NONE

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

" Use Markdown syntax for Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" *********************************************
" CoC stuff ***********************************
" *********************************************

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
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

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

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

" Don't remap tab for vimwiki
let g:vimwiki_table_mappings = 0

" Open NERDTree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close editor if only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

