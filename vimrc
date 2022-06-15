set exrc
set secure

call plug#begin('~/.vim/plugged')

" plugins will go here (see next step) 
" (be sure to replace 'Plugin' with 'Plug')
Plug 'derekwyatt/vim-scala'

Plug 'https://github.com/jiangmiao/auto-pairs'

Plug 'https://github.com/scrooloose/nerdtree'

"Etheruem contract development language.  Syntax highlighting
Plug 'tomlion/vim-solidity'

Plug 'https://github.com/jistr/vim-nerdtree-tabs'

"colour scheme
Plug 'https://github.com/altercation/vim-colors-solarized'

"fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
nmap <C-P> :FZF<CR>

"language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" syntax checker
Plug 'https://github.com/vim-syntastic/syntastic'

Plug 'https://github.com/xolox/vim-misc'

"jump to definition
Plug 'https://github.com/xolox/vim-easytags'

Plug 'https://github.com/majutsushi/tagbar'

"managing brackets and other enclsures
Plug 'https://github.com/tpope/vim-surround'

Plug 'https://github.com/guns/vim-sexp.git'

Plug  'https://github.com/tpope/vim-sexp-mappings-for-regular-people.git'

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

autocmd FileType json syntax match Comment +\/\/.\+$+

" ~/.vimrc
" Configuration for coc.nvim

set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have a bad experience with diagnostic messages with the default 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType scala setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Reveal current current class (trait or object) in Tree View 'metalsBuild'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsBuild<CR>


