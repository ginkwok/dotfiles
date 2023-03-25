" Base on https://github.com/amix/vimrc/blob/d8db85c6634055ee44d87e1ba2a3daf87f3b60a9/vimrcs/basic.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread

" Enable filetype detection, plugins and indentation
filetype plugin indent on

" Use system clipboard
set clipboard=unnamedplus

" Allow switching buffers when there are unsaved changes
set hidden

" Speed up terminal display
set ttyfast

" Keep at least 3 lines of context when scrolling
set scrolloff=3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Highlight search results
set hlsearch

" Enable mouse support
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set utf8 as standard encoding
set encoding=utf8

" Underline the currently inserted row
autocmd InsertLeave * set nocul
autocmd InsertEnter * set cul

" Highlight the current line
set cursorline

" Highlight matching parentheses, brackets, etc.
set showmatch

" Highlight search results
set hlsearch

" Incremental search
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Automatically indent
set autoindent
set smartindent

set backspace=indent,eol,start

" Wrap lines
set wrap 

" Show line numbers
set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-plug BEGIN
" Use vim-plug as the plugin manager and define the plugins to be installed
call plug#begin('~/.vim/plugged')
    Plug 'itchyny/lightline.vim'      " A light and configurable statusline/tabline plugin
    Plug 'preservim/nerdtree'         " A tree explorer plugin
    Plug 'jiangmiao/auto-pairs'       " A plugin that automatically inserts matching pairs of parentheses, brackets, etc.
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " A fuzzy file finder plugin
    Plug 'junegunn/fzf.vim'           " A plugin that integrates FZF with Vim
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }   " A plugin that adds Go language support to Vim
    Plug 'Valloric/YouCompleteMe'     " A fast, as-you-type code completion engine for Vim
call plug#end()
" vim-plug END

" lightline BEGIN
" Configure lightline to use the "one" color scheme
    let g:lightline = {
        \ 'colorscheme': 'one',
        \ }
" lightline END

" nerdtree BEGIN
" Configure NERDTree to use various options
    let NERDChristmasTree=1           " Use Christmas tree styling for the file explorer
    let NERDTreeAutoCenter=1          " Automatically center the file explorer window
    let NERDTreeMouseMode=2           " Enable mouse support in the file explorer
    let NERDTreeShowBookmarks=1       " Show bookmarks in the file explorer
    let NERDTreeShowFiles=1           " Show files in the file explorer
    let NERDTreeShowHidden=1          " Show hidden files in the file explorer
    let NERDTreeShowLineNumbers=1     " Show line numbers in the file explorer
    let NERDTreeWinPos='left'         " Place the file explorer on the left side of the window
    let NERDTreeWinSize=31            " Set the width of the file explorer window
    "nnoremap f :NERDTreeToggle      " Map the "f" key to toggle the file explorer
    map <C-t> :NERDTreeToggle<CR>     " Map the "Ctrl+t" key combination to toggle the file explorer
" nerdtree END

" fzf BEGIN
" Add the FZF runtime path to the plugin runtime path
set rtp+=/usr/local/opt/fzf
" Map the "Ctrl+p" key combination to open FZF's file search window
map <C-p> :Files<CR>
" fzf END

" vim-go BEGIN

" Configure the vim-go plugin for Go development
let g:go_fmt_command = "goimports"  " Use goimports as default formatter
let g:go_highlight_types = 1  " Highlight type definitions
let g:go_highlight_fields = 1  " Highlight struct fields
let g:go_highlight_functions = 1  " Highlight function definitions
let g:go_highlight_function_calls = 1  " Highlight function calls
let g:go_highlight_extra_types = 1  " Highlight non-standard types
let g:go_highlight_operators = 1  " Highlight operators
let g:go_highlight_build_constraints = 1  " Highlight build constraints

let g:go_completion_engine = "gopls"  " Use gopls for code completion
let g:go_def_mode='gopls'  " Use gopls for Go to definition
let g:go_info_mode='gopls'  " Use gopls for Go information

" Enable autocomplete and popup suggestions for vim-go
let g:go_auto_sameids = 1  " Automatically complete identical identifiers
let g:go_auto_type_info_verbose = 1  " Show verbose type information
let g:go_auto_type_popup = 1  " Show type information in a popup
let g:go_auto_type_info_mode = "popup"  " Show type information in a popup

" Enable gopls integration for autocomplete, formatting, etc.
let g:go_completion_enabled = 1  " Enable code completion
let g:go_gopls_enabled = 1  " Enable gopls for additional functionality

" Enable automatic formatting on save
let g:go_fmt_autosave = 1

" Enable diagnostic messages in quickfix window
let g:go_list_type = "quickfix"  " Show errors and warnings in the quickfix window
let g:go_list_autosave = 1  " Save the quickfix list automatically

" Show documentation for identifier under cursor in preview window
let g:go_doc_popup_window = 1  " Show documentation in a preview window
let g:go_auto_type_info = 1  " Automatically show type information

let mapleader = "\<Space>"  " Set spacebar as the leader key

" Define custom mappings for vim-go plugin
nmap <leader>r <Plug>(go-run)  " Map leader key + r to run current Go file
nmap <leader>t <Plug>(go-test)  " Map leader key + t to run tests for current Go file
nmap <leader>b <Plug>(go-build)  " Map leader key + b to build current Go file
nmap <leader>c <Plug>(go-doc)  " Map leader key + c to show documentation for identifier under cursor

" vim-go END

" YouCompleteMe Begin
" Configure the YouCompleteMe plugin
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py' " Specify the path to the YCM extra configuration file
let g:ycm_key_invoke_completion = '<C-Space>' " Set the key combination to invoke YCM's autocompletion feature
let g:ycm_confirm_extra_conf = 0 " Disable the prompt to confirm loading of the extra configuration file
let g:ycm_autoclose_preview_window_after_completion=1 " Automatically close the preview window after completing a suggestion
let g:ycm_autoclose_preview_window_after_insertion=1 " Automatically close the preview window after inserting a suggestion
set completeopt=menuone,longest " Set the options for the completion menu
let g:ycm_language_server = 'gopls' " Use the Go language server provided by gopls for YCM's autocompletion feature
" YouCompleteMe END
