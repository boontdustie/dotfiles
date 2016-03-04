" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

" Vundle Configuration
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-airline'
Bundle 'vim-gitgutter'
" Bundle 'weynhamz/vim-plugin-minibufexpl'
Bundle 'chrisbra/vim-show-whitespace'

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set tw=77                         " Wrap 100 lines of text
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set laststatus=2                  " Show the status line all the time
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set cc=88

"http://vim.wikia.com/wiki/VimTip396
"Highlights extra whitespace as red.
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove white space
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set background=dark
colorscheme macvim

" Stop using the arrow keys dammit
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Map <F3> to :noh
nmap <F3> :noh<CR>

" Always show gitgutter
let g:gitgutter_sign_column_always = 1

" gitgutter color
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=black

" trade gitgutter accuracy for speed
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
