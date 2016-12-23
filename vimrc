call plug#begin('~/.vim/plugged')

" plugins will go here (see next step) 
" (be sure to replace 'Plugin' with 'Plug')
Plug 'derekwyatt/vim-scala'

Plug 'https://github.com/ervandew/supertab'

Plug 'https://github.com/jiangmiao/auto-pairs'

Plug 'https://github.com/scrooloose/nerdtree'

Plug 'https://github.com/jistr/vim-nerdtree-tabs'

Plug 'https://github.com/altercation/vim-colors-solarized'

Plug 'https://github.com/vim-syntastic/syntastic'

Plug 'https://github.com/xolox/vim-misc'

Plug 'https://github.com/xolox/vim-easytags'

Plug 'https://github.com/majutsushi/tagbar'

Plug 'https://github.com/ctrlpvim/ctrlp.vim'

Plug 'https://github.com/vim-scripts/a.vim'

Plug 'https://github.com/vim-airline/vim-airline'

Plug 'https://github.com/vim-airline/vim-airline-themes'

Plug 'https://github.com/airblade/vim-gitgutter'

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
let g:wirline#extensions#tabline#enabled = 1

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;~/.vimtags
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
colorscheme solarized
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" ----- scrooloose/syntastic settings -----
let gLsyntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


