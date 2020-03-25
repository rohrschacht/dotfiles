" vimrc - e560 - avivace

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp=$XDG_CONFIG_HOME/vim/rtp,/usr/share/vim/vimfiles,/usr/share/vim/vim82,/usr/share/vim/vimfiles/after

" If it's the first start, install vim-plug and every plugin
if empty(glob('$XDG_CONFIG_HOME/vim/rtp/autoload/plug.vim'))
  silent !curl -fLo $XDG_CONFIG_HOME/vim/rtp/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim plug
call plug#begin('~/.config/vim/rtp/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'chrisbra/Colorizer'
  Plug 'scrooloose/nerdtree'
  Plug 'crusoexia/vim-monokai'
  Plug 'godlygeek/tabular'
  Plug 'ConradIrwin/vim-bracketed-paste/'
  Plug 'ervandew/supertab'
  Plug 'tpope/vim-commentary'
  Plug 'chase/vim-ansible-yaml'
call plug#end()

" color scheme
syntax on
set t_Co=256

" show powerline:
set laststatus=2

" .pl for prolog, not perl
" I use perl more than prolog
" au BufRead,BufNewFile *.pl set filetype=prolog

au BufRead,BufNewFile *.yml set filetype=ansible

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set noexpandtab
set autoindent
set smartindent

" Code readability
set number relativenumber
"set colorcolumn=80

" Disable BCE
if &term =~ '256color'
  set t_ut=
endif

"colorscheme monokai
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1

nmap <F10> :NERDTreeToggle<CR>
" imap fd <ESC>
:imap fd <Esc>
nmap <Space>fs :w<CR>
nmap <Space>qq :q<CR>

filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete
set path+=**
set wildmenu

set viminfo+=n~/.config/vim/viminfo
