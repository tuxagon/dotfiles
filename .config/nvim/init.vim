call plug#begin('~/.vim/plugs')

Plug 'airblade/vim-gitgutter'
Plug 'alx741/vim-stylishask', { 'for': 'haskell' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'copy/deoplete-ocaml', { 'for': 'ocaml' }
Plug 'dan-t/vim-hsimport', { 'for': 'haskell' }
Plug 'dense-analysis/ale', { 'for': 'elm' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'let-def/ocp-indent-vim', { 'for': 'ocaml' }
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'neomake/neomake'
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'parsonsmatt/intero-neovim', { 'for': 'haskell' }
Plug 'pbogut/deoplete-elm', { 'for': 'elm' }
Plug 'rakr/vim-one', { 'as': 'one' }
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

call plug#end()

syntax on
filetype plugin indent on

" auto start nerdtree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" auto start nerdtree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" quit work as expected if after entering :q the only window left open is nerdtree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" deoplete setup
let g:deoplete#enable_at_startup = 1

" neovim setup
set number
set showmatch
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set cursorline
set backspace=indent,eol,start
set complete-=i
set laststatus=2
set ruler
set wildmenu
set incsearch
set showmatch
set mouse=a
set history=1000
set ignorecase
set smartcase
set gdefault
set clipboard+=unnamedplus
set splitbelow
set splitright
set autoread

if !&scrolloff
  set scrolloff=3 " show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " show next 5 columns while side-scrolling.
endif
set nostartofline

" tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list

" use <C-L> to clear the highlighting of :set hlsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" search and replace
nmap <Leader>s :%s//g<Left><Left>

nmap <Leader>lo :lopen<CR>
nmap <Leader>lc :lclose<CR>

" relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" use Q to execute default register
nnoremap Q @q

" configure vim-one colorscheme
let g:airline_theme='one'
let g:one_allow_italics = 1

if (has("termguicolors"))
  set termguicolors
endif

colorscheme one
set background=dark

" airline theme
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" polyglot setup
let g:polyglot_disabled = ['elm']

" fzf setup
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~40%' }

let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir = '~/.local/share/fzf-history'

" nerdtree setup
map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden = 1

let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""

" nerdtree file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" grepper setup
nnoremap <leader>ga :Grepper<cr>
nnoremap <leader>gb :Grepper -buffer<cr>

" gitgutter setup
map <C-g> :GitGutterToggle<CR>

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" haskell setup
let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2

augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Automatically reload on save
  au BufWritePost *.hs InteroReload

  " Lookup the type of expression under the cursor
  au FileType haskell nmap <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell nmap <silent> <leader>T <Plug>InteroType
  " Insert type declaration
  au FileType haskell nnoremap <silent> <leader>ni :InteroTypeInsert<CR>
  " Show info about expression or type under the cursor
  au FileType haskell nnoremap <silent> <leader>i :InteroInfo<CR>

  " Open/Close the Intero terminal window
  au FileType haskell nnoremap <silent> <leader>nn :InteroOpen<CR>
  au FileType haskell nnoremap <silent> <leader>nh :InteroHide<CR>

  " Reload the current file into REPL
  au FileType haskell nnoremap <silent> <leader>nf :InteroLoadCurrentFile<CR>
  " Jump to the definition of an identifier
  au FileType haskell nnoremap <silent> <leader>ng :InteroGoToDef<CR>
  " Evaluate an expression in REPL
  au FileType haskell nnoremap <silent> <leader>ne :InteroEval<CR>

  " Start/Stop Intero
  au FileType haskell nnoremap <silent> <leader>ns :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>nk :InteroKill<CR>

  " Reboot Intero, for when dependencies are added
  au FileType haskell nnoremap <silent> <leader>nr :InteroKill<CR> :InteroOpen<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>nt :InteroSetTargets<CR>

  au FileType haskell nnoremap <silent> <leader>nb :InteroSend hspec spec<CR>
augroup END

" Enable type information on hover (when holding cursor at point for ~1 second).
let g:intero_type_on_hover = 1

" ctrl-{hjkl} for navigating out of terminal panes
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" stylishhaskell setup
let g:stylishask_on_save = 1

" hsimport setup
au FileType haskell nnoremap <silent> <leader>ims :HsimportSymbol<CR>
au FileType haskell nnoremap <silent> <leader>imm :HsimportModule<CR>


" neomake setup
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)

" tabular setup
autocmd FileType haskell nnoremap <leader>= :Tabularize /=<CR>
autocmd FileType haskell nnoremap <leader>- :Tabularize /-><CR>
autocmd FileType haskell nnoremap <leader>, :Tabularize /,<CR>
autocmd FileType haskell nnoremap <leader># :Tabularize /#-}<CR>

" supertab setup
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

" opam configuration
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "set rtp^=" . g:opamshare . "/ocp-indent/vim"
