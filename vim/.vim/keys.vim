let mapleader = ","
noremap ; :
noremap <leader>VV <ESC>:so ~/.vimrc<CR>
noremap 0 ^

" noremap <ESC> <ESC>:nohl<CR>
" inoremap jj <Esc>

" inoremap <Left> <Esc>:bp<CR>
" inoremap <Right> <Esc>:bn<CR>
" vnoremap <Left> <Esc>:bp<CR>
" vnoremap <Right> <Esc>:bn<CR>
" nnoremap <Left> <Esc>:bp<CR>
" nnoremap <Right> <Esc>:bn<CR>
"
" noremap <leader>yy "+y
" noremap <leader>pp "+gP

nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>Q :q<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Select the text just pasted
nnoremap <leader>v V`]

