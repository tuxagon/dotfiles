" Kenneth Bogner

" Notes
" - http://www.stephendiehl.com/posts/vim_2016.html
" - font: https://github.com/belluzj/fantasque-sans
" - <leader> = \

" Colors -----------------------------------------------------------------------
" colorscheme jellybeans  " jellybeans colorscheme
colorscheme neodark       " neodark colorscheme

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
set colorcolumn=81  " add vertical ruler
highlight ColorColumn ctermbg=0 guibg=lightgrey
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2  " number of spaces in tab when editing
set tabstop=2
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set shiftwidth=2
set expandtab  " tabs are spaces
set incsearch  " search as characters are entered
" set hlsearch  " highlight matches
set showmatch  " highlight matching [{()}]
set mouse=a
set history=1000
set clipboard=unnamedplus,autoselect
set autowrite   " saves the file whenever :make is ran (used by vim-go)
set backspace=indent,eol,start

set foldenable  " enable folding
set foldlevelstart=10  " open most folds by default
set foldnestmax=10  " 10 nested fold max
set foldmethod=indent  " fold based on indent level
" space open/closes folds
nnoremap <space> za

" highlight last inserted text
nnoremap gV `[V`]

" whitespace toggle
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

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

" map to switching tabs
"   :tabe <filename>   is used to open a new tab
"   :tabn              is used to go to the next tab
"       gt             is equivalent from NERDTree
"   :tabp              is used to go to the previous tab
"       gT             is equivalent from NERDTree
"   :sp <filepath>     is used to split screen in multiple files
"       <C-w>          is used to go to the next window
"       <C-W>          is used to go to the previous window
" nmap <C-]> :tabn<CR>
" nmap <C-[> :tabp<CR>

" Enable fzf (https://github.com/junegunn/fzf)
" <C-J> / <C-K> (or <C-N> / <C-P>) to move cursor up / down
" Enter key to select the item <C-C> / <C-G> / ESC to exit
" Multi-select mode (-m), TAB and SHIFT-TAB to mark multiple items
set rtp+=/usr/local/opt/fzf

" use pathogen
execute pathogen#infect()

" undotree ---------------------------------------------------------------------

" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>

" vim-fugitive
nnoremap <leader>b :Gblame<CR>

" ack.vim

if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
  cnoreabbrev Ack Ack!
  nnoremap <Leader>a :Ack!<Space>
endif

" ale --------------------------------------------------------------------------

let g:ale_lint_on_text_changed = 'never'

" syntastic --------------------------------------------------------------------

" map <Leader>s :SyntasticToggleMode<CR>

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" elm-vim ----------------------------------------------------------------------

let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

" ghc-mod ----------------------------------------------------------------------

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

" purescript-vim ---------------------------------------------------------------

let purescript_indent_if = 3
let purescript_indent_case = 5
let purescript_indent_let = 4
let purescript_indent_where = 6
let purescript_indent_do = 3
let purescript_indent_in = 1
let purescript_indent_dot = v:true

" RSpec.vim mappings -----------------------------------------------------------
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" psc-ide-vim ------------------------------------------------------------------

" helptags "~/.vim/bundles/psc-ide-vim/doc"

let g:psc_ide_log_level = 3
let g:psc_ide_syntastic_mode = 1

"nm <buffer> <silent> <leader>t :<C-U>call PSCIDEtype(PSCIDEgetKeyword(), v:true)<CR>
"nm <buffer> <silent> <leader>T :<C-U>call PSCIDEaddTypeAnnotation(matchstr(getline(line(".")), '^\s*\zs\k\+\ze'))<CR>
"nm <buffer> <silent> <leader>s :<C-U>call PSCIDEapplySuggestion()<CR>
"nm <buffer> <silent> <leader>a :<C-U>call PSCIDEaddTypeAnnotation()<CR>
"nm <buffer> <silent> <leader>i :<C-U>call PSCIDEimportIdentifier(PSCIDEgetKeyword())<CR>
"nm <buffer> <silent> <leader>r :<C-U>call PSCIDEload()<CR>
"nm <buffer> <silent> <leader>p :<C-U>call PSCIDEpursuit(PSCIDEgetKeyword())<CR>
"nm <buffer> <silent> <leader>C :<C-U>call PSCIDEcaseSplit("!")<CR>
"nm <buffer> <silent> <leader>f :<C-U>call PSCIDEaddClause("")<CR>
"nm <buffer> <silent> <leader>qa :<C-U>call PSCIDEaddImportQualifications()<CR>
"nm <buffer> <silent> ]d :<C-U>call PSCIDEgoToDefinition("", PSCIDEgetKeyword())<CR>

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

" vim-go -----------------------------------------------------------------------

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_def_mode = 'godef'
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" shortcuts for common vim-go functions
autocmd FileType go nmap <leader>t :GoTest<CR>
" autocmd FileType go nmap <leader>b :GoBuild<CR>
autocmd FileType go nmap <leader>r :GoRun<CR>
autocmd FileType go nmap <leader>c :GoCoverageToggle<CR>
autocmd FileType go nmap <leader>d :GoDocBrowser<CR>
autocmd FileType go nmap <leader>i :GoInfo<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" provides quicker ways to open alternate files, like :A, :AV, :AS, :AT
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" ReasonML ---------------------------------------------------------------------

let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

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
