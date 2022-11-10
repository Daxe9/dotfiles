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
set encoding=UTF-8
set completeopt=menu,menuone,noselect
set nobackup
set nowritebackup
set updatetime=100

" ----------------- Plugins -----------------
call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}
Plug 'github/copilot.vim'

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

" --------------------------------- Plugins settings ---------------------------------
let NERDTreeShowHidden=1

filetype plugin on
let g:NERDDefaultAlign = 'left'

colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

" connect to lua config file
lua require('_xie')

" --------------------------------- Key mapping ---------------------------------
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 

" copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
let g:copilot_assume_mapped = v:true

map <F3> :NERDTreeToggle<CR>

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
inoremap < <><Esc>ha

" --------------------------------- Commands --------------------------------

" define command for find and replace
command! -nargs=+ Fr execute '%substitute/' . split(<q-args>, ' ')[0] . '/' . split(<q-args>, ' ')[1] . '/gc'
