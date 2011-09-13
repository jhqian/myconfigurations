" Vim color file
" Maintainer:	Thorsten Maerz <info@netztorte.de>
" Last Change:	2001 Jul 23
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "eric_html"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal        guifg=Black         guibg=White
highlight Search        guifg=Black         guibg=lightblue     gui=bold
highlight Visual        guifg=Grey25                            gui=bold
highlight Cursor        guifg=Black         guibg=#C0C0C0         gui=bold
highlight Special       guifg=#c5a85f
highlight Comment       guifg=DarkCyan
highlight StatusLine    guifg=Black         guibg=DarkGrey      gui=NONE
highlight StatusLineNC  guifg=Black         guibg=DarkGrey      gui=italic
highlight Statement     guifg=DarkYellow                        gui=NONE
highlight Constant      guifg=#c5a85f  
highlight LineNr        guifg=DarkCyan
"highlight Title         guifg=DarkCyan                          gui=none
highlight Title         guifg=#8000FF                          gui=none
highlight ModeMsg       guifg=DarkGreen                         gui=none
highlight Identifier    guifg=#FF0080                           gui=NONE
highlight Folded        guibg=#003056
highlight CursorLine    guibg=#E8E5E5
highlight CursorColumn  guibg=#E8E5E5
highlight Pmenu         guifg=DarkGrey      guibg=#003056
highlight PmenuSel      guifg=Black         guibg=DarkCyan
highlight Type          guifg=#800000       gui=none
highlight Underlined    guifg=#004080
highlight Question      guifg=Red      gui=none

" Console
highlight Normal     ctermfg=LightGrey	ctermbg=Black
highlight Search     ctermfg=Black	ctermbg=Red	cterm=NONE
highlight Visual					cterm=reverse
highlight Cursor     ctermfg=Black	ctermbg=Green	cterm=bold
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=Blue
highlight StatusLine ctermfg=blue	ctermbg=white
highlight Statement  ctermfg=Yellow			cterm=NONE
highlight Type						cterm=NONE

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey	ctermbg=Black	cterm=NONE	guifg=Grey80      guibg=Black	gui=NONE
    highlight Search  ctermfg=Black	ctermbg=Red	cterm=bold	guifg=Black       guibg=Red	gui=bold
    highlight Visual  ctermfg=Black	ctermbg=yellow	cterm=bold	guifg=Grey25			gui=bold
    highlight Special ctermfg=LightBlue			cterm=NONE	guifg=LightBlue			gui=NONE
    highlight Comment ctermfg=Cyan			cterm=NONE	guifg=LightBlue			gui=NONE
  endif
endif

