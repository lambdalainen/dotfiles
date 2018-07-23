set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Yifan's plugins starts from below
Plugin 'scrooloose/nerdtree.git'

" <haskell>
" (http://www.stephendiehl.com/posts/vim_2016.html)
"Plugin 'eagletmt/ghcmod-vim.git'
"Plugin 'eagletmt/neco-ghc'
"Plugin 'ctrlpvim/ctrlp.vim.git'
Plugin 'scrooloose/syntastic.git'
"Plugin 'tomtom/tlib_vim.git'
"Plugin 'MarcWeber/vim-addon-mw-utils.git'
"Plugin 'garbas/vim-snipmate.git'
"Plugin 'scrooloose/nerdcommenter.git'
"Plugin 'godlygeek/tabular.git'
"Plugin 'ervandew/supertab.git'
"Plugin 'Shougo/neocomplete.vim.git'
"requires manual compilation
"Plugin 'Shougo/vimproc.vim'
" </haskell>

" <cpp>
"Plugin 'octol/vim-cpp-enhanced-highlight'
" </cpp>

" <erlang>
"Plugin 'vim-erlang/vim-erlang-runtime.git'
"Plugin 'vim-erlang/vim-erlang-compiler.git'
Plugin 'vim-erlang/vim-erlang-omnicomplete.git'
Plugin 'vim-erlang/vim-erlang-tags.git'
Plugin 'vim-erlang/vim-erlang-skeletons.git'
" </erlang>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" <nerdtree>
" Autostart nerdtree
"autocmd VimEnter * NERDTree
" Move the cursor away from the nerdtree window
"autocmd VimEnter * wincmd p
" Toggle nerdtree with \n
map <Leader>n :NERDTreeToggle<CR>
" </nerdtree>

" <common>
syntax on

set number
set wrap "" was nowrap but I think wrap is better
" -- http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set linebreak
set nolist
set showmode
" --
" tw was 80 but it causes more trouble than convenience
set tw=0
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
" Enable mouse use in all modes, ttymouse=xterm2 by default
set mouse=a
set history=1000
set clipboard=unnamedplus,autoselect

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

set cmdheight=1
" </common>

" <haskell>
" (also from http://www.stephendiehl.com/posts/vim_2016.html)
" Some common settings are moved to <common>

" syntastic
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" ghc-mod
"map <silent> tw :GhcModTypeInsert<CR>
"map <silent> ts :GhcModSplitFunCase<CR>
"map <silent> tq :GhcModType<CR>
"map <silent> te :GhcModTypeClear<CR>

" supertab
"let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
"
"if has("gui_running")
"  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
"else " no gui
"  if has("unix")
"    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
"  endif
"endif
"
"let g:haskellmode_completion_ghc = 1
"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" tabularize
"let g:haskell_tabular = 1
"
"vmap a= :Tabularize /=<CR>
"vmap a; :Tabularize /::<CR>
"vmap a- :Tabularize /-><CR>

" ctrl-p
"map <silent> <Leader>t :CtrlP()<CR>
"noremap <leader>b<space> :CtrlPBuffer<cr>
"let g:ctrlp_custom_ignore = '\v[\/]dist$'
" </haskell>

" Somehow this fixes the 'yy' problem on macos
set clipboard=unnamed

" This fixes the backspace problem on macos
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Highlight searches
set hlsearch
hi Search ctermbg=81
hi Visual ctermbg=9

" Switching between tabs
nnoremap <C-S-Left> :tabprevious<CR>
nnoremap <C-S-Right> :tabnext<CR>
