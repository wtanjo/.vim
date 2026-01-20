vim9script

# lightline & lightline-bufferline
set laststatus=2
set showtabline=2
set cmdheight=1
set noshowmode
if !has('gui_running')
  set t_Co=256
endif
g:lightline = {
  'colorscheme': 'catppuccin_macchiato',
  'active': {
    'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]
  },
  'tabline': {
    'left': [['buffers']],
    'right': [['close']]
  },
  'component_expand': {
    'buffers': 'lightline#bufferline#buffers'
  },
  'component_type': {
    'buffers': 'tabsel'
  },
  'component_function': {
    'gitbranch': 'FugitiveHead'
  }
}
g:lightline#bufferline#clickable = 1
g:lightline#bufferline#show_number = 0
nnoremap <leader>bq :bdelete<CR>
nnoremap <leader>bh :bprevious<CR>
nnoremap <leader>bl :bnext<CR>
nnoremap <leader>bj :ls<CR>:b<Space>
