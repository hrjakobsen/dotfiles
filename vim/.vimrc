set nocompatible 
filetype off


set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
let g:airline_powerline_fonts = 1
syntax on
"colorscheme monokai

if &term =~ '256color'
	    " Disable Background Color Erase (BCE) so that color schemes
	    "     " work properly when Vim is used inside tmux and GNU screen
	set t_ut=
endif
let g:airline#extensions#branch#enabled = 1
set number
set incsearch
set hlsearch

set encoding=utf-8
set laststatus=2
