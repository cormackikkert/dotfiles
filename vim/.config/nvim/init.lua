vim.cmd(
[[
syntax on 
set number 
set noswapfile 
set hlsearch 
set ignorecase 
set incsearch
"set mouse+=a
"set mouse=a
"set ttymouse=xterm2
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
inoremap jk <ESC>
let mapleader = "'"

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldnestmax=2 " For classes
set foldlevel=99

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" Copy pasting
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Enable folding with the spacebar
nnoremap <space> za

" Enable tab lines 
" let g:airline#extensions#tabline#enabled = 1
" ================================== Vim Plug ============================== "
call plug#begin('~/.vim/plugged')
Plug 'drewtempelmeyer/palenight.vim' 
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'tmhedberg/SimpylFold'
Plug 'https://github.com/preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'ap/vim-css-color'
" Plug 'davidhalter/jedi-vim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'Pocco81/TrueZen.nvim'
Plug 'lervag/vimtex'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'preservim/tagbar'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'kwkarlwang/bufresize.nvim'
Plug 'junegunn/limelight.vim'
call plug#end()

set nocompatible
filetype plugin on
" =============================== Theme colours ============================ "
set background=dark
colorscheme gruvbox

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

let g:vimwiki_listsyms = ' ○◐●✓'

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (guicolors option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:airline_theme = "gruvbox"
let g:palenight_terminal_italics=1
let g:palenight_color_overrides = {'black': { 'gui': '#000000', "cterm": "0", "cterm16": "0" }}

" =========================== Normal Settings ==============================="
" Make airplane look nice
let g:tex_flavor = 'latex'
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = ['vimwiki', 'help', 'markdown', 'rst', 'org', 'text', 'asciidoc', 'tex', 'mail', 'pandoc' ]
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif



" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'



" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:vimtex_view_method = 'zathura'

" Pandoc
let g:pandoc#command#autoexec_on_writes = 1
let g:pandoc#command#autoexec_command = "Pandoc! pdf"
" =========================== COC =================== "
nmap <silent> gdd <Plug>(coc-definition)
nmap <silent> gdv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

set splitbelow
autocmd filetype cpp nnoremap <Leader>c :w <bar> :split \| terminal g++ -std=c++17 -O2 -Wall % -o %:r && ./%:r <CR> i
autocmd filetype cpp nnoremap <Leader>r :split \| terminal ./%:r <CR> i
autocmd BufNewFile *.cpp r /home/cormac/Code/competitive-programming/templates/skeleton.cpp
tnoremap <Esc> <C-\><C-n>)
hi Normal ctermbg=none
]]
)

local fn = vim.fn
vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

local plug_url_format = ""
if vim.g.is_linux then
  plug_url_format = "https://hub.fastgit.xyz/%s"
else
  plug_url_format = "https://github.com/%s"
end

local packer_repo = string.format(plug_url_format, "wbthomason/packer.nvim")
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

vim.diagnostic.config({
  virtual_text = false,
})
return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use 'wbthomason/packer.nvim'
	use({
	  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	})

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

