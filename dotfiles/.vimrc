set nocompatible
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim

if has("gui_running")
    "set guioptions-=T
    set guioptions=aiA
    set t_Co=256
    set background=dark
    " colorscheme koehler
    colorscheme ps_color
    set nonu
else
    colorscheme koehler
    set background=dark
    set nonu
endif

function! MySys()
	if has("win16") || has("win32") || has("win64") || has("win95")
		return "windows"
	elseif has("unix")
		return "linux"
	elseif has("mac")
		return "mac"
	endif
endfunction

if MySys() == "mac"
    set gfn=Menlo:h14
    set shell=/bin/bash
elseif MySys() == "windows"
    "set gfn=Courier\ New:h10
    set gfn=Bitstream\ Vera\ Sans\ Mono:h10
    "set gfn=DejaVu\ Sans\ Mono:h10
    "set gfn=Lucida\ Console:h10
    "set gfn=Monaco:h9:cANSI
	let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
    " set gfn=Monospace\ 10
    "set gfn=Monaco\ 10
    set shell=/bin/bash
	let $VIMFILES = $HOME.'/.vim'
endif

try
    if MySys() == "windows"
        set undodir=c:\windows\Temp
    else
        set undodir=~/.undodir
    endif
    set undofile
catch
endtry

" 配置多语言环境
if has("multi_byte")
	" UTF-8 编码
	set encoding=utf-8
	set termencoding=utf-8
	set formatoptions+=mM
	set fencs=utf-8,gbk

	if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
		set ambiwidth=double
	endif

	if has("win32")
		source $VIMRUNTIME/delmenu.vim
		source $VIMRUNTIME/menu.vim
		language messages zh_CN.utf-8
	endif
else
	echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" set diffexpr=MyDiff()
" function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let eq = ''
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      let cmd = '""' . $VIMRUNTIME . '\diff"'
"      let eq = '"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction
"
" Enable filetype plugin
filetype plugin on
filetype indent on

set history=999
set ai              "Auto indent
set so=7
set go=
set nowrap          " no wrap
" set ic              " ignore case
set showcmd         " display incomplete commands
set ruler           " show the cursor position all the time
set incsearch       " do incremental searching
" set et              " expand tab, use spaces
set sm              " disp {[(
set ts=4            " tabstop
set softtabstop=4   " softtabstop
set sw=4            " 
set smarttab        " give spaces for tabstop
set lbr
set tw=500
set nu              " show line number
set cul             " highlight current line
set nocuc           " not highlight current column
set wildmenu
set ruler
set cmdheight=2
set hid             "Change buffer - without saving
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set si              "Smart indnt
set smartcase
set hlsearch        "Highlight search things
set incsearch       "Make search act like search in modern browsers
set nolazyredraw    "Don't redraw while exeuting macros
set magic           "Set magic on, for regular expressions
set showmatch       "Show matching bracets when text indicator is over them
set mat=2           "How many tenths of a second to blink
set ffs=unix,dos,mac "Defaul file types
set encoding=utf8
set autoread        " Set to auto read when a file is changed from the outside
set wildignore=*.o,*.obj,*.bak,*.exe,*.out,*.dat
set clipboard=unnamed " use windows clipboard as default
" set foldtext=       " don't display text for folded content
set nocuc " highlight current line, not highlight current column

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set mousem=popup    " right click mouse will pop up a window
set encoding=utf-8
set mouse=a
" No backup file
set nobackup
set nowritebackup
set noswapfile

syntax enable "Enable syntax hl

" Only do this part when compiled with support for autocommands
if has("autocmd")
	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\	exe "normal g'\"" |
	\ endif
endif

" highlight over width text
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%79v.\+/

" Fast vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" functions & mappings
function! InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
     endif
endfunction

function! ProjectTagUpdateCscope()
    "kill cscope connection
    set nocsverb
    if(cscope_connection())
      execute "cscope kill 0"
      echo system("cscope -b")
      execute "cscope add cscope.out"
    endif
    set csverb
