" Some stuff taken from: https://github.com/zaiste/vimified/blob/master/vimrc

" Vundle {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" }}}

" Bundles {{{
Bundle 'gmarik/vundle'

Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'
Bundle 'plasticboy/vim-markdown'
Bundle 'derekwyatt/vim-scala'
Bundle 'ekalinin/Dockerfile.vim'

Bundle 'tpope/vim-surround'
Bundle 'drmikehenry/vim-fixkey'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'lastpos.vim'
Bundle 'ZoomWin'

Bundle 'vim-scripts/matchit.zip'
Bundle 'sukima/xmledit'
Bundle 'GEverding/vim-hocon'

" Clojure
Bundle 'guns/vim-clojure-static'
Bundle 'guns/vim-sexp'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-salve'
Bundle 'typedclojure/vim-typedclojure'

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

" Vim Sexp
" Remap h and e so that they could be used later
nmap <LocalLeader>k <Plug>(sexp_swap_list_backward)
nmap <LocalLeader>j <Plug>(sexp_swap_list_forward)
nnoremap <T-h> <Plug>(sexp_swap_element_backward)
nnoremap <T-l> <Plug>(sexp_swap_element_forward)

" Yank to clipboard/paste from clipboard via xclip
vnoremap <F6> :!xclip -f -sel clip<CR>
nnoremap <F7> :-1r !xclip -o -sel clip<CR>

map Y y$
map <tab> %

inoremap jj <Esc>
inoremap kk <Esc>

noremap TT :tabnew<CR>

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" wrap/nowrap line toggle
nnoremap <silent> <leader>w :set wrap! wrap?<cr>
nnoremap <silent> <leader>q :NERDTreeToggle<cr>

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
