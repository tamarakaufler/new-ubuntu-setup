#-------------------------
# Vim - Setting up for Go
#-------------------------

# ==> https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9
# ==> https://vimawesome.com/

# since vim 8 - native 3rd party package loading: https://shapeshed.com/vim-packages/

echo "******************" >> ~/.vimrc 
echo "\"*** default leader is \ ***" >> ~/.vimrc 
echo "******************" >> ~/.vimrc 
echo "" >> ~/.vimrc

echo "set guifont=Monospace\ 12" >> ~/.vimrc
echo "set noignorecase" >> ~/.vimrc 
echo "set nu" >> ~/.vimrc 
echo "syntax on" >> ~/.vimrc 
echo "filetype plugin on" >> ~/.vimrc 
#echo "filetype plugin indent on" >> ~/.vimrc 
echo "" >> ~/.vimrc

mkdir -p ~/.vim/pack/vendor/{start,opt}
vim_plugins_start=~/.vim/pack/vendor/start
vim_plugins_opt=~/.vim/pack/vendor/opt
git clone https://github.com/fatih/vim-go.git ${vim_plugins_start}/vim-go
#git clone https://github.com/scrooloose/nerdtree.git ${vim_plugins_start}/nerdtree
git clone https://github.com/preservim/nerdtree.git ${vim_plugins_start}/nerdtree

echo "\" Start NERDTree and put the cursor back in the other window." >> ~/.vimrc
echo "autocmd VimEnter * NERDTree | wincmd p" >> ~/.vimrc
echo "\" use <C-o> autocmds autocmd starthortcut to start NERDTree" >> ~/.vimrc
echo "map <C-o> :NERDTreeToggle<CR>" >> ~/.vimrc
# echo "nnoremap <leader>n :NERDTreeFocus<CR>" >> ~/.vimrc
# echo "nnoremap <C-n> :NERDTree<CR" >> ~/.vimrc
# echo "nnoremap <C-t> :NERDTreeToggle<CR" >> ~/.vimrc
# echo "nnoremap <C-f> :NERDTreeFind<CR" >> ~/.vimrc

echo "\" change default arrows" >> ~/.vimrc
echo "let g:NERDTreeDirArrowExpandable = '▸'" >> ~/.vimrc
echo "let g:NERDTreeDirArrowCollapsible = '▾'" >> ~/.vimrc
echo "" >> ~/.vimrc

git clone https://github.com/vim-airline/vim-airline.git ${vim_plugins_start}/vim-airline   # custom status bar
git clone https://github.com/vim-airline/vim-airline-themes.git ${vim_plugins_start}/vim-airline-themes
echo "\" vim-airport configuration" >> ~/.vimrc
echo "let g:airline#extensions#tabline#enabled = 1" >> ~/.vimrc
echo "let g:airline_powerline_fonts = 1" >> ~/.vimrc
echo "let g:airline_theme='hybrid'" >> ~/.vimrc
echo "let g:hybrid_custom_term_colors = 1" >> ~/.vimrc
echo "let g:hybrid_reduced_contrast = 1" >> ~/.vimrc

echo "let g:airline_theme='simple'" >> ~/.vimrc
echo "" >> ~/.vimrc


# https://github.com/amiorin/vim-project
# when in vim, the plugin can be loaded using :packadd vim-project
git clone https://github.com/amiorin/vim-project.git ${vim_plugins_opt}/vim-project
#echo "let g:project_use_nerdtree = 0" >>  ~/.vimrc
#echo "set rtp+=${vim_plugins_opt}/vim-project/"
#echo "call project#rc(\"~/go_projects/$repoowner\")" >> ~/.vimrc

git clone https://github.com/preservim/nerdcommenter.git ${vim_plugins_start}/nerdcommenter
cat ./vim_extras/NERDCommenter_snippet >> ~/.vimrc
echo "" >> ~/.vimrc

# install vim themes
git clone https://github.com/sjl/badwolf  ${vim_plugins_start}/badwolf
echo "colorscheme badwolf" >> ~/.vimrc
echo "" >> ~/.vimrc

