" Setup Vundle
set nocompatible " Required for Vundle
filetype off    " Required for Vundle

let mapleader = "\<Space>"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'  
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'

" Configure youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
nmap <leader>ne :NERDTree<cr>
nmap <leader>nt :NERDTreeToggle<cr>

Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on " Required for Vundle
" End of Vundle config

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" manages temporary files saved by Vim
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

inoremap jk <ESC>

set number        " Show line numbers
syntax enable     " Use syntax highlighting
syntax on

set background=light
colorscheme zenburn

set encoding=utf-8
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set cursorline
set showmatch
set hlsearch
set clipboard=unnamed

let g:solarized_termcolors = 256

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

"------------Start Python PEP 8 stuff----------------
"" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py set shiftwidth=4
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py set textwidth=100
"
" Use UNIX (\n) line endings.
au BufNewFile *.py set fileformat=unix
"
"  For full syntax highlighting:
let python_highlight_all=1

" Keep indentation level from previous line:
autocmd FileType python set autoindent

"----------Stop python PEP 8 stuff--------------

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

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
endif " has("autocmd")

