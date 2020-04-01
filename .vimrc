" This files is a per project vim configuration, to make it work you need to
" add the following at the end of your .vimrc in your $HOME :
"   set exrc
"   set secure
"
" I AM SORRY TO SAY THAT YouCompleteMe only works with Mac Vim.
"
" i love vim-plug for vim plugings
call plug#begin()
	" please install YouCompleteMe using the following instructions:
	"   https://github.com/ycm-core/YouCompleteMe#installation
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'preservim/nerdtree'

	" fzf is required yet simple to install just:
	"   brew install fzf
	" you would need to install bat to format your code when searching:
	"   brew install bat 
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'preservim/nerdcommenter'

	Plug 'majutsushi/tagbar'
call plug#end()

let mapleader=","
" this is for loading NERDTree always when you open vim
autocmd vimenter * NERDTree
" this is for toggling NEERTree with "ctrl + n"
map <C-n> :NERDTreeToggle<CR> 
" This will locate the current buffer in NERDTree
map <leader>r :NERDTreeFind<CR>

filetype plugin on
set hidden

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
" key binding to search for a file with "ctrl + p"
nnoremap <silent> <C-p> :Files<CR>
" nnoremap <silent> <C-d> :Tags<CR>
" nnoremap <leader>d :call fzf#vim#tags(expand('<cword>'), {'options': ['--exact', '--select-1', '--exit-0', '--preview  ''' . preview_file . ' {}''']})<CR>
nnoremap <silent> <leader>p :GitGutterLineHighlightsToggle<CR>
let preview_file = '/Users/jose.montana/b1/b1-voice-public-contracts/absolut_path_preview.sh'
"command! -bang -nargs=* Tags
nnoremap <leader>d :call fzf#vim#tags(expand('<cword>'), {
  \      'options': '
	\					--exact
	\					--select-1
	\					--exit-0
  \         --with-nth 1,2
  \         --prompt "=> "
  \         --preview-window="50%"
  \         --preview ''' . preview_file . ' {}'''
  \ })<CR>

" clang-format integration, you need to install:
"   https://github.com/rhysd/vim-clang-format
nnoremap <silent> <leader>kf :ClangFormat<CR>
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
set tags=tags
set updatetime=100
