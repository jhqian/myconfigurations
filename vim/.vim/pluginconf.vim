execute pathogen#infect()

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>1 :TagbarToggle<CR>

" Colorscheme Solarized
" If want to use solarized in the terminal vim export TERM as below in .bashrc
" export TERM="xterm-256color"
syntax enable
set background=dark
" let g:solarized_termtrans=1
" let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1
