" ~/.vimrc
"
" This is your Vim initialization file. It is read on Vim startup.
"
" Change this file to customize your Vim settings.
" 
" Vim treats lines beginning with " as comments.
"
" EXAMPLES are available in /usr/local/doc/startups.

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

call pathogen#infect()
"call pathogen#helptags()

filetype plugin on
filetype indent on

set textwidth=79

"set number
set ruler
" always show status line
set laststatus=2

let mapleader = ","
let maplocalleader = ","

" something else for latex
" set grepprg=grep\ -nH\ $*

" disable folding
set nofoldenable
let g:vim_markdown_folding_disabled=1

" only refresh on save
let g:instant_markdown_slow = 1

" keep the cursor away from the screen top/bottom
set scrolloff=5

autocmd QuickFixCmdPost *grep* cwindow
" Give a shortcut key to NERD Tree
"map <leader>e :NERDTreeToggle<CR>
"map <leader>f :NERDTreeFind<CR>

" compile to pdf and use preview
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'open -a Preview'

" one last thing for latex
let g:tex_flavor='latex'

" move within paragraph
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" make a shortcut to turn off all indentation
"nnoremap <C-i> :setl noai nocin nosi inde=<CR>

" use hardwrap for mkd
"let g:pandoc_use_hard_wraps = 1
"let g:pandoc_auto_format = 1
"let g:pandoc_no_folding = 1

" soft wrapping for mkd
"set formatoptions=1
autocmd FileType mkd,pandoc setlocal wrap
autocmd FileType mkd,pandoc setlocal linebreak
autocmd FileType mkd,pandoc setlocal tw=0
" spell check
autocmd FileType mkd,pandoc setlocal spell

function SetIndentSpaces(n)
  let &tabstop = a:n
  let &softtabstop = a:n
  let &shiftwidth = a:n
endfunction

" auto indent to 2 spaces
set autoindent
call SetIndentSpaces(2)
set expandtab

autocmd FileType tex,pandoc,mkd call SetIndentSpaces(4)
autocmd BufNewFile,BufReadPost *.coffee.md call SetIndentSpaces(4)

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

" keep swap files hidden away
set backupdir=$HOME/.vim_swap//,/tmp
set directory=$HOME/.vim_swap//,/tmp

" Switch buffers with double comma
map <Leader><Leader> <C-w>w

" Highlight search terms
set hlsearch
" Clear the search buffer with double slash
nmap // :let @/ = ""<CR>

" Easy edit of vimrc
nmap <Leader>vv :e $MYVIMRC<CR>
" Reload a new vimrc
nmap <Leader>vs :source $MYVIMRC<CR>

" No more shift for commands!
nnoremap ; :

" Show trailing whitespace
nmap <Leader>ww /\s\+$<CR>
" Remove trailing whitespace
nmap <Leader>wd :%s/\s\+$//<CR>
	
" Capture ESC for CommandT
let g:CommandTCancelMap = ['<ESC>', '<C-c>']
" Use ,o to open
nnoremap <silent> <Leader>o :CommandT<CR>
" Capture up and down keys - they read as EscO?
let g:CommandTSelectPrevMap= ['<C-p>', '<C-k>', '<Esc>OA', '<Up>']
let g:CommandTSelectNextMap= ['<C-n>', '<C-j>', '<Esc>OB', '<Down>']

" Make a Mongo query filetype
autocmd BufNewFile,BufReadPost *.mql setlocal filetype=mongoql

" Detect TypeScript
autocmd BufNewFile,BufReadPost *.ts setlocal filetype=typescript

"" Allow tab to be used for autocomplete
"function! SuperCleverTab()
"  if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
"      return "\<Tab>"
"  else
"      if &omnifunc != ''
"          return "\<C-X>\<C-O>"
"      elseif &dictionary != ''
"          return "\<C-K>"
"      else
"          return "\<C-N>"
"      endif
"  endif
"endfunction

"" Use tab for special autocomplete
"inoremap <Tab> <C-R>=SuperCleverTab()<cr>

" Remap default autocomplete trigger (not working!)
"inoremap <C-space> <C-x><C-o>

" Turn on autocomplete for various languages
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

