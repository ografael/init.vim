set clipboard+=unnamed
set title
set confirm
set autoindent
set number
set relativenumber
set nohlsearch
set incsearch
set termguicolors
set showtabline=2
set laststatus=2
set wrap
set linebreak
set showbreak=>\ \ \
set expandtab
set undofile
set undodir=~/.vim/undodir
set nobackup
set cursorline
set clipboard+=unnamedplus

set foldenable
set foldlevelstart=10
set foldmethod=indent

syntax on

filetype on
filetype plugin indent on
filetype indent on

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2

augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber

" plugins init
call plug#begin('~/.vim/plugged')

" git
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'

" navigation
Plug 'preservim/nerdtree'

" utils
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-unimpaired'
Plug 'andymass/vim-matchup'
Plug 'jiangmiao/auto-pairs'
Plug 'codota/tabnine-vim'
Plug 'ycm-core/YouCompleteMe'

" javascript
Plug 'isruslan/vim-es6'

" slim
Plug 'slim-template/vim-slim'

" Prettier and COC
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
   \ 'coc-tsserver'
   \ ]
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-prettier'
Plug 'dense-analysis/ale'
let g:ale_linters = {
\   'javascript': ['eslint']
\}

" ruby/rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'thoughtbot/vim-rspec'

" search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-dadbod'
Plug 'easymotion/vim-easymotion'

Plug 'mileszs/ack.vim'

" colors
Plug 'morhetz/gruvbox'

" plugins end
call plug#end()

let mapleader = " "
let g:rspec_command = ':! bundle exec rspec {spec} --color'
" let g:rspec_command = ':! bundle exec rspec {spec} --format documentation'
" let g:rspec_command = '!clear && bundle exec rspec --color {spec}'

" key maps
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" map git
nnoremap <silent> <Leader>gs :G<CR>

" NERDTree
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
nmap <F7> :NERDTreeFind<CR>

let g:NERDTreeWinSize=90

" ALE
nmap <silent> <Leader>aj :ALENext<CR>
nmap <silent> <Leader>ak :ALEPrevious<CR>

" oldfiles
nmap bo :browse oldfiles<CR>

" search
nnoremap <silent> <Leader>f :Rg<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>

" colors
colorscheme gruvbox

autocmd BufWritePre * %s/\s\+$//e

" javascript config
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let &t_TI = ""
let &t_TE = ""

" autoformat
" let g:prettier#autoformat = 1
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#trailing_comma = 'all'

vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
vmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:tagbar_left=1
