set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=0
set smarttab
set softtabstop=4
set mouse=a
set encoding=UTF-8
set clipboard=unnamedplus
set hidden
set scrolloff=8

" coc-vim settings
 set nobackup
 set nowritebackup
" suggestion appears time
 set updatetime=200
" set tab as navigate key in suggestion
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"     \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

set completeopt=menu,menuone,noselect
call plug#begin()

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}

Plug 'preservim/nerdcommenter'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdatte' } 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'neovim/nvim-lspconfig'
Plug 'ThePrimeagen/vim-be-good'
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes' " Status bar theme
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Neovim color scheme

call plug#end()

let NERDTreeShowHidden=1

filetype plugin on
let g:NERDDefaultAlign = 'left'

" connect to lua config file
lua require('_xie')

" --------- MAPPING
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 

map <F2> :NERDTreeToggle<CR>

" copy and paste directly to clipboard with + register
vnoremap y "+y
vnoremap p "+p

" exit from terminal modei
tnoremap <Esc> <C-\><C-n>
" map prettier to Ctrl p in normal mode
nmap <C-p> :!prettier -w . <CR>

" map find file to Ctrl f
nmap <C-f> :Telescope find_files <CR>

" open a pair of brackets and quotes
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" --------- END MAPPING

" define command for find and replace
command! -nargs=+ Fr execute '%substitute/' . split(<q-args>, ' ')[0] . '/' . split(<q-args>, ' ')[1] . '/gc'
