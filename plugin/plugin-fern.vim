vim9script

# g:fern#renderer = "nerdfont"
g:fern#default_hidden = 1
def InitFern()
  setlocal norelativenumber
  setlocal nonumber
  setlocal signcolumn=no

  nnoremap <buffer> <CR> <Plug>(fern-action-open-or-enter)
  # Minus symbol '-' is use as fern-action-mark, which is useful for batch renaming.
  nnoremap <buffer> q <Plug>(fern-action-leave)
  nnoremap <buffer> % <Plug>(fern-action-new-path)
  nnoremap <buffer> n <Plug>(fern-action-new-path)
  nnoremap <buffer> D <Plug>(fern-action-remove)
  nnoremap <buffer> R <Plug>(fern-action-rename)
  nnoremap <buffer> r <Plug>(fern-action-reload)
enddef

augroup FernCustom
  autocmd! *
  autocmd FileType fern InitFern()
augroup END

# augroup my-glyph-palette
#   autocmd! *
#   autocmd FileType fern glyph_palette#apply()
# augroup END
nnoremap <leader>e :Fern . -drawer -toggle -reveal=%<CR>
