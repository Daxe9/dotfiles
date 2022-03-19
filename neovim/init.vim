:set number 
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set mouse=a

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes' " Status bar theme 
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Neovim color scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
" coc-tsserver coc-json coc-prettier coc-css
set encoding=UTF-8
call plug#end()

let g:airline_theme='cobalt2'
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
:colorscheme tender

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

" delete a whole word using ctrl+d
:imap <C-d> <C-[>diwi
