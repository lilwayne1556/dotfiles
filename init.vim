" Space as leader
let mapleader=" "

set nocompatible
filetype plugin indent on

"Plugins
call plug#begin("~/.config/nvim")

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'majutsushi/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rstacruz/vim-closer'
Plug 'takac/vim-hardtime'

" Window management
Plug 'wesQ3/vim-windowswap'
Plug 'simeji/winresizer'

" Movement
Plug 'justinmk/vim-sneak'


" Font size
Plug 'drmikehenry/vim-fontsize'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neoyank.vim'

Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
Plug 'majutsushi/tagbar'
Plug 'andymass/vim-matlab', {'for': 'matlab'}
Plug 'christoomey/vim-tmux-navigator'

Plug 'harenome/vim-mipssyntax'

call plug#end()

"Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_detect_modified=1
let g:airline_detect_spell=1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
set laststatus=2

"NERD Tree
nmap <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Tabular
nmap <leader>a= :Tab /=<CR>
vmap <leader>a= :Tab /=<CR>
nmap <leader>a: :Tab /:\zs<CR>
vmap <leader>a: :Tab /:\zs<CR>
nmap <leader>a<space> :Tab /
vmap <leader>a<space> :Tab /
nmap <leader>a/ :%Tab /\/\/<CR>
vmap <leader>a/ :Tab /\/\/<CR>

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list  = 1
let g:syntastic_auto_loc_list             = 1
let g:syntastic_check_on_open             = 1
let g:syntastic_check_on_wq               = 0
let g:syntastic_enable_signs              = 1
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_auto_loc_list = 0

"Deoplete
let g:python3_host_prog = "C:/Python37/python.exe"
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
inoremap <S-Tab> <C-V><Tab>
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory = '~/.config/nvim/plugged/neosnippet-snippets/neosnippets'
let g:neosnippet#enable_snipmate_compatibility = 1

" Ctrl-b to open Tagbar
map <C-b> :TagbarToggle<CR>

" Tmux
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" Denite
nnoremap <leader>: :Denite command<CR>
nnoremap <leader>" :Denite register<CR>
nnoremap <leader>b :Denite buffer:!<CR>
nnoremap <leader>K :DeniteCursorWord help<CR>
nnoremap <leader>R :Denite file_mru<CR>
nnoremap <leader>Y :DeniteCursorWord neoyank<CR>
nnoremap <leader>y :Denite neoyank<CR>
nnoremap <C-p> :Denite file_rec<CR>
nnoremap <leader>/ :Denite grep:.<CR>
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

" Hardtime
let g:hardtime_default_on = 0

"Window Movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

"Basic Remapping
inoremap jk <ESC>
nmap <leader>s :w!<CR>
nmap <leader>q :q!<CR>
nmap , za

" Function key remaps
" Remove empty space at the end of a line
nnoremap <silent> <F2> mz:let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>`z
" Fix tab
nnoremap <silent> <F3> mzgg=G`z
" Remove ^M
nnoremap <silent> <F4> :s///<CR>
" Run makefile
nnoremap <silent> <F5> :make<CR>
" Reload file
nnoremap <silent> <F6> :e %<CR>

"General
set backupdir=~/.config/nvim/backup,.
set directory=~/.config/nvim/backup,.

"Styling
syntax on
set autoindent
set copyindent
set backspace=indent,eol,start
set ignorecase
set smartcase
set ruler
set nu!
set rnu!
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set background=dark
colorscheme desert
set guifont=Hack
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set ignorecase
set nohlsearch
set foldmethod=indent