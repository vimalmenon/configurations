call plug#begin()
	" Appearance 
	Plug 'vim-airline/vim-airline'
	Plug 'ryanoasis/vim-devicons'
	Plug 'vim-airline/vim-airline-themes'

   " TS
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

 
  "Colors
	Plug 'ap/vim-css-color'
  Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'

  " NerdTree
  Plug 'preservim/nerdtree'

	"Other
	Plug 'rhysd/vim-healthcheck'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  "Plug
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'

  "Plug for Python
  Plug 'davidhalter/jedi-vim'

call plug#end()

" Syntax
filetype plugin indent on
syntax on

"Tab
set tabstop=2
set expandtab
set shiftwidth=2

"Options
set background=dark
set number
set relativenumber
set splitbelow splitright
set title
set mouse=a
set clipboard=unnamedplus
set wildmenu
set cursorline

" Use highlighting when doing a search.
set hlsearch

set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font:h11

set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Italics
let &t_ZH = "\e[3m"
let &t_ZR = "\e[23m"

" Color scheme and themes
let t_Co = 256
colorscheme iceberg

set laststatus=2


" Cursor Mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


" Airline
let g:airline_theme='night_owl'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_nerdtree = 1

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver']

let g:jedi#environment_path = "/usr/local/Caskroom/miniconda/base/bin/python"

" Leader
let mapleader = ','

hi! Visual term=reverse cterm=reverse guibg=Grey

" basic remappings
nnoremap <C-s> :w!<CR>
nnoremap <C-q> :q!<CR>
nnoremap <F1> :CheckHealth<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F10> :CocCommand tsserver.organizeImports<CR>

" TABS Mapping
nnoremap <S-Tab> gT<CR>
nnoremap <Tab> gt<CR>
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <C-f> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Navigation through buffer
map bn :bn<cr>
map bp :bp<cr>
map bd :bd<cr>

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <leader><up> <c-w>+
noremap <leader><down> <c-w>-
noremap <leader><left> <c-w>>
noremap <leader><right> <c-w><

" Yank from cursor to the end of line.
nnoremap Y y$


" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz


noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


