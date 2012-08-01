" Default size of window
set columns=175
set lines=40

" turn off the gui elements
set guioptions-=T

" OS Specific
if has("gui_macvim")
    " use the whole screen
    "set fuoptions=maxvert,maxhorz

    "set guifont=Monaco:h10
    set guifont=Menlo\ Regular:h14
    "set guifont=Droid\ Sans\ Mono:h12

    "set noantialias
    " maybe set the transparency
    set transparency=2

    " theme
    syntax enable
    set background=light
    colorscheme solarized
endif
