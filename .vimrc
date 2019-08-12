" Some stuff taken from: https://github.com/zaiste/vimified/blob/master/vimrc

set nocompatible " we won't be using vi
filetype off " for Vundle

" Vundle {{{
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" }}}

" Bundles {{{
Plugin 'VundleVim/Vundle.vim'

" Support
Plugin 'Shougo/vimproc.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'scrooloose/syntastic'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'dense-analysis/ale'
Plugin 'lastpos.vim'
Plugin 'mbbill/undotree'

" Navigation
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ZoomWin'
Plugin 'ctrlpvim/ctrlp.vim'

" Manipulation
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'drmikehenry/vim-fixkey'
Plugin 'jremmen/vim-ripgrep'
Plugin 'vim-scripts/matchit.zip'
Plugin 'godlygeek/tabular'

" Filetypes
Plugin 'plasticboy/vim-markdown'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'sukima/xmledit'
Plugin 'GEverding/vim-hocon'
Plugin 'cespare/vim-toml'
Plugin 'dm3/vim-epl-syntax'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'PProvost/vim-ps1'
Plugin 'fsharp/vim-fsharp'
"Plugin 'derekwyatt/vim-scala'
"Plugin 'leafgarland/typescript-vim'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-fireplace'

" Typescript
"Plugin 'Quramy/tsuquyomi'

" Haskell
"Plugin 'neovimhaskell/haskell-vim'
"Plugin 'enomsg/vim-haskellConcealPlus'
"Plugin 'eagletmt/ghcmod-vim'
"Plugin 'eagletmt/neco-ghc'
"Plugin 'Twinside/vim-hoogle'

" Styling
Plugin 'kien/rainbow_parentheses.vim'
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

Plugin 'jnurmine/Zenburn'

call vundle#end()
filetype plugin indent on " for Vundle

colorscheme zenburn
let g:zenburn_force_dark_Background = 1
command Light colorscheme shine
command Dark colorscheme zenburn
" }}}

" Syntax {{{

syntax on

" slows down significantly on large files
let g:clojure_maxlines = 30
let g:airline_highlighting_cache = 1
let g:airline_extensions = []
let g:airline_theme = 'dark_minimal'

"
" let g:clojure_align_multiline_strings = 1
" let g:clojure_fuzzy_indent = 1
" let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']

au BufRead,BufNewFile *.cljx setlocal filetype=clojure
au BufRead,BufNewFile *.hl setlocal filetype=clojure
au BufRead,BufNewFile *.boot setlocal filetype=clojure

au BufRead,BufNewFile *.epl setlocal filetype=epl
" }}}

" Matches {{{

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}

" OSX {{{
" See https://github.com/guns/vim-sexp/issues/18

" Timeout quickly on key codes to differentiate from normal <Esc>
set ttimeout ttimeoutlen=0

" Ctrl-P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '_data_workspace',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': '',
"  \ }

" Special named keys that cause problems when used literally
let namedkeys = { ' ': 'Space', '\': 'Bslash', '|': 'Bar', '<': 'lt' }

" Map Alt + ASCII printable chars
for n in range(0x20, 0x7e)
    let char = nr2char(n)
    let key  = char

    if has_key(namedkeys, char)
        let char = namedkeys[char]
        let key  = '<' . char . '>'
    endif

    " Escaped Meta (i.e. not 8-bit mode)
    "  * Esc-[ is the CSI prefix (Control Sequence Introducer)
    "  * Esc-O is the SS3 prefix (Single Shift Select of G3 Character Set)
    if char !=# '[' && char !=# 'O'
        try
            execute 'set <M-' . char . ">=\<Esc>" . key
        catch
        endtry
    endif
endfor

unlet namedkeys n key char
" }}}

" Mappings {{{

let mapleader = "\\"
let maplocalleader = "`"

" Plugins {{{

"" ALE
let g:airline#extensions#ale#enabled = 1
" project-specific
" TODO: https://github.com/dense-analysis/ale/issues/782
" Clang-Tidy - when working with headers, compile_commands.json is unusable as
" header files do not have associated compilation commands. We need to extract
" the relevant compiler parameters and includes from the commands file and set
" the `clangtidy_options` manually somehow...
let g:ale_cpp_clangtidy_options = '-Wall -Wextra -Wshadow -Wnon-virtual-dtor -O3 -std=gnu++1z
 \ -I''_builds/_deps/eigen3-build/install/include/eigen3''
 \ -I''_builds/_deps/boost-build/install/include''
 \ -I''_builds/_deps/google_benchmark-build/install/include''
 \ -I''_builds/_deps/catch2-src/single_include'''
let g:ale_cpp_cppcheck_options = '--force --suppressions-list=.suppress-cppcheck
 \ -I''_builds/_deps/eigen3-build/install/include/eigen3''
 \ -I''_builds/_deps/boost-build/install/include''
 \ -I''_builds/_deps/google_benchmark-build/install/include''
 \ -I''_builds/_deps/catch2-src/single_include'''
let g:ale_c_build_dir = '_builds'

let g:ale_c_parse_compile_commands = 1
let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \ 'cpp': ['cppcheck', 'clangtidy'],
            \ }

