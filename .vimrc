"
" ~/.vimrc
"
" This is your Vim initialization file. It is read on Vim startup.
"
" Change this file to customize your Vim settings.
" 
" Vim treats lines beginning with " as comments.
"
" EXAMPLES are available in /usr/local/doc/startups.
"

call pathogen#infect()
call pathogen#helptags()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype plugin on
filetype indent on

set textwidth=70

"set number
set ruler

let mapleader = ","
let maplocalleader = ","

" something else for latex
" set grepprg=grep\ -nH\ $*

" Give a shortcut key to NERD Tree
"map <leader>e :NERDTreeToggle<CR>
"map <leader>f :NERDTreeFind<CR>

" compile to pdf and use preview
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'open -a Preview'

" one last thing for latex
let g:tex_flavor='latex'

" word wrap w/o line breaks
"set formatoptions=1
"set linebreak
" move within paragraph
"nnoremap j gj
"nnoremap k gk
"vnoremap j gj
"vnoremap k gk

" make a shortcut to turn off all indentation
"nnoremap <C-i> :setl noai nocin nosi inde=<CR>

" use hardwrap for markdown
"let g:pandoc_use_hard_wraps = 1
"let g:pandoc_auto_format = 1

" soft wrapping for markdown
autocmd FileType pandoc set tw=0
" spell check
autocmd FileType pandoc set spell

" auto indent to # spaces
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

autocmd FileType ocaml set ts=2
autocmd FileType ocaml set sts=2
autocmd FileType ocaml set sw=2
autocmd FileType ocaml set textwidth=90

autocmd FileType tex,pandoc set ts=4
autocmd FileType tex,pandoc set sts=4
autocmd FileType tex,pandoc set sw=4

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax enable

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
" Terminal.app needs to have solarized installed, and use the ansi
" terminal type
colorscheme solarized
"colo lucius

" Switch buffers with double comma
map <Leader><Leader> <C-w>w

" Highlight search terms
set hlsearch
" Clear the search buffer with Enter
nmap <CR> :let @/ = ""<CR>

" Easy edit of vimrc
nmap <Leader>vv :e $MYVIMRC<CR>
" Reload a new vimrc
nmap <Leader>vs :source $MYVIMRC<CR>

" No more shift for commands!
nnoremap ; :
	
" Capture ESC for CommandT
let g:CommandTCancelMap = ['<ESC>', '<C-c>']
" Use ,o to open
nnoremap <silent> <Leader>o :CommandT<CR>
" Capture up and down keys - they read as EscO?
let g:CommandTSelectPrevMap= ['<C-p>', '<C-k>', '<Esc>OA', '<Up>']
let g:CommandTSelectNextMap= ['<C-n>', '<C-j>', '<Esc>OB', '<Down>']

" Turn on autocomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

if has("autocmd")

" Have Vim jump to the last position when reopening a file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

" Remove trailing whitespace on write for some filetypes
  "autocmd FileType js,ocaml,html,css autocmd BufWritePre <buffer> :%s/\s\+$//e

" Have Vim load indentation rules according to the detected filetype. Per
" default Debian Vim only load filetype specific plugins.
  filetype indent on

endif

set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set autowrite          " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a            " Enable mouse usage (all modes) in terminals

