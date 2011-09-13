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
let g:colors_name = "eric_dark"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal        guifg=DarkGrey      guibg=#04294f
highlight Search        guifg=Black	        guibg=lightblue	    gui=bold
highlight Visual        guifg=Grey25	    		            gui=bold
highlight Cursor        guifg=Black	        guibg=Green	        gui=bold
highlight Special       guifg=#c5a85f
highlight Comment       guifg=DarkCyan
highlight StatusLine    guifg=Black	        guibg=DarkGrey      gui=NONE
highlight StatusLineNC  guifg=Black	        guibg=DarkGrey      gui=italic
highlight Statement     guifg=DarkYellow			            gui=NONE
highlight Constant      guifg=#c5a85f  
highlight LineNr        guifg=DarkCyan
highlight ModeMsg       guifg=DarkGreen                         gui=none
highlight Type						                            gui=NONE
highlight Folded        guibg=#003056
highlight CursorLine    guibg=#003056
highlight CursorColumn  guibg=#003056
highlight Pmenu         guifg=DarkGrey      guibg=#003056
highlight PmenuSel      guifg=Black         guibg=DarkCyan
highlight Title         guifg=#E3F580       gui=none
"#7dc4ff
highlight Question      guifg=#ff69b4 gui=none 
highlight Todo          guifg=black guibg=#FF69B4 gui=bold

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

