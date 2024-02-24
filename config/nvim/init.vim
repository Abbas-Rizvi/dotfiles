set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
"set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=100                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
set autoread
" set cursorline              " highlight current cursorline
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
"






"###        Rebind Keys     #####
" move between panes to left/bottom/top/right
 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l



"####       Vim Wiki        ####
" move the wiki to documents folder
" use markdown for syntax of notes

let g:vimwiki_list = [{'path': '~/documents/vimwiki/',
                      \ 'path_html': '~/documents/vimwiki/html',
                      \ 'syntax': 'markdown', 'ext': '.wiki'}]

let g:vimwiki_global_ext = 0 " Stop vim wiki from reading all md as wiki files

"####       Vim Plug        #####
call plug#begin()

"Plug 'dracula/vim'  " Dracula theme for neovim
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'


call plug#end()



"####       Other           #####



