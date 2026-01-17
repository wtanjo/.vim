vim9script

set nocompatible
set encoding=utf-8
set belloff=all
set number
set relativenumber
set signcolumn=yes

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set cursorline
set whichwrap+=h,l,<,>,[,]
set showmatch
set hlsearch
set incsearch

set splitbelow
set splitright

set mouse=a
set clipboard+=unnamed,unnamedplus

set smoothscroll
set nowrap
set sidescroll=1
set scrolloff=3
set sidescrolloff=5
nnoremap <ScrollWheelUp> <C-y>
nnoremap <ScrollWheelDown> <C-e>
inoremap <ScrollWheelUp> <C-o><C-y>
inoremap <ScrollWheelDown> <C-o><C-e>

set termguicolors

syntax on

if has('gui_running')
  set guioptions-=e            
  set guioptions-=m           # No Menu Bar
  set guioptions-=T           # No Tool Bar
  set guioptions-=r           # No (Right) Scroll Bar
  set guioptions-=L           # No (Left) Scroll Bar
  set guifont=Maple_Mono_NL_NF_CN:h15.2           # gVim网格渲染导致窗口行列数必须是整数，最下面剩下的高度不能放内容。小数点用来凑整。
  if has('directx')
    set renderoptions=type:directx,renmode:5,taamode:1,geom:1,level:0.5,gamma:1.5,contrast:0.5
  endif
endif
autocmd GUIEnter * simalt ~x

set wildmenu
set wildoptions=pum
set pumheight=15
