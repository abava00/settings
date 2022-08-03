syntax enable
"colorscheme torte
" colorscheme tender
" AirlineTheme luna
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
"set guifontwide=Cascadia_Code:h15
"nnoremap <F12> :set relativenumber!<CR>
set relativenumber

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    "GuiFont! HackGenNerd\ Console:h15
    GuiFont! UDEV\ Gothic\ NF:h15
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
set mouse=a
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
