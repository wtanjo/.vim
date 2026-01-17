vim9script

colorscheme catppuccin_macchiato
highlight Comment guifg=#f4dbd6 gui=italic
highlight link vimCommentString Comment

import '../import/functions.vim' as fn
fn.PopMenuHighlight()