" SETTINGS {{{

" Enable syntax highlighting.
"
syntax on

" General vim settings.
"
let mapleader = ' ' " set leader
set autoindent " indented text
set autoread " pick up external changes to files
set autowrite " write files when navigating with :next/:previous
set backspace=indent,eol,start
set belloff=all " turn off bells
if has("unnamedplus") " copy to/from system clipboard
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif
set complete=.,w,b " sources for term and line completions
set completeopt=menu,menuone,noinsert,noselect
set directory^=$HOME/.vimswap// " setting default directory for .swp files
set encoding=utf-8 " characters encoding inside vim
set expandtab " use spaces instead of tabs
set gdefault " always do global substitutes
set hidden " hide buffer instead close
set history=200 " keep 200 changes in undo history
set infercase " smart casing when completing
set ignorecase " search in case-insensitively
set laststatus=2 " always show statusline
set list " empty characters highlight
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~"
set mouse=a " enable mouse for all modes
set nobackup
set nowritebackup
set nocompatible " no vi support
set nojoinspaces " no to double-spaces when joining lines
set number " show line numbers
set re=0
set relativenumber " show relative numbers
set ruler
set scrolloff=5 " number of screen lines to keep above and below cursor
set shiftwidth=2 " number of spaces for each ident level
set shortmess+=c " don't pass messages to |ins-completion-menu|
set showtabline=2 " always show tabline
set signcolumn=yes " always showing signcolumn
set smartcase " case-smart searching
set smartindent " automaticaly set right indent
set softtabstop=2 " count of spaces for tab
set splitbelow " new buffers position
set splitright " new buffers position
set suffixesadd+=.js,.jsx,.ts,.tsx " open files without extension by gf
set t_Co=16 " terminal colors
set tabstop=2 " number of spaces in tab
set termguicolors " enable 24-bit color support for terminal vim
" set the persistent undo directory on temporary private fast storage.
let s:undoDir="/tmp/.undodir_" . $USER
if !isdirectory(s:undoDir)
    call mkdir(s:undoDir, "", 0700)
endif
let &undodir=s:undoDir
set undofile " maintain undo history
set wildcharm=<Tab> " defines the trigger for 'wildmenu' in mappings
set wildmenu " command completion
set wildmode=full " complete the next full match
" }}}

" PLUGINS {{{

" automatically install vim-plug and run PlugInstall if vim-plug is not found.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" initialize vim-plug.
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim' " color scheme
Plug 'nelstrom/vim-visual-star-search'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive' " git support
Plug 'tpope/vim-commentary' " commenting using gc
Plug 'tpope/vim-repeat' " expand . to work with surround and etc
Plug 'sheerun/vim-polyglot' " syntax highlighting
Plug 'sgur/vim-editorconfig' " support for .editorconfig
Plug 'Lokaltog/vim-easymotion' " navigation in files
Plug 'wellle/targets.vim' " provides text objects for *|_
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash --no-zsh' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim' " most recent used files for fzf
Plug 'ap/vim-css-color'
Plug 'mbbill/undotree' " for undo history visualization
Plug 'tmsvg/pear-tree' " for brackets auto closing
Plug 'mhinz/vim-grepper' " for searching
Plug 'stefandtw/quickfix-reflector.vim' " running commands in quickfix window
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense engine
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'amiralies/coc-flow', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint-plugin', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
" finalize vim-plug.
call plug#end()
" }}}

set background=dark
colorscheme selenized

" MAPPINGS
" move blocks in visual mode
vnoremap < <gv
vnoremap > >gv
" Y should behave like D and C, from cursor till the end of line
noremap Y y$
" U for redo, the opposite of u for undo
noremap U <C-r>
" easy navigation between splits
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
noremap <leader>wh <C-w>h
noremap <leader>wj <C-w>j
noremap <leader>wk <C-w>k
noremap <leader>wl <C-w>l
" window splitting
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>
" new tab creation
nnoremap <leader>t :tabnew<CR>
" closing window
nnoremap <leader>q :quit<CR>
" source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" undotree {{{
let g:undotree_HighlightChangedWithSign = 0
let g:undotree_WindowLayout = 4
nnoremap <Leader>u :UndotreeToggle<CR>
" }}}


" easy motion {{{
let g:EasyMotion_do_mapping = 0 " dont use default mapping
let g:EasyMotion_smartcase = 1 " ignore case
let g:EasyMotion_startofline = 0 " save cursor column when use easymoiton-(j|k)
" replace standart search
map / <Plug>(easymotion-sn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
" line navigation
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
" }}}

" pear-tree {{{
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_backspace = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_openers = 1
 " }}}

 " vim-auto-save {{{
let g:auto_save        = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]
 " }}}

 " vim-fugitive {{{
nnoremap <silent> <Leader>B :Gblame<CR>
nnoremap <silent> <Leader>C :Gclog %<CR>
nnoremap <silent> <Leader>G :Gstatus<CR>
" }}}

" fzf {{{
let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

" using ripgrep to update search on type
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>g :GFiles?<CR>
nnoremap <silent> <leader>c :Commits<CR>
nnoremap <silent> <leader>bc :BCommits<CR>
nnoremap <leader>f :RG<Space>
nnoremap <silent> <leader>m :FZFMru<CR>

" display fzf in floating popup window
if has('nvim-0.4.0') || has("patch-8.2.0191")
    let g:fzf_layout = { 'window': {
                \ 'width': 0.9,
                \ 'height': 0.7,
                \ 'highlight': 'Comment',
                \ 'rounded': v:false } }
else
    let g:fzf_layout = { "window": "silent botright 16split enew" }
endif

" }}}

" grepper {{{
let g:grepper = {}
let g:grepper.tools = ["rg"]
runtime autoload/grepper.vim
let g:grepper.jump = 1
let g:grepper.highlight = 1
nnoremap <leader>/ :GrepperRg<Space>
nnoremap gs :Grepper -cword -noprompt<CR>
xmap gs <Plug>(GrepperOperator)
" }}}

" netrw {{{
let g:netrw_banner = 0 " hide banner
let g:netrw_browse_split = 4 " open files in the previous window
let g:netrw_winsize = 25
let g:netrw_altv = 1
nnoremap <silent> <leader>' :Vexplore<CR>
" }}}

" coc.vim {{{
" having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" don't pass messages to |ins-completion-menu|.
set shortmess+=c
" always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion.
nmap <leader>. <Plug>(coc-codeaction)

" use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" goTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" symbol renaming.
nmap <leader>r <Plug>(coc-rename)

" use <TAB> for selections ranges.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" prettier support
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" }}}