let g:haskell_tabular = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_cache_omnifunc = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_semantic_triggers = {
    \ 'typescript' : ['.'],
    \ }
" let g:ycm_semantic_triggers = {
"     \ 'clojure' : ['/'],
"     \ 'haskell' : ['.'],
"     \ }

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
map <leader>tg :!codex update --force<CR>:call system("git-hscope -X TemplateHaskell")<CR><CR>:call LoadHscope()<CR>

set csprg=~/.local/bin/hscope
set csto=1 " search codex tags first
set cst
set csverb
nnoremap <silent> <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>
" Automatically make cscope connections
function! LoadHscope()
  let db = findfile("hscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/hscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /*.hs call LoadHscope()
" }}}

" Rust {{{
" let g:rustfmt_autosave = 1
" let g:ycm_rust_src_path = "$RUST_SRC_PATH"
" }}}

" Clojure {{{
let g:clojure_highlight_local_vars = 0
" }}}

" Ocaml {{{
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
" }}}

" Yaml {{{
autocmd FileType yaml setlocal indentkeys-=<:> ts=2 sts=2 sw=2 expandtab
" }}}

" CMake {{{
autocmd FileType cmake setlocal indentkeys-=<:> ts=2 sts=2 sw=2 expandtab
" }}}

" Markdown {{{
" disable header folding - doesn't work - https://github.com/plasticboy/vim-markdown/issues/414
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0
" }}}

" Haskell {{{

" Use par for prettier line formatting
set formatprg="PARINIT='rTbgqR B=.,?_A_a Q=_s>|' par\ -w80"

" Use stylish haskell instead of par for haskell buffers
autocmd FileType haskell let &formatprg="stylish-haskell"

" Autocomplete
let g:necoghc_debug = 0
let g:necoghc_enable_detailed_browse = 1

nmap <silent> <leader>ht :GhcModType<CR>
nmap <silent> <leader>hc :GhcModCheck<CR>
nmap <silent> <leader>hll :GhcModLint<CR>
nmap <silent> <leader>htc :GhcModTypeClear<CR>
nmap <silent> <leader>hT :GhcModTypeInsert<CR>

" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>
nnoremap <leader>hH :Hoogle

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>
nnoremap <leader>hI :HoogleInfo
nnoremap <silent> <leader>hz :HoogleClose<CR>
" }}}

nnoremap <silent> <leader>uu :UndotreeToggle<cr>
nnoremap <silent> <leader>q :NERDTreeToggle<cr>
nnoremap <silent> <leader>tt :TagbarToggle<cr>
let g:tagbar_autofocus = 1

" Vim Sexp {{{
let g:sexp_filetypes = 'clojure'
" Remap h and e so that they could be used later
nmap <LocalLeader>k <Plug>(sexp_swap_list_backward)
nmap <LocalLeader>j <Plug>(sexp_swap_list_forward)
nmap ê <Plug>(sexp_emit_head_element)
nmap ë <Plug>(sexp_emit_tail_element)
nmap è <Plug>(sexp_capture_prev_element)
nmap ì <Plug>(sexp_capture_next_element)
" nmap è <Plug>(sexp_swap_element_backward)
" nmap ì <Plug>(sexp_swap_element_forward)
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
" delete without clobbering the unnamed register
nnoremap s "_d

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

nnoremap <leader>t i<c-r>=strftime('%Y-%m-%dT%H:%M:%S')<cr><Esc>
inoremap <F3> <c-r>=strftime('%Y-%m-%dT%H:%M:%S')<cr>

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

set showcmd " show the command currently typed in
set number " show line numbers
set splitright  " When splitting vertically, split to the right
set splitbelow  " When splitting horizontally, split below
set history=1000 " default is 20

set scrolloff=3 " scroll 3 lines in advance of the top/bottom of the window
set backspace=2 " make backspace work like most other apps
set visualbell
set suffixesadd=.md " automatically navigate if $file.md exists with `gf`

" show hidden characters and linewraps
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮
set showbreak=↪

" _ status line {{{

set laststatus=2 " display status line for every window

" _ }}}

" _ backups {{{

if has("persistent_undo")
    set undodir=~/.vim/tmp/undo/
    set undofile
endif

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
autocmd FileType xml,clojure,java,sql,haskell,rust,epl,ml,iml,julia,markdown,c,h,cpp,hpp,cmake autocmd BufWritePre <buffer> :%s/\s\+$//e

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
