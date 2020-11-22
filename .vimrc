" set compatibility to vim only
set nocompatible
packadd! matchit

" peristent undo
set undofile

" set syntax highLighting
syntax on

" set line numbering
set relativenumber

" search option
set incsearch
set ignorecase

" use tab, 4 spaces long
set tabstop=4
set softtabstop=4
set shiftwidth=4

" use autoindent
set autoindent
filetype plugin indent on

" search down into subfolder
set path+=**

" display all matching files when we tab complete
set wildmenu

" display current file name at the bottom
set laststatus=2

" Netrw config
filetype plugin on
let g:netrw_banner=0 " hide banner
let g:netrw_liststyle=3 " tree mode

" use nsam syntax color for .s and .asm files
autocmd BufNewFile,BufRead *.asm set ft=nasm
autocmd BufNewFile,BufRead *.s set ft=nasm

" SNIPPETS:
nnoremap ,rtc :-1read $HOME/.vim/snippets/struct.c<CR>A
nnoremap ,hg :-1read $HOME/.vim/snippets/headerguard.h<CR>:.,+1s/xxx/\=toupper(expand('%r'))/g<CR>k:.,+1s/\./_/g<CR>:.+5d<CR>kka
nnoremap ,mc :-1read $HOME/.vim/snippets/main.c<CR>:.+5d<CR>kkA

" auto-add 42 header (and headerguard) when creating file
autocmd BufNewFile *.c execute "normal \<F1>"
autocmd BufNewFile *.h execute "normal \<F1>,hg"
