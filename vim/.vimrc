" Vundle start ---------
update nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf.vim'
call vundle#end()            " required
filetype plugin indent on    " required
" Vundle end ----------

noremap ; :
noremap : ;

nnoremap <Up> :<Up>
nnoremap <Left> :silent messages<CR>

" fzf
noremap <Space>f :Files<CR>

set relativenumber
set number
set tabstop=4
set shiftwidth=4
set expandtab
set undofile
set hlsearch
set smartcase
set ignorecase
set scrolloff=10
set cursorline

hi CursorLine cterm=NONE ctermbg=234
hi CursorLineNr cterm=NONE ctermbg=0
