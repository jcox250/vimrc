"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" Git plugin not hosted on GitHub


" Add Plugins Below
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'valloric/matchtagalways'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'sirver/ultisnips'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal!

" Enable Vim Features
set number
set backspace=indent,eol,start
set autowrite
set hlsearch
set cursorline
set colorcolumn=80
autocmd CompleteDone * pclose
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"Closes preview window after using autocomplete
autocmd CompleteDone * pclose

syntax on
colorscheme monokai

" Set trigger for snippets
let g:UltiSnipsExpandTrigger = "<c-d>"

" Ignore node_modules when searhcing for files
set wildignore=~/Users/jamescox/**/node_modules/**
let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_custom_ignore = 'vendor'

"
" For mouse click in NERDTree
:set mouse=a
let g:NERDTreeMouseMode=3

""""""""""""""""""""""""""""""
" Golang Specific Operations
""""""""""""""""""""""""""""""
setlocal omnifunc=go#complete#Complete

"vim-go
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')


let g:go_auto_type_info = 1
let g:go_guru_scope = ["github.com/flexera/...", "github.com/bdna/...", "github.com/jcox250/..."]

" Tell vim-go that goimports is installed
let g:go_fmt_command = "goimports"

" Tell vim-go to highlight
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_updatetime = 400


" Open go doc in verticle window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef" <CR>
au FileType go nmap <Leader>i <Plug>(go-info)

""""""""""""""""""""""""""""""
" End Go Specific Operations "
""""""""""""""""""""""""""""""
