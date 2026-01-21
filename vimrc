vim9script

# Loading of the plugins should be prior to the potential callings. 
call plug#begin('~/vimfiles/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
# Plug 'lambdalisue/vim-nerdfont'
# Plug 'lambdalisue/vim-fern-renderer-nerdfont'
# Plug 'lambdalisue/vim-glyph-palette'
Plug 'lambdalisue/vim-fern'
Plug 'sheerun/vim-polyglot'
Plug 'yegappan/lsp'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-rooter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/vim-fern-git-status'
Plug 'jiangmiao/auto-pairs'
call plug#end()
