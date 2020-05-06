function! DeleteFile()
    let filename = expand('%')
    let confirm = input('Deleting ' . filename . '. Type delete to confirm: ')
    if confirm == 'delete'
        exec ':BD'
        exec ':silent !rm ' . filename
        redraw!
    endif
endfunction
map <Leader>d :call DeleteFile()<cr>
