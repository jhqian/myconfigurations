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

" Cscope key maps
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>	

" moving between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-Left> <C-w><<C-w><
nnoremap <C-Right> <C-w>><C-w>>
nnoremap <C-Up> <C-w>+<C-w>+
nnoremap <C-Down> <C-w>-<C-w>-

" Shortcuts
nnoremap <leader>1 :TlistToggle<CR>
nnoremap <leader>2 :TagbarToggle<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

