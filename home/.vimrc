execute pathogen#infect()
syntax on
set shiftwidth=4
set smarttab
set autoindent
set showtabline=2
set tabstop=4
set noshowmode
set laststatus=2
set relativenumber
set number
filetype plugin indent on
let g:airline_powerline_fonts=1
let g:bufferline_echo=0

filetype plugin on
filetype on
autocmd FileType tex setlocal spell spelllang=en_us
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*

let g:jellybeans_background_color_256='NONE'
colorscheme dracula	

set mouse=a
noremap <ScrollWheelUp> 4<C-Y>
noremap <ScrollWheelDown> 4<C-E>

noremap h j
noremap t k
noremap n h
noremap s l

nnoremap <C-H> <C-W><C-J>
nnoremap <C-T> <C-W><C-K>
nnoremap <C-N> <C-W><C-H>
nnoremap <C-S> <C-W><C-L>

noremap j n
noremap k t
noremap l s

noremap H J
noremap T K
noremap N H
noremap S L

noremap J N
noremap K T
noremap L S

noremap [ 7
noremap [ 7

noremap { 5
noremap 5 {

noremap } 3
noremap 3 }

noremap ( 1
noremap 1 (

noremap = 9
noremap 9 =

noremap * 0
noremap 0 *

noremap ) 2
noremap 2 )

noremap + 4
noremap 4 +

noremap ] 6
noremap 6 ]

noremap 8 !
noremap ! 8
