  call plug#begin('~/.config/nvim/plugged')
  " Plugins {
    " status line
    Plug 'itchyny/lightline.vim'
    " Cool color theme
    " Plug 'agreco/vim-citylights'
    Plug 'arcticicestudio/nord-vim'
    " Color picker & viewer
    Plug 'KabbAmine/vCoolor.vim'
    Plug 'etdev/vim-hexcolor'
    " Language Sintax
    Plug 'pangloss/vim-javascript'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'leafgarland/typescript-vim'
    " GIT
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    " VIM Buffer
    Plug  'bling/vim-bufferline'
    " Linter
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
    "Submode
    Plug 'kana/vim-submode'
    " Local eslint
    Plug 'benjie/neomake-local-eslint.vim'
    " GraphQL
    Plug 'jparise/vim-graphql'
    " Autocomplete
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" }

" Autocomplete
if has('win32') || has('win64')
  Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
else
  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
endif

call plug#end()

" enable spell-checking
set spell
set spelllang=en
" Here comes the look
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
colorscheme nord

" Sudmode settings
" disable submode timeouts:
let g:submode_timeout = 0
" don't consume submode-leaving key
let g:submode_keep_leaving_key = 1

" line numbers
set relativenumber "show relative line numbers
set number "show current line number
set ruler "show cursor position

" automatic switch line number mode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" lightline config
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'separator': { 'left': '▓▒░ ', 'right': ' ░▒▓' },
      \ 'subseparator': { 'left': '¦', 'right': '¦' },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'relativepath', 'readonly' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ }

" abbreviated path from https://github.com/itchyny/lightline.vim/issues/87#issuecomment-324988609
function! LightLineFilename()
  let name = ""
  let subs = split(expand('%'), "/") 
  let i = 1
  for s in subs
    let parent = name
    if  i == len(subs)
      let name = parent . '/' . s
    elseif i == 1
      let name = s
    else
      let name = parent . '/' . strpart(s, 0, 2)
    endif
    let i += 1
  endfor
  return name
endfunction

" Get rid of disturbing sounds
set noerrorbells

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
nnoremap <silent> <C-space> :<C-u>nohlsearch<CR>

"  code completion
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:SuperTabClosePreviewOnPopupClose = 1

" disable automatic formatting for php
let g:phpfmt_autosave = 0

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

" neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_php_enabled_makers = ['phpcs']
autocmd! BufWritePost,BufEnter * Neomake

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

"Git bindings
map <silent> <leader>ga :Git add %<CR>
map <silent> <leader>gb :Gblame<CR>
map <silent> <leader>gc :Gcommit<CR>
map <silent> <leader>gl :Glog -- %<CR>
map <silent> <leader>gs :Gstatus<CR>

" Syntastic bindings
map <silent> <leader>st :SyntasticToggleMode<CR>
map <silent> <leader>sc :SyntasticCheck<CR>
map <silent> <leader>sx :lcl<CR>

" Log variable under cursor
map <silent> <leader>pl yiwovar_dump(<C-r>0);<esc>
map <silent> <leader>jl yiwoconsole.log(<C-r>0);<esc>

" replace word under cursor in line
nnoremap  <leader>r yiw <bar> :s/<C-r>0//g<left><left>
" replace word under cursor in buffer
nnoremap  <leader>R yiw <bar> :%s/<C-r>0//g<left><left>
" replace matching word in visual selection
vnoremap  <leader>r :s///g<left><left>

" find word in files
nnoremap <leader>ff yiw :tabnew \| Ag <C-r>0
nnoremap <leader>fi yiw :tabnew \| Ag <C-r>0 --ignore "bundle.js"

" close and save buffer
nnoremap <C-q> :q<CR>
nnoremap <C-s> :w!<CR>
inoremap <C-s> <esc>:w!<CR>

" move line up
nnoremap <A-j> :m .+1<CR>==
" move line down
nnoremap <A-k> :m .-2<CR>==
" move line to the marked line and indent it
nnoremap <A-m> :m 'm<CR>==
" move line to the marked line and jump back to the line after it
nnoremap <A-M> jm`k :m 'm<CR> ``
" move visual selection to the marked line
vnoremap <A-m> :m 'm<CR>gv=

" replace word with last yanked one
map <leader>ry ciw<C-r>0<ESC>

" past yanked text
inoremap <C-v> <C-r>0

" Copy to system clipboard
map <A-y> "+y

" append date at the end of the line
nnoremap <A-D> A<C-r>=strftime("%x")<CR><ESC>
nnoremap <A-d> A<C-r>=strftime("%B %d %Y")<CR><ESC>

" find lines in current buffer
nmap <A-l> :BLines<CR>

" execute q macro
vnoremap <leader>q :norm! @q<CR>
nnoremap <leader>q @q


" linter navigation
nmap <leader>o :lopen<CR>      " open location window
nmap <leader>x :lclose<CR>     " close location window
nmap <leader>, :ll<CR>         " go to current error/warning
nmap <leader>n :lnext<CR>      " next error/warning
nmap <leader>p :lprev<CR>      " previous error/warning

" better diff colors
" highlight DiffAdd        xxx term=bold ctermbg=12 guibg=LightCyan
" highlight DiffChange     xxx term=bold ctermbg=13 guibg=LightBlue
" highlight DiffDelete     xxx term=bold ctermfg=12 ctermbg=14 gui=bold guifg=Blue guibg=Red
" highlight DiffText       xxx term=reverse cterm=bold ctermbg=9 gui=bold guibg=Red
" set t_Co=16
