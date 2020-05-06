" Load all the packs
packloadall

"""
" Prettier
"""
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Add PrettierAsync for all buffers
autocmd BufWritePre *.rb,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html noautocmd | call prettier#Autoformat()
autocmd FocusLost *.rb,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html noautocmd | call prettier#Autoformat()


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

