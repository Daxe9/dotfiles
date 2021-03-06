:set number
:set autoindent
:set tabstop=2
:set shiftwidth=0
:set smarttab
:set softtabstop=2
:set mouse=a

call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes' " Status bar theme
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Neovim color scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
" coc-tsserver coc-json coc-prettier coc-css coc-html*
set encoding=UTF-8
call plug#end()

let g:airline_theme='cobalt2'
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
:colorscheme tender

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" delete a whole word using ctrl+d
:imap <C-d> <C-[>diwi

" toggle nerdtree with f2
map <F2> :NERDTreeToggle<CR>

" tab for autocomplete
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

