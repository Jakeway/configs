set nocompatible
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
filetype off    " Required

set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'  
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'

inoremap jk <ESC>
let mapleader = "\<Space>"
nmap <leader>ne :NERDTree<cr>
nmap <leader>nt :NERDTreeToggle<cr>


set number        " Show line numbers
syntax enable     " Use syntax highlighting
syntax on
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

filetype plugin indent on " Required

set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4 
set softtabstop=4 "number of spaces in tab when editing
set expandtab " tabs are spaces

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set cursorline
set showmatch

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif