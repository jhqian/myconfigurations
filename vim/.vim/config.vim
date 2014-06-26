filetype off
filetype plugin on
filetype indent on

set hidden

set guioptions=-

set foldmethod=indent 
set foldlevel=99
set foldenable

set mouse=a
set mousehide
set mousemodel=popup

" Better modes. Remeber where we are, support yankring
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo
set dir=~/.vim/sessions

set noswapfile
set nobackup
set nowritebackup

set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set colorcolumn=79

set undodir=~/.vim/pundo
set undofile

syntax on
set ruler
set cursorline
set ttyfast

set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.exe,*.jpg,*.jpeg,*.png,*.git,*$py.class,*.class

set autoindent smartindent

" Sane searching
set hlsearch
set incsearch
set showmatch

set cmdheight=2
set showcmd
set showmode
set number
set laststatus=2

set fileformats=unix,dos,mac
set scrolloff=5

" Syntax highlighting from the start
autocmd BufEnter * :syntax sync fromstart
