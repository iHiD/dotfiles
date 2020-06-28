function! RunRuboCop()
  let l:filename       = @%
  let l:rubocop_cmd    = "bundle exec rubocop -a"
  let l:rubocop_output  = system(l:rubocop_cmd.' '.l:filename)
  edit
endfunction
command RuboCop :call RunRuboCop()

function! RunLint()
  let ext=expand('%:e')
  if ext=="rb"
    :RuboCop
  else
    :Prettier
  endif
endfunction

command Lint :call RunLint()
