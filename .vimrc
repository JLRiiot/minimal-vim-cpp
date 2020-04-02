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
	Plug 'airblade/vim-gitgutter'
	Plug 'jreybert/vimagit'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	" Install clang-format using brew "brew install clang-format"
	Plug 'rhysd/vim-clang-format'
call plug#end()

" This is the most important variable to set
let $PROJECT_PATH = $HOME . '/Developer/minimal-vim-cpp'
let $MYVIMRC = $PROJECT_PATH . '/.vimrc'
set splitright

let mapleader=","

" Edit my .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" Source my .vimrc file (this reloads the configuration)
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
" Close and save the current buffer
nnoremap <leader>wq :wq<CR>
" Save the curren buffer
nnoremap <leader>w :w<CR>
" Try to quit the current buffer
nnoremap <leader>q :q<CR>

" YouCompleteMe Configuration -------------------------------------------------
" ['same-buffer', 'horizontal-split', 'vertical-split', 'new-tab', 'new-or-existing-tab']
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1

" this is for loading NERDTree always when you open vim
autocmd vimenter * NERDTree
" this is for toggling NEERTree with "ctrl + n"
map <C-n> :NERDTreeToggle<CR> 
" This will locate the current buffer in NERDTree
map <leader>r :NERDTreeFind<CR>
" Show and hide tagbar
map <leader>f :TagbarToggle<CR>

filetype plugin on

" Git Gutter configuration ------------------------------------------
" This blog helped me alot on configuring git https://jakobgm.com/posts/vim/git-integration/
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1

nnoremap <silent> <leader>p :GitGutterLineHighlightsToggle<CR>
nmap <leader>gn :GitGutterNextHunk<CR>
nmap <leader>gp :GitGutterPrevHunk<CR>
nmap <leader>ga :GitGutterStageHunk<CR>
nmap <leader>gu :GitGutterUndoHunk<CR>

" vimagit configuration ---------------------------------------------
nnoremap <leader>gs :Magit<CR>

" Fugitive configuration --------------------------------------------
nnoremap <leader>gb :Gblame<CR>
" Open current line in the browser
nnoremap <leader>gbl :.Gbrowse<CR>
" Open visual selection in the browser
vnoremap <leader>gbs :Gbrowse<CR>

" FZF Configuration -------------------------------------------------
" 
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags_with_dep.sh'
command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
" key binding to search for a file with "ctrl + p"
nnoremap <silent> <C-p> :Files<CR>
let preview_file = $PROJECT_PATH . '/absolut_path_preview.sh'
nnoremap <leader>d :call fzf#vim#tags(expand('<cword>'), { 'options': '
\	--exact 
\	--select-1 
\	--exit-0 
\ --with-nth 1,2
\ --prompt "=> "
\	--preview ''' . preview_file . ' {} ''' 
\})<CR>
" install gsed with homebrew: "brew install gnu-sed"
"nnoremap <leader>d :call fzf#vim#tags(expand('<cword>'), {
"\      'options': '
"\					--exact
"\					--select-1
"\					--exit-0
"\         --with-nth 1,2
"\         --prompt "=> "
"\         --preview-window="50%"
"\         --preview ''' . preview_file . ' {}'''
"\ })<CR>

" clang-format Configuration ----------------------------------------
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" those are some prefered configs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=100
set nu
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

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

" Edit my .vimrc file"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source my .vimrc file (This reloads the configuration)
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
