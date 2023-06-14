call plug#begin()

Plug 'ericbn/vim-solarized'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

syntax enable 
filetype indent plugin on 
set autoindent

let &t_SI = "\<Esc>[6 q"
let &t_SI = "\<Esc>[2 q"

set background=dark
colorscheme solarized
set termguicolors

let s:mybg = "dark"
function! BgToggleSol()
    if (s:mybg ==? "light")
       set background=dark
       let s:mybg = "dark"
       " let g:airline_theme = 'base16_solarized_dark'
       " :AirlineRefresh
    else
       set background=light
       let s:mybg = "light"
       " let g:airline_theme = 'base16_solarized_light'
       " :AirlineRefresh
    endif
    " set background=light
    colorscheme solarized
endfunction
nnoremap <silent> <leader>af :call BgToggleSol()<cr>

" let g:airline_theme = 'base16_solarized_dark'
" let g:airline#extensions#tabline#enabled = 1

set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

set number relativenumber
set hidden
set wildmenu
set showcmd
set hlsearch
" higlight search but not when sourcing .vimrc
let @/ = ""
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set nostartofline
set backspace=indent,eol,start
set background=dark
set visualbell
set mouse=a

if has('nvim')
    let g:config_path = stdpath('config') . "/init.vim" " change / to \\ if Windows 
else
    let g:config_path = $HOME . "/.vimrc" " change / to \\ if Windows
endif


let mapleader = "\\"
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>sv :execute 'source ' . fnameescape(config_path) <CR>
nnoremap <silent> <leader>ev :execute 'vsplit ' fnameescape(config_path) <CR>
nnoremap <leader>h :nohlsearch <CR>
xnoremap <leader>y "*y
nnoremap <leader>p "*p

colorscheme tokyonight-night
" let g:airline_theme = "tokyonight"
" colorscheme peachpuff
