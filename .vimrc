""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL

set encoding=utf-8
set nu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DEFAULTS

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE

set nocompatible   " required
filetype off       " required

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle shoudl install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MY PLUGINS

Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1
nnoremap X zc

Plugin 'vim-scripts/indentpython.vim'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_completion=1
map <space>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers = ['flake8']

Plugin 'nvie/vim-flake8'

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

set t_Co=256

if has('gui_running')
	set background=dark
	colors solarized
else
	colors zenburn
endif

Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$', '\~$']
map <C-n> :NERDTreeToggle<CR>
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp':'powerline/bindings/vim'}
set laststatus=2

Plugin 'derekwyatt/vim-scala'
let g:scala_scaladoc_indent = 1
let g:scala_indent = 2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All of your plugins must be added before the following line
call vundle#end()     " required
filetype plugin indent on     " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERIC

" au BufRead,BufNewFile *.py, *.pyw, *.c, *.cpp, *.h match BadWhitespace /\s\+$/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C / C++

autocmd Filetype cpp setlocal ts=4 sw=4 sts=0 expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PYTHON

let python_highlight_all=1
syntax on 

" PEP8 indentation
"au BufNewFile,BufRead *.py 
"	\ set tabstop=4 |
"	\ set softtabstop=4 |
"	\ set shiftwidth=4 |
"	\ set textwidth=79 |
"	\ set expandtab |
"	\ set autoindent |
"	\ set fileformat=unix  

" virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WEB DEVELOPMENT

" indentation
au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=2        |
	\ set softtabstop=2    |
	\ set shiftwidth=2     
