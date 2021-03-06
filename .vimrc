" Contents:
"    -> |General|
"    -> |Interface|
"    -> |Colors and Fonts|
"    -> |Files and backups|
"    -> |Text, tab and indent related|
"    -> |Moving around, tabs and buffers|
"    -> |Status_line|
"    -> |Mappings|
"    -> |Helper_functions|
"    -> |Plugins|
"    -> |Misc|


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ORIGIN REPO:
"
" > maintainer: 
" >       Amir Salihefendic
" >       http://amix.dk - amix@amix.dk
" >
" > Version: 
" >       5.0 - 29/05/12 15:43:36
" >
" > Blog_post: 
" >       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
" >
" > Awesome_version:
" >       Get this config, nice color schemes and lots of plugins!
" >
" >       Install the awesome version from:
" >
" >           https://github.com/amix/vimrc
" >
" > Syntax_highlighted:
" >       http://amix.dk/vim/vimrc.html
" >
" > Raw_version: 
" >       http://amix.dk/vim/vimrc.txt
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *General*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapleader
let mapleader = ","
let g:mapleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *Interface*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line Number
set number

" Show cmd while typing
set showcmd

" Scroll margin
set scrolloff=7

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Searching Pattern
set ignorecase
set smartcase
set incsearch
set hlsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Regular Expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

set completeopt=longest,menu



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *Colors and Fonts*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


if has("gui_running")
  set cursorcolumn
  set cursorline
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
else
  set cursorcolumn
  colorscheme desert
  set background=dark
endif

let g:indentLine_color_term = 239

set listchars=tab:▸- ",eol:¬
set list


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *Files, backups and undo*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *Text, Tab and Indent*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent
set smartindent
set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *Moving around, tabs, windows and buffers*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable arrow keys
map <LEFT> <Nop>
map <RIGHT> <Nop>
map <UP> <Nop>
map <DOWN> <Nop>

imap <LEFT> <Nop>
imap <RIGHT> <Nop>
imap <UP> <Nop>
imap <DOWN> <Nop>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" emacs C-a, C-e
nmap <C-a> 0
imap <C-a> <ESC>0i
nmap <C-e> $
imap <C-e> <ESC>$i

vmap << <gv
vmap >> >gv

map <F5> :tabprevious<cr>
map <F6> :tabnext<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" *Status line*
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=[%F]%y%r%m%*%=[CWD:%{getcwd()}][Line:%l/%L,Column:%c][%p%%]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *Mappings*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space> za
nnoremap <CR> i<CR><ESC>

nmap <F7> :NERDTreeToggle<cr>
nmap <F8> :! xdot %<.dot<cr><cr>

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *Helper functions*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FcitxClose()
    let l:a = system("fcitx-remote -c")
endfunction
autocmd InsertLeave * call FcitxClose()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *Plugins*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *Misc*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
