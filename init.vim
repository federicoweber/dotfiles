  call plug#begin('~/.config/nvim/plugged')
  " Plugins {
    " ctrl-p is a fuzzy file finder.
    " Plug 'kien/ctrlp.vim'
    " airline is a better status line and a tab-bar for nvim.
    Plug 'bling/vim-airline'
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
    " finder
    Plug 'mileszs/ack.vim'
    " fzf finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1
let g:airline_skip_empty_sections = 1 "hide error angles when empty
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v ', '%{ObsessionStatus('' '', '''')}'])
let g:bufferline_echo = 0

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
nnoremap <silent> <space> :<C-u>nohlsearch<CR><space> 


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
nnoremap <silent> tn :tabnew<CR>
nnoremap <silent> tq :tabclose<CR>

" Tools
map <silent> <C-p> :FZF<CR>
" Toggle Session recording with Obsession
map <silent> <leader>o :Obsession<CR>

" This hack is needded to use C-h to navigate splits in nvim see https://github.com/christoomey/vim-tmux-navigator
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
