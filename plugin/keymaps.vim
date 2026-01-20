vim9script

g:mapleader = "\<space>"
nnoremap <leader>c :
# Builtin: <C-o> & <C-i> are undo and redo in terms of "large-scaled" cursor jumping(in the jump list).
# <C-o> for un-jump, and <C-i> for re-jump
# Builtin: <C-[> == <ESC>
# CAUTION: <C-c> is INTERUPTION signal, and has some undesired side effect.
# e.g. The LSP diagnoses won't be rendered with <C-c> to exit insert mode.
# t: Terminal mode
tnoremap <ESC> <C-\><C-n>
tnoremap <C-[> <C-\><C-n>
# Vim will wait with the Alt prefix, but not with the Ctrl prefix.
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
nnoremap + $
nnoremap - ^
xnoremap + $
xnoremap - ^
# m + [letter]: Mark for jumping
# [letter]: marks inside one file
# [LETTER]: cross-file marks
# '[letter]: call(jump to) the line of the mark
# `[letter]: call(jump to) the position(line and column) of the mark
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

nnoremap <leader>t :tab terminal<CR>

# Netrw can be used to check the detailed infomations about the files.
nnoremap <leader>n :Ex<CR>
