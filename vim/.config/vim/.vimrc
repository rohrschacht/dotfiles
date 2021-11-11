""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Intro
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let skip_defaults_vim=1
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp=$XDG_CONFIG_HOME/vim/rtp,/usr/share/vim/vimfiles,/usr/share/vim/vim81,/usr/share/vim/vim82,/usr/share/vim/vimfiles/after

set viminfo+=n~/.config/vim/viminfo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
  Plug 'godlygeek/tabular'
  Plug 'ConradIrwin/vim-bracketed-paste/'
  Plug 'ervandew/supertab'
  Plug 'tpope/vim-commentary'
  Plug 'chase/vim-ansible-yaml'
  Plug 'morhetz/gruvbox'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Common settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set noexpandtab
set autoindent
set smartindent

" show powerline:
set laststatus=2

" code around cursor always visible
set scrolloff=5

" Code readability
set number relativenumber
"set colorcolumn=80

" vim built-in filemanager
filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete
set path+=**
set wildmenu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <F10> :NERDTreeToggle<CR>
:imap fd <Esc>
nmap <Space>fs :w<CR>
nmap <Space>qq :q<CR>

cmap sw w !sudo tee > /dev/null %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color theme (from rwxrob)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set t_Co=256

set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype associated settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ansible
au BufRead,BufNewFile *.yml set filetype=ansible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" airline
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
autocmd vimenter * hi LineNr guibg=NONE ctermbg=NONE
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
