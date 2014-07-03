filetype off
filetype plugin on
filetype indent on

syntax enable
set background=dark

set lazyredraw              " redraw only when we need to

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
" set cursorline
set ttyfast

set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.exe,*.jpg,*.jpeg,*.png,*.git,*$py.class,*.class

set autoindent smartindent

" Sane searching
set hlsearch
set incsearch
set showmatch                   " highlight matching [{()}]

set cmdheight=2
set showcmd
set showmode
set number
set laststatus=2
set wrap!

set fileformats=unix,dos,mac
set scrolloff=5

" Syntax highlighting from the start
autocmd BufEnter * :syntax sync fromstart

" now set it up to change the status line based on mode
if version >= 700
	au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
	au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

function! InsertStatuslineColor(mode)
	if a:mode == 'i'
		hi statusline guibg=magenta
	elseif a:mode == 'r'
		hi statusline guibg=blue
	else
		hi statusline guibg=red
	endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=green

" default the statusline to green when entering Vim
" hi statusline guibg=green

" toggle between number and relative number
function! ToggleNumber()
    if (&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
