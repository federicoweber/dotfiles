  call plug#begin('~/.config/nvim/plugged')
  " Plugins {
    " status line
    Plug 'itchyny/lightline.vim'

    " Cool color theme
    Plug 'arcticicestudio/nord-vim'

    " Color picker & viewer
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

    " finder
    Plug 'rking/ag.vim'

    " text manipulation
    Plug 'tpope/vim-surround'

    " Manage sessions
    Plug 'tpope/vim-obsession'

    " better split navigation
    Plug 'christoomey/vim-tmux-navigator'

    " indentation style with config files
    Plug 'editorconfig/editorconfig-vim'

    " use Ranger to explore files
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'

    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    " Graphql
    Plug 'jparise/vim-graphql'

    " JSX & Typescript
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'

    " Intellisense Engine
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " .editorconfig
    Plug 'editorconfig/editorconfig-vim'
" }

call plug#end()

" Automatically re-read file if a change was detected outside of vim
set autoread

" enable spell-checking
set spell
set spelllang=en

" Here comes the look
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
colorscheme nord

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

" Toggle Session recording with Obsession
map <silent> <leader>s :Obsession<CR>

" This hack is needded to use C-h to navigate splits in nvim see https://github.com/christoomey/vim-tmux-navigator
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1


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
map <silent> <leader>gb :Git blame<CR>
map <silent> <leader>gc :Git commit<CR>
map <silent> <leader>gl :Git log -- %<CR>
map <silent> <leader>gs :Git<CR>

" Log variable under cursor
map <silent> <leader>pl yiwovar_dump(<C-r>0);<esc>
map <silent> <leader>jl yiwoconsole.log('<C-r>0', <C-r>0);<esc>

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

" better diff colors
" highlight DiffAdd        xxx term=bold ctermbg=12 guibg=LightCyan
" highlight DiffChange     xxx term=bold ctermbg=13 guibg=LightBlue
" highlight DiffDelete     xxx term=bold ctermfg=12 ctermbg=14 gui=bold guifg=Blue guibg=Red
" highlight DiffText       xxx term=reverse cterm=bold ctermbg=9 gui=bold guibg=Red
" set t_Co=16

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>di <Plug>(coc-implementation)
nmap <silent> <leader>f :CocCommand prettier.formatFile<cr>
nmap <leader>ac  <Plug>(coc-codeaction)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
"
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> K :call CocAction('doHover')<CR>

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
"
" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>

" === Telescope === "
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
lua << EOS
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})

require("telescope").load_extension("fzy_native")
EOS

