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

if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
                                " selected characters/lines in visual mode
endif

set laststatus=2                                          " statusline setup
if has('statusline')
  "set statusline=\ \ \ \ \ line:%l\ column:%c\ \ \ %M%Y%r%=%-14.(%t%)\ %p%%
  set statusline=   " clear the statusline, allow for rearranging parts
  set statusline+=%f\                "Path to the file, as typed or relative to current dir
  set statusline+=%#errormsg#        "change color
  set statusline+=%{&ff!='unix'?'['.&ff.']':''}   "display a warning if fileformat isnt unix
  set statusline+=%*                "reset color to normal statusline color
  set statusline+=%#errormsg#       "change color
  set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}   "display a warning if file encoding isnt utf-8
  set statusline+=%*                "reset color to normal statusline color
  set statusline+=\ %y              "filetype
  set statusline+=%([%R%M]%)        "read-only (RO), modified (+) and unmodifiable (-) flags between braces
  set statusline+=%{'~'[&pm=='']}   "shows a '~' if in patchmode
  set statusline+=\ %{fugitive#statusline()}  "show Git info, via fugitive.git
  "set statusline+=\ (%{synIDattr(synID(line('.'),col('.'),0),'name')}) "DEBUG : display the current syntax item name
  set statusline+=%#error#          "change color
  set statusline+=%{&paste?'[paste]':''}    "display a warning if &paste is set
  set statusline+=%*                "reset color to normal statusline color
  set statusline+=%=                "right-align following items
  set statusline+=#%n               "buffer number
  set statusline+=\ %l/%L,          "current line number/total number of lines,
  set statusline+=%c                "Column number
  set statusline+=%V                " -{Virtual column number} (Not displayed if equal to 'c')
  set statusline+=\ %p%%            "percentage of lines through the file%
  set statusline+=\                 "trailing space
  if has('title')
    set titlestring=%t%(\ [%R%M]%)
  endif
endif

" Enhanced command menu ctrl + d to expand directories
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.pyc,*.pyo,CVS,.svn,.git,*.mo,.DS_Store,*.pt.cache,*.Python,*.o,*.lo,*.la,*~

" use ,80 to highlight everything over the 80th column
"let maplocalleader=','        " all my macros start with ,
"nmap <LocalLeader>80  <Esc>:match ErrorMsg '\%>80v.\+'<CR>

" make it easy to edit .vimrc and reload after save
nmap <leader>v :tabedit $MYVIMRC<CR>
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
nmap <leader>r :tabedit $HOME/.vim/README.mdown<CR>

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

" hide the backup and swap files
set backupdir=~/.backup/vim,.,/tmp
set directory=~/.backup/vim/swap,.,/tmp

" highlight the cursor line
set cursorline

" The first setting tells vim to use "autoindent" (that is, use the current
" line's indent level to set the indent level of new lines). The second makes
" vim attempt to intelligently guess the indent level of any new line based on
" the previous line.
set autoindent
set smartindent

" turn off smart indentation when pasting
set pastetoggle=<F2>
" shortcut for pasting clipboard contents
map <silent> <leader>* "+gP

" This setting will cause the cursor to very briefly jump to a 
" brace/parenthese/bracket's "match" whenever you type a closing or 
" opening brace/parenthese/bracket.
set showmatch

" have fifty lines of command-line (etc) history:
set history=1000

" Display an incomplete command in the lower right corner of the Vim window
set showcmd

" Set a margin of lines when scrolling
set so=4


" set all window splits equal
set equalalways

" have the mouse enabled all the time:
set mouse=a
" make a menu popup on right click
set mousemodel=popup

" By default, vim doesn't let the cursor stray beyond the defined text. This 
" setting allows the cursor to freely roam anywhere it likes in command mode.
" It feels weird at first but is quite useful.
"set virtualedit=all

" make sure the bell shuts up
set t_vb=

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

