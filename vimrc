set encoding=utf-8
set nocompatible              " be iMproved, required
" TODO: confirm this filetype off behaviour
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
" Only run linters named in ale_linters settings.
" let g:ale_linters_explicit = 1

Plugin 'ctrlpvim/ctrlp.vim'
" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }


Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'

Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

" Plugin 'Valloric/YouCompleteMe'
" let g:ycm_use_clangd=0
nnoremap ff :YcmCompleter GoTo<CR>
nnoremap fi :YcmCompleter FixIt<CR>
let g:ycm_autoclose_preview_window_after_insertion = 1

" TODO: configure for dart
" let g:ycm_dart_bin_folder_path = '~/Library/flutter/bin'
" Plugin 'natebosch/vim-lsc'
" let g:lsc_server_commands = {'dart': 'dart_language_server'}

" TODO: configure auto-pairs effectively
Plugin 'jiangmiao/auto-pairs'

Plugin 'fatih/vim-go'
Plugin 'sheerun/vim-polyglot'
Plugin 'alvan/vim-closetag'

" Python
" Plugin 'python-mode/python-mode'
" let g:pymode_options_max_line_length=120
" Plugin 'cjrh/vim-conda'
" let g:conda_startup_msg_suppress = 1
" Plugin 'davidhalter/jedi-vim'
" let g:jedi#completions_enabled = 0

Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

Plugin 'vimwiki/vimwiki'

" Plugin 'altercation/vim-colors-solarized'
Plugin 'doums/darcula'

Plugin 'neoclide/coc.nvim'

call vundle#end()

filetype plugin indent on " Vundle is done now, we can move on with life

" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set ignorecase    " Ignore case for search
set nohlsearch    " Don't persist highlighting for search
set clipboard=unnamedplus

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»\ ,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 120 characters is
set textwidth=120
set colorcolumn=+1

" Numbers
set number
set numberwidth=3


" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Easier Escape
imap jk <Esc>
imap kj <Esc>

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
" set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
" set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" performance
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2

" Folding ----------------------------------------------------------------------
" TODO: configure folding
set foldmethod=indent
set foldcolumn=2
set foldlevel=99
nnoremap <space> za

syntax enable
syntax on
set background=dark
" let g:solarized_termcolors=256
colorscheme darcula

let g:asmsyntax="ia64"

filetype plugin indent on

set mouse=a
set lazyredraw
set complete=.
set noerrorbells
set visualbell

set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

set completeopt+=menuone   " Show the completions UI even with only 1 item
set completeopt+=noinsert  " Don't insert text automatically
