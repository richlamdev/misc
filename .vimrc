" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Make the keyboard fast
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50

set showmode		" always show what mode we're currently editing in
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Show search matches while typing
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set nobackup            " do not keep a backup file, use versions instead
set history=500         " keep 500 lines of command line history
set ruler               " show the cursor position all the time
set nowrap              " NO WRAPPING OF THE LINES! (except for Python, see below)
set hlsearch    	" highlight all matches after search
set encoding=utf-8      " UTF8 Support
set bs=indent,eol,start " allow backspacing over everything in insert mode
set nu                  " set numbered lines for columns
"set rnu                 " set relative lines, if both set, line number is displayed instead of 0

" Do not set lines & columns for console vim....
"set lines=45
"set columns=80

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" To add the proper PEP8 indentation, add the following to your .vimrc:
autocmd BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set textwidth=0 |
    \ set smarttab |
    \ set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with |
    "\ set wrap linebreak nolist |

" Define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

" Flag extra whitespace
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" highlight all characters past 74 columns
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%79v.*/
augroup END

" map f9 to excute python script
autocmd FileType python nnoremap <buffer> <F9> :w<CR> :exec '!python3' shellescape(@%, 1)<CR>

"colorscheme torte
