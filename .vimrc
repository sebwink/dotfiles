""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL

set encoding=utf-8
set nu
"set term=
"set shell=/usr/local/bin/xonsh
set shell=/bin/bash

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DEFAULTS

set tabstop=4
set autoindent

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


" colors
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

set t_Co=256

if has('gui_running')
	set background=dark
	colors solarized
else
	colors zenburn
endif

"call togglebg#map("<F5>")

"Multiple cursors
Plugin 'terryma/vim-multiple-cursors'


" YCM
Plugin 'Valloric/YouCompleteMe'
let g:ycm_python_binary_path = 'python3'
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
set completeopt=menu
map <space>g :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Code linting
Plugin 'w0rp/ale'


" Navigation
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$', '\~$']
map <C-x> :NERDTreeToggle<CR>
Plugin 'jistr/vim-nerdtree-tabs'


" Misc
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/powerline', {'rtp':'powerline/bindings/vim'}
"set laststatus=2


" data
Plugin 'chrisbra/csv.vim'


" Snippets

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ultisnips_python_quoting_style="single"

" Python
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1
nnoremap X zc


" C/C++
Plugin 'derekwyatt/vim-fswitch'


" JavaScript & React

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'nikvdp/ejs-syntax'
Plugin 'isRuslan/vim-es6'


" HTML & CSS
"
Plugin 'mattn/emmet-vim'


" R

Plugin 'jalvesaq/Nvim-R'

let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1

Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'roxma/nvim-completion-manager'
Plugin 'gaalcaras/ncm-R'


" LaTeX
Plugin 'donRaphaco/neotex'
Plugin 'lervag/vimtex'

" TMUX
"
Plugin 'benmills/vimux'

Plugin 'jpalardy/vim-slime'
let g:slime_target = "tmux"

Plugin 'jebaum/vim-tmuxify'
let g:tmuxify_run = {
	\ 'cpp': 'make %:r > /dev/null && ./%:r',
	\ 'c': 'make %:r > /dev/null && ./%:r',
	\ 'python': 'python3 %',
	\ 'r': 'Rscript %',
	\ 'javascript': 'node %',
	\ 'rust': 'cargo run',
	\ 'ruby': 'ruby %',
	\ 'perl': 'perl %',
	\ 'sh': 'bash %',
	\ }

Plugin 'rgrinberg/vim-ocaml'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All of your plugins must be added before the following line
call vundle#end()     " required
filetype plugin indent on     " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERIC

" au BufRead,BufNewFile *.py, *.pyw, *.c, *.cpp, *.h match BadWhitespace /\s\+$/
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C / C++

autocmd Filetype cpp setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype c setlocal ts=4 sw=4 sts=0 expandtab

" Java

autocmd Filetype java setlocal ts=4 sw=4 sts=0 expandtab

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
au BufNewFile,BufRead *.ejs
	\ set tabstop=2        |
	\ set softtabstop=2    |
	\ set shiftwidth=2     

au BufNewFile,BufRead *.js
	\ set tabstop=2        |
	\ set softtabstop=2    |
	\ set shiftwidth=2     

au BufNewFile,BufRead *.jsx
	\ set tabstop=2        |
	\ set softtabstop=2    |
	\ set shiftwidth=2     

au BufNewFile,BufRead *.css
	\ set tabstop=2        |
	\ set softtabstop=2    |
	\ set shiftwidth=2     

au BufNewFile,BufRead *.html
	\ set tabstop=2        |
	\ set softtabstop=2    |
	\ set shiftwidth=2     

au BufNewFile,BufRead *.json
	\ set tabstop=2        |
	\ set softtabstop=2    |
	\ set shiftwidth=2     

au BufNewFile,BufRead *.yml
	\ set tabstop=2        |
	\ set softtabstop=2    |
	\ set shiftwidth=2     

au BufNewFile,BufRead *.ml
	\ set tabstop=2        |
	\ set softtabstop=2    |
	\ set shiftwidth=2     

set rtp+=~/learn/viml/mpc 

filetype off
set runtimepath+=/home/megabubu/tools/lilypond/usr/share/lilypond/current/vim/
filetype on 
syntax on
