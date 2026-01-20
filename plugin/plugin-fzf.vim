vim9script

nnoremap <leader>f :FZF<CR>
autocmd FileType fzf tnoremap <buffer> <Esc> <C-c>
autocmd FileType fzf tnoremap <buffer> <C-[> <C-c>
