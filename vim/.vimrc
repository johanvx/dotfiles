set nocompatible
filetype plugin indent on
syntax on

" Options {{{
" Encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,default,latin1
set fileformats=unix,mac,dos

" UI
set background=dark
set cmdheight=1
set cmdwinheight=5
set colorcolumn=+1
set cursorline
set cursorlineopt=number
set fillchars=stl:\ ,stlnc:\ ,vert:│,fold:\ ,foldopen:-,foldclose:+,foldsep:│,diff:-,eob:~,lastline:@
set foldcolumn=2
set foldenable
set foldlevel=4
set foldlevelstart=4
set laststatus=2
set linebreak
set list
set listchars=extends:#,nbsp:.,tab:›\ ,trail:•
set number
set relativenumber
set noruler
set scrolloff=2
set showcmd
set noshowmode
set sidescrolloff=1
set signcolumn=auto
set splitbelow
set splitright

" Statusline {{{
" Mode table
let mode_table = {
            \"n":       'NORMAL',
            \"no":      'OPERATOR PENDING',
            \"nov":     'OPERATOR PENDING',
            \"noV":     'OPERATOR PENDING',
            \"no\<C-v>": 'OPERATOR PENDING',
            \"niI":     'NORMAL',
            \"niR":     'NORMAL',
            \"niV":     'NORMAL',
            \"v":       'VISUAL',
            \"V":       'VISUAL LINE',
            \"\<C-v>":   'VISUAL BLOCK',
            \"s":       'SELECT',
            \"S":       'SELECT LINE',
            \"\<C-s>":   'SELECT BLOCK',
            \"i":       'INSERT',
            \"ic":      'INSERT',
            \"ix":      'INSERT',
            \"R":       'REPLACE',
            \"Rc":      'REPLACE',
            \"Rv":      'VIRTUAL REPLACE',
            \"Rx":      'REPLACE',
            \"c":       'COMMAND',
            \"cv":      'EX',
            \"ce":      'EX',
            \"r":       'HIT-ENTER',
            \"rm":      'MORE',
            \"r?":      'CONFIRM',
            \"!":       'EXTERNAL COMMAND',
            \"t":       'TERMINAL JOB'
            \}
set statusline=%<%(\ %{mode_table[mode()]}\ %)%(\ %F%)%(\ %q%)%(\ [%W%H%M%R]%)%=%(\ [%{&fenc}%Y]\ %)%(\ %3p%%%)%(\ %l:%c\ %)
" }}}

set switchbuf=usetab
set synmaxcol=2000
set termguicolors
set wildmenu
set wildoptions=fuzzy,pum
set nowrap

" Edit
set autochdir
set autowrite
set backspace=indent,eol,start
set breakindent
set completeopt=menuone,noselect,noinsert
set confirm
set expandtab
set formatoptions=nlmB1jq
set hlsearch
set ignorecase
set incsearch
set infercase
set matchtime=1
set maxmempattern=1048576 " KB
set mouse=a
set path+=**
set shiftwidth=4
set shortmess=tTOWolcF
set showmatch
set smartcase
set smartindent
set softtabstop=4
set tabstop=4
set timeoutlen=500 " ms
set ttimeoutlen=0
set virtualedit=onemore,block
set whichwrap=h,l,<,>,[,],~
set wildignore+=*/node_modules/*

" Misc.
" Backup
set backup
set backupdir=~/.cache/vim/backup/
" Swap
set noswapfile
set directory=~/.cache/vim/swap/
" Undo
set undofile
set undodir=~/.cache/vim/undo/
" View
set viewdir=~/.cache/vim/view/
set viewoptions=folds,options,cursor,unix,slash
" }}}

" Keymaps {{{
" Map leaders
let mapleader = ' '
let maplocalleaader = '\'

" Cursor movements
noremap j gj
noremap k gk
noremap gh H
noremap gl L
map H ^
map L $
" Some Emacs stuff
noremap! <C-n> <Down>
noremap! <C-p> <Up>
noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-h> <BS>
noremap! <C-d> <Del>
" Delete shift width at the start of the line (paired with <C-t>)
inoremap <C-g> <C-d>

" Place search results at the center
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" Shifts
xnoremap < <gv
xnoremap > >gv

" System clipboard
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>P "+P

" Toggle {{{
nnoremap <silent> <LocalLeader>b :call ToggleBackground()<CR>
function! ToggleBackground()
    if (&background == 'dark')
        set background=light
    else
        set background=dark
    endif
endfunction

nnoremap <silent> <LocalLeader><LocalLeader> :call InspectKeyword()<CR>
function! InspectKeyword()
    let s = synID(line('.'), col('.'), 1)
    echo synIDattr(s, 'name') . ' -> ' . synIDattr(synIDtrans(s), 'name')
endfunction
" }}}

" Type commands quicker
nnoremap ; :
vnoremap ; :

" Clear search highlight
nnoremap <C-l> :nohlsearch<CR>
vnoremap <C-l> <Esc>:nohlsearch<CR>

" Jumps
" between buffer
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
" between window
nnoremap [w <C-w>W
nnoremap ]w <C-w>w

" Window actions
inoremap <Up> <Esc>:resize +1 <Bar> startinsert<CR>
nnoremap <Up> :resize +1<CR>
vnoremap <Up> <Esc>:resize +1<CR>gv
inoremap <Down> <Esc>:resize -1 <Bar> startinsert<CR>
nnoremap <Down> :resize -1<CR>
vnoremap <Down> <Esc>:resize -1<CR>gv
inoremap <Left> <Esc>:vertical resize -1 <Bar> startinsert<CR>
nnoremap <Left> :vertical resize -1<CR>
vnoremap <Left> <Esc>:vertical resize -1<CR>gv
inoremap <Right> <Esc>:vertical resize +1 <Bar> startinsert<CR>
nnoremap <Right> :vertical resize +1<CR>
vnoremap <Right> <Esc>:vertical resize +1<CR>gv
" }}}

" Color scheme {{{
if !empty(globpath(&rtp, 'colors/lettepa.vim'))
    colorscheme lettepa
else
    colorscheme default
endif
" }}}

" Autocmds {{{
" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste
" }}}

" vim:et:tw=80:ts=4:sts=4:sw=4:fdl=0:fdm=marker:norl:
