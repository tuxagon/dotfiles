call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'dracula/vim'

  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'tpope/vim-fugitive'

  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = [
    \ 'coc-emmet',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-prettier',
    \ 'coc-tsserver',
    \ 'coc-tailwindcss',
    \ 'coc-docker',
    \ 'coc-sql',
    \ 'coc-solargraph',
    \ 'coc-explorer',
    \ 'coc-bookmark',
    \ 'coc-python',
    \ 'coc-yaml',
    \ 'coc-todolist',
    \ 'coc-actions',
    \ 'coc-spell-checker',
    \ 'coc-reason',
    \ 'coc-graphql',
    \ 'coc-sh',
    \ 'coc-yank',
    \ 'coc-git',
    \ 'coc-rls'
    \]

  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
call plug#end()

" Config Section
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme dracula

set number
set ruler
set mouse=a
set encoding=utf-8
set autoread
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent
set tabstop=2 shiftwidth=2 expandtab
set backspace=indent,eol,start
set noswapfile
set nobackup
set showcmd
set showmode
set noerrorbells
set nostartofline

" Use <C-L> to clear the highlighting of :set hlsearch
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusLine = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle NERDTree with ctrl+b
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <C-n> :call OpenTerminal()<CR>

" comment toggle
nmap <leader>c gcc

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" file search
nnoremap <C-p> :FZF<CR>
nnoremap <leader>b :Buffers<CR>
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" ale
let g:ale_linters = {
  \   'ruby': ['rubocop']
  \}

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

nnoremap <leader>m :CocCommand bookmark.toggle<CR>
