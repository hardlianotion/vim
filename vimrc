set exrc
set secure

call plug#begin('~/.vim/plugged')

" plugins will go here (see next step) 
" (be sure to replace 'Plugin' with 'Plug')
Plug 'derekwyatt/vim-scala'

Plug 'https://github.com/ervandew/supertab'

Plug 'https://github.com/jiangmiao/auto-pairs'

Plug 'https://github.com/scrooloose/nerdtree'

"Etheruem contract development language.  Syntax highlighting
Plug 'tomlion/vim-solidity'

Plug 'https://github.com/jistr/vim-nerdtree-tabs'

"colour scheme
Plug 'https://github.com/altercation/vim-colors-solarized'

"Clojure linter.
Plug 'https://github.com/venantius/vim-eastwood.git'

Plug 'https://github.com/tpope/vim-salve.git'

"language server
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}

" syntax checker
Plug 'https://github.com/vim-syntastic/syntastic'

Plug 'https://github.com/xolox/vim-misc'

"jump to definition
Plug 'https://github.com/xolox/vim-easytags'

Plug 'https://github.com/majutsushi/tagbar'

Plug 'https://github.com/tpope/vim-fireplace.git'

"managing brackets and other enclsures
Plug 'https://github.com/tpope/vim-surround'

Plug 'https://github.com/guns/vim-sexp.git'

Plug  'https://github.com/tpope/vim-sexp-mappings-for-regular-people.git'

"unstructured file search and dsiplay
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

Plug 'https://github.com/vim-scripts/a.vim'

"configure statusline
Plug 'https://github.com/vim-airline/vim-airline'

Plug 'https://github.com/vim-airline/vim-airline-themes'

" git diff
Plug 'https://github.com/airblade/vim-gitgutter'

" git commands
Plug 'https://github.com/tpope/vim-fugitive'

Plug 'https://github.com/jez/vim-superman'

Plug 'https://github.com/christoomey/vim-tmux-navigator'

call plug#end()

filetype plugin indent on

" ----- jez/vim-superman settings -----
"  better man page support
noremap K :SuperMan <cword><CR>

" ----- bling/vim-airline settings -----
"  Always show statusbar
set laststatus=2

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airlin#extensions#hunks#non_zero_only = 1

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
" https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the last line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste = 1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
" ----- xolox/vim-easytags settings -----
" Where to look for tags files
" set tags=./.tags,.~/.vimtags,tags,./tags,tags;$HOME
set tags=.tags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
" autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabls_open_on_console_startup = 1 

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

syntax enable
set background=dark
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
autocmd FileType json syntax match Comment +\/\/.\+$+
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

