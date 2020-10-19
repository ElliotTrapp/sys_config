"" execute pathogen#infect()
filetype plugin indent on
syntax on

" pathogen set up stuff to allow installing vim packages
"" call pathogen#infect()
"" call pathogen#helptags()
"
"" syntastic plugin settings for linting in vim
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_config_file = '.clang_format'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_cpp_compiler = 'clang++'
"
"" set the default clip buffer to use the system clipboard so you can yank and then use ctrl-v
"" to paste in other applications. This requires your version of vim to support the option `+clipboard`
"" check by calling `vim --version | grep clipboard`. On redhat, install the vim-X11 package, which provides 
"" vimx, then set an alias to have `vim` point to the enhanced version i.e. put `alias vim=/usr/bin/vimx`
"" in your .bashrc or whatever
"
"" show line numbers by default
"set number
" Default tab / spacing for other applications (ie for python and bash), 
" use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB (\t) is set to 4
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Set the number of columns for a tab
set expandtab       " Expand tabs to spaces            
set smarttab
set hlsearch

" Fix delete key on Apple keyboards
set backspace=indent,eol,start



set encoding=utf-8
set nocompatible
set t_Co=256
set t_ut=
set background=dark
set showmatch
" Sets clipboard to yank into system clipboard
set clipboard=unnamed

" NEW STUFF

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

set ruler         " show the cursor position all the time

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
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.md setlocal spell
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile aliases.local,zshrc.local,*/zsh/configs/* set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END

" /NEW STUFF



" turn hybrid line numbers on
" set number relativenumber
" set nu rnu

"" turn hybrid line numbers off
"set nonumber norelativenumber
"set nonu nornu
"
"" toggle hybrid line numbers
"set number! relativenumber!
"set nu! rnu!

syntax on

setlocal foldmethod=syntax
set foldlevelstart=100

if (empty($TMUX))

  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif


endif
if (has("termguicolors"))
    set termguicolors
endif

"" let g:onedark_termcolors=256

"" colorscheme onedark

"Some links for further reading:
"https://clang.llvm.org/docs/ClangFormatStyleOptions.html
" 
"https://github.com/vim-syntastic/syntastic
"https://www.python.org/dev/peps/pep-0008/#a-foolish-consistency-is-the-hobgoblin-of-little-minds
"https://vim.fandom.com/wiki/Accessing_the_system_clipboard
