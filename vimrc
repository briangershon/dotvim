" general settings
set number
let mapleader = ","
let g:mapleader = ","

" turn off compatibility with vi (vim-fugitive requires this)
set nocompatible

" activate pathogen
filetype off
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

" set status line
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
set laststatus=2

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

" use normal regex when searching
nnoremap / /\v
vnoremap / /\v

" subsitute the whole file by default
set gdefault


" Filetype
" --------
filetype on
filetype plugin indent on

" filetype: JavaScript
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
let javascript_enable_domhtmlcss=1

