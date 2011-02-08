" turn off compatibility with vi (vim-fugitive requires this)
set nocompatible

" activate pathogen
filetype off
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

" general settings
set number
let mapleader = ","
let g:mapleader = ","
set autoread                  " watch for file changes

" set status line
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
                                " selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=1            " show statusline only if there are > 1 windows
    " Use the commented line if fugitive isn't installed
    "set statusline=%&lt;%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P " a statusline, also on steroids
    "set statusline=%&lt;%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif


" make it easy to edit .vimrc and reload after save
nmap <leader>v :tabedit $MYVIMRC<CR>
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Searching
" ---------
" find as you type
set incsearch

" highlight search terms
set hlsearch

" make searches case-insensitive
set ignorecase

" make searches case-sensitive if they contain upper-case letters
set smartcase

" a toggle for search highlight
map <silent> <leader>H :set hlsearch!<CR>

" shortcut to clear search pattern
map <silent> <leader>h :let @/ = ""<CR>

" subsitute the whole file by default
set gdefault


" Filetype
" --------
filetype on
filetype plugin indent on

" filetype: HTML, CSS and JavaScript
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
let javascript_enable_domhtmlcss=1
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Commenting
vnoremap <silent> gc <ESC>:call NERDComment(1, "toggle")<cr>

