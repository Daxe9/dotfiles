:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=0
:set smarttab
:set softtabstop=4
:set mouse=a
:set encoding=UTF-8
:set clipboard=unnamedplus
:set hidden
:set scrolloff=8

" coc-vim settings
:set nobackup
:set nowritebackup
" suggestion appears time
:set updatetime=300
" set tab as navigate key in suggestion
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"     \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" nerd tree settings
map <F2> :NERDTreeToggle<CR>

call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter' 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'neovim/nvim-lspconfig'
Plug 'ThePrimeagen/vim-be-good'
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes' " Status bar theme
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Neovim color scheme
" Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
" coc-tsserver coc-json coc-prettier coc-css coc-html*

" Plug 'yaegassy/coc-volar'
" Plug 'yaegassy/coc-volar-tools'

call plug#end()

" connect to lua config file
lua require('_xie')


:imap <C-d> <C-[>diwi


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" copy and paste directly to clipboard with + register
vnoremap y "+y
vnoremap p "+p

" exit from terminal modei
tnoremap <Esc> <C-\><C-n>
" map prettier to Ctrl p in normal mode
nmap <C-p> :!prettier -w . <CR>

" When enter use NERDTree
autocmd VimEnter * NERDTree
