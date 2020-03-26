" I AM SORRY TO SAY THAT YouCompleteMe only works with Mac Vim.
"
" i love vim-plug for vim plugings
call plug#begin()
	" please install YouCompleteMe using the following instructions:
	"   https://github.com/ycm-core/YouCompleteMe#installation
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'preservim/nerdtree'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
call plug#end()

" this is for loading NERDTree always when you open vim
autocmd vimenter * NERDTree
" this is for toggling NEERTree with "ctrl + n"
map <C-n> :NERDTreeToggle<CR> 
nnoremap <silent> <C-p> :Files<CR>

" those are some prefered configs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=100
set nu

" what this is adding a better syntax highlighting for CMakeLists.txt file
au BufNewFile,BufRead CMakeList.txt set filetype=cmake

" to get atom-dark color scheme you need to get and copy atom-dark.vim from:
"   https://github.com/gosukiwi/vim-atom-dark
colo atom-dark
" to get fonts working you need to install prowerline fonts from:
"   https://github.com/powerline/fonts
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
