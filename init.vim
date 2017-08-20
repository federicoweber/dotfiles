  call plug#begin('~/.config/nvim/plugged')
  " Plugins {
    " status line
    Plug 'itchyny/lightline.vim'
    " Cool color theme
    Plug 'arcticicestudio/nord-vim'
    " Color picker & viewer
    Plug 'KabbAmine/vCoolor.vim'
    Plug 'etdev/vim-hexcolor'
    " Language Sintax
    Plug 'pangloss/vim-javascript'
    " GIT
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    " VIM Buffer
    Plug  'bling/vim-bufferline'
    " Linter
    Plug 'vim-syntastic/syntastic'
    Plug 'neomake/neomake'
    " finder
    Plug 'rking/ag.vim'
    " fzf finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " text manipulation
    Plug 'tpope/vim-surround'
    " Manage sessions
    Plug 'tpope/vim-obsession'
    " better split navigation
    Plug 'christoomey/vim-tmux-navigator'
    " phpcbf in vim
    Plug 'beanworks/vim-phpfmt'
    " indentation style with config files
    Plug 'editorconfig/editorconfig-vim'
    " use Ranger to explore files
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'
    " code completion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install tern', 'for': ['javascript', 'javascript.jsx'] }
    Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'ervandew/supertab'

    " Golang Support
    Plug 'fatih/vim-go'
    Plug 'zchee/deoplete-go', { 'do': 'make'}

    "Protobuf support
    Plug 'uarun/vim-protobuf'
" }

call plug#end()

" Here comes the look
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
colorscheme nord

" line numbers
set relativenumber "show relative line numbers
set number "show current line number
set ruler "show cursor position
" Toggle relative number visualizatioj
map <silent> <leader>r :set relativenumber!<CR>

" lightline config
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'separator': { 'left': '▓▒░ ', 'right': ' ░▒▓' },
      \ 'subseparator': { 'left': '¦', 'right': '¦' },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ }


" Get rid of disturbing sounds
set noerrorbells

" use mouse to resize splits
set mouse=n

" Better splitting
set splitbelow
set splitright

" Show space and tabs
set list
set listchars=tab:→\ ,nbsp:␣,trail:·,extends:»,precedes:«

" Set tabbing
set tabstop=2
set shiftwidth=2
set expandtab

" enable buffer switching without save
set hidden

" Search
set incsearch "Show search preview
set hlsearch "highlight search
"clear search highlight
nnoremap <silent> <leader><space> :<C-u>nohlsearch<CR>

" Linter settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" disable automatic check
let g:syntastic_mode_map = { 'mode': 'passive' }
" JS
let g:syntastic_javascript_checkers = ['standard']
" PHP
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'

"  code completion
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:SuperTabClosePreviewOnPopupClose = 1

" disable automatic formatting for php
let g:phpfmt_autosave = 0

" Key bindings
" Buffer navigation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> ]q :bdelete<CR>
" tab navigation
nnoremap <silent> [t :tabprev<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [T :tabfirst<CR>
nnoremap <silent> ]T :tablast<CR>
nnoremap <silent> tn :tabnew<CR>
nnoremap <silent> tq :tabclose<CR>
" quick list
nnoremap <silent> [c :cprev<CR>
nnoremap <silent> ]c :cnext<CR>
nnoremap <silent> [C :cfirst<CR>
nnoremap <silent> ]C :clast<CR>

" Tools
" Fuzzy file finder
function! s:find_git_root()
	return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <C-p>  :ProjectFiles<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
let g:fzf_height = 100

" Toggle Session recording with Obsession
map <silent> <leader>s :Obsession<CR>

" This hack is needded to use C-h to navigate splits in nvim see https://github.com/christoomey/vim-tmux-navigator
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

"Git bindings
map <silent> <leader>ga :Git add %<CR>
map <silent> <leader>gc :Gcommit<CR>
map <silent> <leader>gl :Glog -- %<CR>
map <silent> <leader>gs :Gstatus<CR>

" Syntastic bindings
map <silent> <leader>st :SyntasticToggleMode<CR>
map <silent> <leader>sc :SyntasticCheck<CR>
map <silent> <leader>sx :lcl<CR>

" Copy to system clipboard
map <Leader>y "+y

" close buffer
map <Leader>qq :q<CR>
map <Leader>w :w<CR>

" neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_php_enabled_makers = ['phpcs']
autocmd! BufWritePost,BufEnter * Neomake

nmap <Leader>o :lopen<CR>      " open location window
nmap <Leader>c :lclose<CR>     " close location window
nmap <Leader>, :ll<CR>         " go to current error/warning
nmap <Leader>n :lnext<CR>      " next error/warning
nmap <Leader>p :lprev<CR>      " previous error/warning
