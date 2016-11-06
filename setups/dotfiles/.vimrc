" 
" --------------------------------------------------------------

" ==============================================================
" Vundle Setup
" ==============================================================
set nocompatible              " be iMproved, required


" Automatic intall of vundle
let has_vundle=1
if !filereadable($HOME."/.vim/bundle/Vundle.vim/README.md")
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim
    let has_vundle=0
endif
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'

" -----------------------------------------------------------
" Keep Plugin commands between vundle#begin/end.
"Plugin 'tpope/vim-fugitive'  
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'            " Better syntax-highlighting
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'          " Shows git changes 
Plugin 'easymotion/vim-easymotion'       " Quick motion
Plugin 'tpope/vim-repeat'                " . uses plugins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'unblevable/quick-scope'         " highlighting for F/f movement
 
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'              
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

"Plugin 'Valloric/YouCompleteMe'
"Plugin 'matze/vim-move'        "Bug with Alt means not useable
Plugin 'tpope/vim-dispatch' 		" Tmux integration
"Plugin 'OrangeT/vim-csharp'
"
Plugin 'flazz/vim-colorschemes'

" -----------------------------------------------------------
" Language Specific Plugins

"Plugin 'Rykka/riv.vim'

"Plugin 'kchmck/vim-coffee-script'
" Plugin 'pangloss/vim-javascript'
" Plugin 'nvie/vim-flake8'    " Python check
" Plugin 'tmhedberg/SimpylFold'   " Python folding
" Plugin 'jmcantrell/vim-virtualenv'  "Venv support
" plugin 'omnisharp/omnisharp-vim'
" plugin from http://vim-scripts.org/vim/scripts.html

"Plugin 'vim-scripts/dbext.vim'     "Generic SQL Client
"Probable SqlComplete.vim dependency for dbext - http://www.vim.org/scripts/script.php?script_id=1572
" --------------------------------------------------------------

" Plugin 'L9'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==============================================================
" Plugin Settings
" ==============================================================

" NerdTree
noremap <c-n> :NERDTreeToggle<CR>

"vim-airline (always show)
set laststatus=2
let g:airline_powerline_fonts = 1

" UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" YCM
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" -----------------------------------------------------------
" Language Specific Plugin settings

" ==============================================================
" Editor Settings
" ==============================================================

syntax on
set encoding=utf-8
autocmd! bufwritepost .vimrc source %	" Write on save

set t_Co=256  " Colouring

set pastetoggle=<F2>
set clipboard=unnamed

set bs=2     " make backspace behave like normal again

" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)

noremap <c-j> <Esc><c-w>j
noremap <c-k> <Esc><c-w>k
noremap <c-l> <Esc><c-w>l
noremap <c-h> <Esc><c-w>h

noremap <S-Left> :vertical resize +5<CR>
noremap <S-Right> :vertical resize -5<CR>
noremap <S-Down> :res +5<CR>
noremap <S-Up> :res -5<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv
vnoremap > >gv

noremap ` :tabNext<CR>

" Showing line numbers and length
set number  " show line numbers
set nowrap  " don't automatically wrap on load

" Useful settings
" set history=700
" set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Save key (some terminals need old tty behavior turning off)
nnoremap <c-s> :w<CR>
vnoremap <c-s> <Esc><c-s>gv
inoremap <c-s> <Esc><c-s>

"" insert spaces in nm
nnoremap <Space> i<Space><Esc>
"map <c-x> <c-w>c
"nnoremap <CR> i<CR><Esc>
"Was interferring with flakes

"" disable arrowkeys to speed up
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"" insert line below and above respectively
map <F8> o<Esc>
map <F9> O<Esc>

"write protected file
cmap w!! w !sudo tee > /dev/null %

colorscheme molokai
