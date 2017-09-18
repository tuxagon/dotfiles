" Kenneth Bogner

" Notes
" - http://www.stephendiehl.com/posts/vim_2016.html
" - font: https://github.com/belluzj/fantasque-sans
" - <leader> = \

" Colors -----------------------------------------------------------------------
colorscheme jellybeans  " jellybeans colorscheme

" Misc -------------------------------------------------------------------------
syntax on  " enable syntax processing
filetype plugin indent on  " load filetype-specific indent files

set nocompatible  " turns off vi compatibility
set number  " show line numbers
set showcmd  " show command in bottom bar
set cursorline  " highlight current line
set nowrap  " turns off line wrapping
set showmode  " show what the current mode is
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2  " number of spaces in tab when editing
set shiftwidth=2
set expandtab  " tabs are spaces
set incsearch  " search as characters are entered
" set hlsearch  " highlight matches
set showmatch  " highlight matching [{()}]
set mouse=a
set history=1000
set clipboard=unnamedplus,autoselect

set foldenable  " enable folding
set foldlevelstart=10  " open most folds by default
set foldnestmax=10  " 10 nested fold max
set foldmethod=indent  " fold based on indent level
" space open/closes folds
nnoremap <space> za

" highlight last inserted text
nnoremap gV `[V`]

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu  " visual autocomplete for command menu
set completeopt+=longest
set lazyredraw  " redraw only when we need to

" save session
nnoremap <leader>s :mksession<CR>

" turn off search highlight
" nnoremap <leader><space> :nohlsearch<CR>

set t_Co=256

set cmdheight=1

" custom backup settings
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" map to custom function
nnoremap <leader>l :call ToggleNumber()<CR>

" use pathogen
execute pathogen#infect()
" == INSTALLED PLUGINS ==
" ag.vim
"   - https://github.com/ggreer/the_silver_searcher
"   - https://github.com/epmatsw/ag.vim
" ctrlp.vim: https://github.com/kien/ctrlp.vim
" elm-vim: https://github.com/ElmCast/elm-vim
" ghcmod-vim: https://github.com/eagletmt/ghcmod-vim
" neco-ghc: https://github.com/eagletmt/neco-ghc
" neocomplete.vim: https://github.com/Shougo/neocomplete.vim
" nerdcommenter: https://github.com/scrooloose/nerdcommenter
" nerdtree: https://github.com/scrooloose/nerdtree
" supertab: https://github.com/ervandew/supertab
" syntastic: https://github.com/vim-syntastic/syntastic
" tabular: https://github.com/godlygeek/tabular
" tlib_vim: https://github.com/tomtom/tlib_vim
" undotree: https://github.com/mbbill/undotree
" vim-airline: https://github.com/vim-airline/vim-airline
" vim-airline-themes: https://github.com/vim-airline/vim-airline-themes
" vim-addon-mw-utils: https://github.com/MarcWeber/vim-addon-mw-utils
" vim-bundler: https://github.com/tpope/vim-bundler
" vim-easymotion: https://github.com/easymotion/vim-easymotion
" vim-elixir: https://github.com/elixir-editors/vim-elixir
" vim-endwise: https://github.com/tpope/vim-endwise
" vim-fugitive: https://github.com/tpope/vim-fugitive
" vim-ruby: https://github.com/vim-ruby/vim-ruby
" vim-surround: https://github.com/tpope/vim-surround
" vim-vroom: https://github.com/skalnik/vim-vroom
" vimproc.vim: https://github.com/Shougo/vimproc.vim


" undotree ---------------------------------------------------------------------

" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>

" ag (silversearcher) ----------------------------------------------------------
" https://github.com/ggreer/the_silver_searcher

" open ag.vim
nnoremap <leader>a :Ag

" syntastic --------------------------------------------------------------------

map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" ghc-mod ----------------------------------------------------------------------

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

" supertab --------------------------------------------------------------------- 

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

" neco-gc ----------------------------------------------------------------------

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" NERDTree --------------------------------------------------------------------- 

map <Leader>n :NERDTreeToggle<CR>

" Tabular ----------------------------------------------------------------------

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a, :Tabularize /<-<CR>
vmap al :Tabularize /[\[\\|,]<CR>

" CtrlP ------------------------------------------------------------------------

map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'
" order matching files top to bottom with ttb
let g:ctrlp_match_window = 'bottom,order:ttb'
" always open files in new buffers
let g:ctrlp_switch_buffer = 0
" allow changing working directory during vim session
let g:ctrlp_working_path_mode = 0
" use ag for matching files
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" -- vim-airline ---------------------------------------------------------------
let g:airline_theme='dark'
let g:airline_powerline_fonts=1
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
let g:airline_enable_branch=1
let g:airline#extensions#tabline#enabled = 1

" Tmux - TODO ------------------------------------------------------------------
" allows cursor change in tmux mode
"if exists('$TMUX')
"  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif

" easy-motion - TODO -----------------------------------------------------------

" == autogroup ==

"augroup configgroup
"  autocmd!
"  autocmd VimEnter * highlight clear SignColumn
"  autocmd BufWritePre *.hs,*.ex,*.elm,*.js,*.exs,*.py,*.rb,*.md
"              \:call <SID>StripTrailingWhitespaces()
"augroup END

" Custom Functions -------------------------------------------------------------

" toggle between number and relativenumber
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above
function! <SID>StripTrailingWhitespaces()
  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
