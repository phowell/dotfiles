" Install vim-plug if missing
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent! execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'arcticicestudio/nord-vim'

" UI
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'

" Be like an IDE
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'tpope/vim-fugitive'

" Languages
Plug 'rust-lang/rust.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" General Settings
syntax on
syntax enable
set mouse=a
set ruler
set noshowmode
set hidden
set cursorline

set emoji
set termguicolors


set ignorecase
set smartcase

set tabstop=4
set softtabstop=4
set shiftwidth=4

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Appearance
colorscheme nord

" Make it obvious where 80 characters is
highlight ColorColumn ctermbg=236 guibg=#3B4252
let &colorcolumn=join(range(80,999),',')

" Line Numbering
set number relativenumber

set splitbelow
set splitright


augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Language Specific
"
" Python
let g:python_host_prog = "/home/peterh/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog = "/home/peterh/.pyenv/versions/neovim3/bin/python"

"Keybindings

"Navigate neovim + neovim terminal emulator with Ctrl+direction
tnoremap <c-h> <C-\><C-n><C-w>h
tnoremap <c-j> <C-\><C-n><C-w>j
tnoremap <c-k> <C-\><C-n><C-w>k
tnoremap <c-l> <C-\><C-n><C-w>l
inoremap <c-h> <C-\><C-n><C-w>h
inoremap <c-j> <C-\><C-n><C-w>j
inoremap <c-k> <C-\><C-n><C-w>k
inoremap <c-l> <C-\><C-n><C-w>l
nnoremap <c-h> <C-\><C-n><C-w>h
nnoremap <c-j> <C-\><C-n><C-w>j
nnoremap <c-k> <C-\><C-n><C-w>k
nnoremap <c-l> <C-\><C-n><C-w>l

" Exit Neovim Terminal with \esc
tnoremap <leader><esc> <C-\><C-n><esc><cr>


" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_left_sep = "\uE0C6"
let g:airline_right_sep = "\uE0C7"
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'
let g:airline_symbols.readonly = ''
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#right_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '



" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['autopep8', 'isort']}
let g:ale_fix_on_save = 1


" Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview  
