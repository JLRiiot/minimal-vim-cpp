call plug#begin()
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'preservim/nerdtree'
call plug#end()

autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR> 

set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=100
set nu

au BufNewFile,BufRead CMakeList.txt set filetype=cmake
