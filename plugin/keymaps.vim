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
# Let's keep some original signals:
# <C-h> == <BS>
# <C-j> == <CR>
# Historically, <C-k> == Vertical Tab(~= <UP>).
# In Vim, <C-k> triggers diagraphs(二合字: <C-k>[char][char] --> specail char).
# Historically, <C-l> == Form Feed(~= <Right>).
# In Vim, <C-l> redraws the screen.
# But let's add something to it.
nnoremap <C-l> :nohlsearch<CR><C-l>
inoremap <C-u> <C-g>u<C-u>
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
nnoremap <A-k> :m -2<CR>==
nnoremap <A-down> :m +1<CR>==
nnoremap <A-j> :m +1<CR>==
nnoremap <A-z> :set wrap!<CR>

nnoremap <leader>sv :sp<CR>
nnoremap <leader>sh :vsp<CR>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-k>k
nnoremap <leader>wl <C-w>l

nnoremap <leader>t :tab terminal<CR>

# Netrw can be used to check the detailed infomations about the files.
nnoremap <leader>n :Ex<CR>
