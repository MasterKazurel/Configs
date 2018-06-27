"
"  \ \   / _ _|   \  |  _ \   __| 
"   \ \ /    |   |\/ |    /  (    
"    \_/   ___| _|  _| _|_\ \___|
"
" @author: Karl Brandenberger

execute pathogen#infect()

let mapleader = " "

" -- Window Management -- "
nmap <leader>w<Right>   :wincmd l<CR>
nmap <leader>w<Left>    :wincmd h<CR>
nmap <leader>w<Up>      :wincmd k<CR>
nmap <leader>w<Down>  :wincmd j<CR>
nmap <leader>wl       :wincmd l<CR>
nmap <leader>wh       :wincmd h<CR>
nmap <leader>wk       :wincmd k<CR>
nmap <leader>wj       :wincmd j<CR>

nmap <leader>w/       :vsplit<CR>
nmap <leader>w-       :split<CR>
nmap <leader>wd       :wincmd q<CR>  
nmap <F2>             <C-w><C-w>

" -- NerdTree -- "
map <F1> :NERDTreeToggle<CR>

" -- Buffer Management -- "
nmap <F3> :bprevious<CR>
nmap <F4> :bnext<CR>

" -- Handy Mappings -- "
noremap ; :reg<CR>

" -- Remaps -- "
vnoremap $ $<Left>

nnoremap H B
nnoremap L W

nnoremap K <NOP>
nnoremap J <NOP>


" -- Coloring and Themes -- "
syntax on
set t_Co=256
colorscheme iceberg
filetype indent plugin on

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='cool'


" -- Tabs and Spaces -- "
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set cindent
set smartindent
set autoindent

" -- Searching -- "
set hlsearch
set incsearch

set lazyredraw
set wildmenu  



" -- Numbering lines -- "
set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber 
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber

    autocmd BufEnter,FocusGained,InsertLeave * set colorcolumn=80
augroup END

" -- Startup Commands -- "
autocmd VimEnter * :badd scratch

" -- NerdTree Configs -- "
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" Open nerd tree on vim opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Open nerd tree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

