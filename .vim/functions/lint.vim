function! RunRuboCop()
  let l:filename = @%
  let l:cmd      = "bundle exec rubocop -a"
  let l:output   = system(l:cmd.' '.l:filename)
  edit
endfunction
command RuboCop :call RunRuboCop()

function! RunTerraformFmt()
  let l:filename = @%
  let l:cmd      = "terraform fmt"
  let l:output   = system(l:cmd.' '.l:filename)
  edit
endfunction
command TerraformFmt :call RunTerraformFmt()

function! RunLint()
  let ext=expand('%:e')
  if ext=="rb"
    :RuboCop
  elseif ext=="tf"
    :TerraformFmt
  else
    :Prettier
  endif
endfunction

command Lint :call RunLint()
