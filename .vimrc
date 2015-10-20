" Some stuff taken from: https://github.com/zaiste/vimified/blob/master/vimrc

" Vundle {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" }}}

" Bundles {{{
Bundle 'gmarik/vundle'

" Navigation
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Bundle 'lastpos.vim'
Bundle 'ZoomWin'
Bundle 'kien/ctrlp.vim'

" Filetypes
Bundle 'plasticboy/vim-markdown'
Bundle 'derekwyatt/vim-scala'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'sukima/xmledit'
Bundle 'GEverding/vim-hocon'

" Manipulation
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'drmikehenry/vim-fixkey'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'godlygeek/tabular'

" Clojure
Bundle 'guns/vim-clojure-static'
Bundle 'guns/vim-sexp'
Bundle 'tpope/vim-fireplace'
"Bundle 'tpope/vim-salve'
Bundle 'typedclojure/vim-typedclojure'

" Haskell
Bundle 'neovimhaskell/haskell-vim'
Bundle 'enomsg/vim-haskellConcealPlus'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'eagletmt/neco-ghc'
Bundle 'Twinside/vim-hoogle'

" Styling
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['red',         'RoyalBlue3'],
    \ ['yellow',      'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

Bundle 'jnurmine/Zenburn'
colorscheme zenburn
let g:zenburn_force_dark_Background = 1
command Light colorscheme shine
command Dark colorscheme zenburn
" }}}

" Syntax {{{

syntax on
filetype on
filetype plugin indent on

" let g:clojure_align_multiline_strings = 1
" let g:clojure_fuzzy_indent = 1
" let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']

au BufRead,BufNewFile *.cljx setlocal filetype=clojure
au BufRead,BufNewFile *.hl setlocal filetype=clojure
au BufRead,BufNewFile *.boot setlocal filetype=clojure

" }}}

" Matches {{{

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}

" Mappings {{{

let mapleader = "\\"
let maplocalleader = "`"

" Plugins {{{

let g:haskell_tabular = 1

" Tags {{{

set tags=tags;/,codex.tags;/

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

" Generate haskell tags with codex and hscope
map <leader>tg :!codex update --force<CR>:call system("git hscope -X TemplateHaskell")<CR><CR>:call LoadHscope()<CR>

nnoremap <silent> <leader>tt :TagbarToggle<cr>
" }}}

" Haskell {{{

" Use par for prettier line formatting
set formatprg="PARINIT='rTbgqR B=.,?_A_a Q=_s>|' par\ -w72"

" Use stylish haskell instead of par for haskell buffers
autocmd FileType haskell let &formatprg="stylish-haskell"

" Use buffer words as default tab completion
let g:SuperTabDefaultCompletionType = '<c-x><c-p>'

" Show types in completion suggestions
let g:necoghc_enable_detailed_browse = 1

" Type of expression under cursor
nmap <silent> <leader>ht :GhcModType<CR>
" Insert type of expression under cursor
nmap <silent> <leader>hT :GhcModTypeInsert<CR>
" GHC errors and warnings
nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>

" Resolves ghcmod base directory
au FileType haskell let g:ghcmod_use_basedir = getcwd()

" Haskell Lint
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['haskell'] }
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>

" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>

" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>

" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo

" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>
" }}}

nnoremap <silent> <leader>q :NERDTreeToggle<cr>

" Vim Sexp {{{
" Remap h and e so that they could be used later
nmap <LocalLeader>k <Plug>(sexp_swap_list_backward)
nmap <LocalLeader>j <Plug>(sexp_swap_list_forward)
nnoremap <T-h> <Plug>(sexp_swap_element_backward)
nnoremap <T-l> <Plug>(sexp_swap_element_forward)
" }}}
" }}}

" Copy and paste to os clipboard
nmap <leader>y "*y
vmap <leader>y "*y
nmap <leader>d "*d
vmap <leader>d "*d
nmap <leader>p "*p
vmap <leader>p "*p

map Y y$

inoremap jj <Esc>
inoremap kk <Esc>

noremap TT :tabnew<CR>

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" wrap/nowrap line toggle
nnoremap <silent> <leader>w :set wrap! wrap?<cr>

" Standard split navigation
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
vnoremap <c-l> <c-w>l
vnoremap <c-h> <c-w>h
vnoremap <c-j> <c-w>j
vnoremap <c-k> <c-w>k

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

" Paragraph formatting
nnoremap Q gqap
vnoremap Q gq

" Source current line
vnoremap <leader>L y:execute @@<cr>
" Source visual selection
nnoremap <leader>L ^vg_y:execute @@<cr>

" Quick editing {{{

nnoremap <leader>ev :call EditConfig("$MYVIMRC")<cr>
nnoremap <leader>eg :call EditConfig("~/.gitconfig")<cr>

" }}}

" }}}

" Settings {{{

set autoread " read file automatically on change if not edited
set encoding=utf-8
set title " title of the window set to titlestring

set nocompatible " we won't be using vi
set showcmd " show the command currently typed in
set number " show line numbers
set splitright  " When splitting vertically, split to the right
set splitbelow  " When splitting horizontally, split below
set history=1000 " default is 20

set scrolloff=3 " scroll 3 lines in advance of the top/bottom of the window
set backspace=2 " make backspace work like most other apps
set visualbell

" show hidden characters and linewraps
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮
set showbreak=↪

" _ status line {{{

set laststatus=2 " display status line for every window

" _ }}}

" _ backups {{{

set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set backup " make backups of edited files
set noswapfile " do not use swap files for buffers

" _ }}}

" _ indentation {{{

set expandtab     " spaces instead of tabs
set smarttab      " <Tab> in front of a line inserts blanks according to the :shiftwidth

set shiftwidth=4  " number of spaces to be used during autoindent
set softtabstop=4 " expand tab to 4 characters

" _ }}}

" _ Searching, Substituting {{{

set incsearch   " Show search matches as you type
set ignorecase  " Ignore case when searching
set smartcase   " Override 'ignorecase' when needed
set hlsearch    " Highlight search results
set showmatch   " Show matching bracket

" _ }}}

" _ Menus, Completion {{{

set completeopt=longest,menu,menuone
"               |       |    |
"               |       |    +-- Show popup even with one match
"               |       +------- Use popup menu with completions
"               +--------------- Insert longest completion match

set wildmenu  " Enable wildmenu for completion
set wildmode=longest:full,list:full
"            |            |
"            |            +-- List matches, complete first match
"            +--------------- Complete longest prefix, use wildmenu
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc

" _ }}}

" Folding {{{

set foldlevelstart=0

" Enter to toggle folds.
nnoremap <Enter> za
vnoremap <Enter> za

" }}}

" Auto commands {{{

" Trailing whitespace {{{
" Only shown when not in insert mode.
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" Remove trailing whitespace
autocmd FileType xml,clojure,java,sql autocmd BufWritePre <buffer> :%s/\s\+$//e

augroup clojure
    au!
    au VimEnter * RainbowParenthesesToggle
    au Syntax clojure RainbowParenthesesLoadRound
augroup END

" }}}

" }}}

"" Edit vim config files (if they exist)
function! EditConfig(config)
    if exists(a:config)
        execute 'tabedit '.a:config
    endif
endfunction

" }}}