endfunction

function! CmdLine(str) 
    exe "menu FooBar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

fun! VisualSearch(direction) range
    let l:save_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?". l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/' . l:pattern . '/' . '**/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Taglist section
nmap <F3> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1       " Exit if taglist is last window open
let Tlist_Show_One_File = 1         " Only show tags for current buffer

" Fast saving
nmap <leader>w :w!<cr>

nmap <F5> :call ProjectTagUpdateCscope()
" 删除行尾空格
nmap <F12> :%s,\s\+$,,g<CR>
" 切换折行
nmap <F2> :set wrap!<CR>

" generate html file
noremap 2html :so $VIMRUNTIME/syntax/2html.vim
" open the directory for the current file 
func! OpenCWD()
    if has("gui_running")
        if has("win32")
            let s:stored_shellslash = &shellslash
            set noshellslash
            !start explorer %:p:h
            let &shellslash = s:stored_shellslash
        elseif has("gui_kde")
            !koehlernqueror %:p:h &
        elseif has("mac") && has("unix")
            !open %:p:h
        endif
    endif
endfunction
command! OpenCWD call OpenCWD()

"noremap <silent> <F7> :call OpenCWD()<CR>
noremap <silent> <C-o> :call OpenCWD()<CR>

" nmap <C-e> :sp d:\cashbox\vim\_vimrc<CR>
nmap <leader>l :source d:\cashbox\vim\_vimrc<CR>
nmap <leader>e :e d:\cashbox\vim\_vimrc<CR>
nmap gc :new +e %:p:h<CR>
nmap <a-t> :!time /t && date /t<CR>

vnoremap <silent> * :call VisualSearch('f')<cr>
vnoremap <silent> * :call VisualSearch('b')<cr>
vnoremap <silent> gv :call VisualSearch('gv')<cr>
"map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

inoremap <s-Space> <c-r>=InsertTabWrapper()<cr>

" moving between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-Left> <C-w><<C-w><
nnoremap <C-Right> <C-w>><C-w>>
nnoremap <C-Up> <C-w>+<C-w>+
nnoremap <C-Down> <C-w>-<C-w>-

inoremap <C-h> <left>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-l> <Right>
inoremap <M-h> <C-o>b
inoremap <M-l> <C-o>w
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Turn off/on with CTRL-N
"map <silent> <C-N> :set invhlsearch<CR>  

" Turn off/on with CTRL-I
map <silent> <C-i> :set invignorecase<CR>

:let g:toggleWrap=1

" --------------------
" OmniCppComplete
" --------------------
set ofu=syntaxcomplete#Complete
" set Ctrl+j in insert mode, like VS.Net
"imap <C-j> <C-X><C-O>
" :inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<c-g>u\<CR>"
" set completeopt as don't show menu and preview
set completeopt=longest,menu
" Popup menu hightLight Group
highlight Pmenu ctermbg=13 guibg=DarkGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black 
" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 2
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation 
" part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1
" This option allows to show/hide the access information ('+', '#', '-') in the 
" popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace 
" declarations in included files and want to add namespaces 
" that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]
" Complete Behaviour
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
" When 'completeopt' does not contain "longest", Vim automatically select 
" the first entry of the popup menu. You can change this behaviour 
" with the OmniCpp_SelectFirstItem option.
" let OmniCpp_SelectFirstItem = 1
  
" neocomplcache
let g:neocomplcache_enable_at_startup = 1

set showmatch
set lbr
map <slient> <F9> <Esc> :cprevious<CR>
map <slient> <F10> <Esc> :cnext<CR>
set nocp
set nocursorline
set ignorecase smartcase " 搜索时忽略大小写,但在一个或以上大写字母是仍大小写敏感
" set nowrapscan " 禁止在搜索到文件两端时重新搜索
set noerrorbells " 关闭错误铃声
set novisualbell " 关闭使用可视铃声
set hidden " 允许在有位保存的修改时切换缓冲区,由vim负责保存
