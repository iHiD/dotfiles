" Load all the packs
packloadall

"""
" Prettier
"""
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Add PrettierAsync for all buffers
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html noautocmd | call prettier#Autoformat()
autocmd FocusLost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html noautocmd | call prettier#Autoformat()

"autocmd FocusLost *.rb noautocmd | call RuboCop()


"""
" Colorscheme (dracula)
"""
colorscheme dracula

"""
" CTRL-P
"""

" Ignore files in gitignore for CTRLP 
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Always clear the cache when pressing CTRL-P to avoid missing new files
nnoremap <c-p> :CtrlPClearCache<bar>CtrlP<cr>

"""
" Matchit
"""
" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim


"""
" Ackvim
"""

" Use `ag` command for the silver surfer
let g:ackprg = 'ag --nogroup --nocolor --column'                                               

" Remap CTRL-F
noremap <C-F> :Ack! 


"""
" Coc
"""
let g:coc_global_extensions = ['coc-solargraph']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
      
