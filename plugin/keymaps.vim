vim9script

g:mapleader = "\<space>"
nnoremap <leader>c :
# Builtin: <C-o> & <C-i> are undo and redo in terms of "large-scaled" cursor jumping.
# <C-o> for un-jump, and <C-i> for re-jump
# Builtin: <C-[> == <ESC>
# CAUTION: <C-c> is INTERUPTION signal, and has some undesired side effect.
# e.g. The LSP diagnoses won't be rendered with <C-c> to exit insert mode.
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>
nnoremap + $
nnoremap - ^
xnoremap + $
xnoremap - ^
nnoremap mm %
xnoremap mm %
nnoremap <A-up> :m -2<CR>==
nnoremap <A-down> :m +1<CR>==
nnoremap <A-z> :set wrap!<CR>

import '../import/functions.vim' as fn
inoremap <expr> ( fn.SmartPair('(')
inoremap <expr> [ fn.SmartPair('[')
inoremap <expr> { fn.SmartPair('{')
inoremap <expr> " fn.SmartPair('"')
inoremap <expr> ' fn.SmartPair("'")
inoremap <expr> ) fn.SmartPair(')')
inoremap <expr> ] fn.SmartPair(']')
inoremap <expr> } fn.SmartPair('}')
inoremap <expr> <BS> fn.SmartBackspace()

nnoremap <leader>sv :sp<CR>
nnoremap <leader>sh :vsp<CR>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-k>k
nnoremap <leader>wl <C-w>l

nnoremap <leader>t :terminal<CR>

# Netrw can be used to check the detailed infomations about the files.
nnoremap <leader>n :Ex<CR>
