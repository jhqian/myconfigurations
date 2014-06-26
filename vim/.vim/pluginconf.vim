execute pathogen#infect()

" Tagbar
let g:tagbar_usearrows = 1

" Taglist
let Tlist_Exit_OnlyWindow = 1       " Exit if taglist is last window open
let Tlist_Show_One_File = 1         " Only show tags for current buffer

" Colorscheme Solarized
" If want to use solarized in the terminal vim export TERM as below in .bashrc
" export TERM="xterm-256color"
syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
" let g:solarized_visibility="high"
colorscheme solarized

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1
