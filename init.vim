" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
" copy from system clipboard
set clipboard=unnamed
" let the color compatiable to terminal
let &t_ut=' '
" automatic change working dir at now edit file's path
set autochdir

" ===
" === Editor behavior
" ===
" show line number
set number
" show relative line number
" set relativenumber
"show corsor line
set cursorline
" expand tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" apply the indentation of the current line to the next
set autoindent
" show the space at the end of line
set list
" show the tab
set listchars=tab:▸\ ,trail:▫
" corsor distance form buffer edge some lines
set scrolloff=4
" allow for mappings includes 'Esc', while preserving zero timeout after pressing it manually
set ttimeoutlen=0
set notimeout
" rember the cursor positon and other status when reopen file
set viewoptions=cursor,folds,slash,unix
" automatic line break
set wrap
" set text width
set tw=0
" expression whis is evaluated to obtain the proper indent for a line
set indentexpr=
" the kind of folding used for the current window
set foldmethod=indent
"
set foldlevel=99
set foldenable
set formatoptions-=tc
"
set splitright
set splitbelow
" enable mouse in vim
" set mouse=a
" if in insert, replace  or visual mode put a message on the last lie swith to not show this lie
set noshowmode
"show type command
set showcmd
" open command line comletion in enhanced mode
set wildmenu
"ignore case the word during the search
set ignorecase
set smartcase
" Some testing features
set shortmess+=c
"
set inccommand=split
"should make scrolling faster
set ttyfast
set lazyredraw
"
set visualbell
"
"high light search
set hlsearch
"charter by charter high light the entered words during the search
set incsearch

" open the fiel cursor at hte last edited position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Terminal Behavior
" ===
"
let g:neoterm_autoscroll = 1
"
autocmd TermOpen term://* startinsert
" tnoremap <C-N> <C-\><C-N>
" tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
" map ; :

" Save & quit
map S :w<CR>
map Q :q<CR>

" Reload config file
map R :source ~/.config/nvim/init.vim<CR>

" Open the vimrc file anytime
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open Startify
map <LEADER>st :Startify<CR>

" Make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>

" Clear all search high light
noremap <LEADER><CR> :nohlsearch<CR>

" ===
" === Cursor Movement
" ===
"
" J/K keys for 5 times j/k (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j
" J/L keys for 5 times j/l (faster navigation)
noremap <silent> H 5h
noremap <silent> L 5l

" Mapping <esc>
inoremap jj <ESC>

" Faster in-line navigation
"noremap W 5w
"noremap B 5b
" set h (same as n, cursor left) to 'end of word'
"noremap h e

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l

" Disabling the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

" Place the two screens up and down
map ss <C-w>t<C-w>K
" Place the two screens side by side
map sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

" ===
" === Tab management
" ===
" Create a new tab with tu
map tu :tabe<CR>
" Move around tabs with tj and tl
map tj :-tabnext<CR>
map tl :+tabnext<CR>
" Move the tabs with tmj and tml
map tmj :-tabmove<CR>
map tml :+tabmove<CR>

" ===
" === Terminal
" ===
" Opening a terminal window
noremap <LEADER>/ :term<CR>
" Using esc in term mode
:tnoremap <ESC> <C-\><C-n>
" No line number
:autocmd TermOpen * setlocal nonumber
" Term title
" :autocmd TermOpen * setlocal statusline=%{b:term_title}

" ===
" === Install Plugins with Vim-Plug
" === In normal mode type "PlugInstall" to install plugs
" ===
"vim-plug begin
call plug#begin('~/.config/nvim/plugged')

" Pretty Dress
" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" show the list of buffers in the command bar
Plug 'bling/vim-bufferline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' } 

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'itchyny/vim-cursorword'
Plug 'tmhedberg/SimpylFold'
Plug 'mhinz/vim-startify'

" Rainbow parentheses
Plug 'luochen1990/rainbow'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
" Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Ruby
" Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Go
" Plug 'fatih/vim-go', { 'for': 'go' }

" TypesSript
" Plug 'leafgarland/typescript-vim', { 'for': 'ts' }

" CoffeeScript
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

" Rust
" Plug 'rust-lang/rust.vim', { 'for': 'rs' }

" For general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'

" Other useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
"Plug 'yuttie/comfortable-motion.vim'
Plug 'brooth/far.vim'
Plug 'kassio/neoterm'
Plug 'vim-scripts/restore_view.vim'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'

"color
Plug 'connorholyday/vim-snazzy'


" Initialize plugin system
call plug#end()


" ===
" === coc
" ===
" fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
" 'coc-stylelint' removed for can't install
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss']
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
" Change completion windows background
hi Pmenu ctermfg=0 ctermbg=6 guibg=#444444
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff

" ===
" === Rainbow
" ===
let g:rainbow_active = 1

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>

" ===
" === CtrlP
" ===
map <C-p> :CtrlP<CR>
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-e>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-u>', '<up>'],
  \ }

" ===
" === UndoTree
" ===
let g:undotree_DiffAutoOpen = 0
map U :UndotreeToggle<CR>
