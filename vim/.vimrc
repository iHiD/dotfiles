" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

" Run Pathogen
execute pathogen#infect()

syntax on                         " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

compiler ruby

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set history=500

" Relative line numbers FTW.
setglobal relativenumber
autocmd BufEnter * set relativenumber

set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set gdefault                      " Always assume /g in substituions

set nowrap                        " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Get rid of the delay when hitting esc!
set noesckeys
set ttimeout
set ttimeoutlen=1

" Or use vividchalk
colorscheme railscasts

set list listchars=tab:\ \ ,trail:·
highlight ExtraWhitespace ctermbg=196 guibg=#FF1100 ctermfg=white guifg=white
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
:nnoremap W :%s/ *$//g<cr><c-o><cr>:nohlsearch<cr>

" Tab mappings.
"map <leader>tt :tabnew<cr>
"map <leader>te :tabedit
"map <leader>tc :tabclose<cr>
"map <leader>to :tabonly<cr>
"map <leader>tn :tabnext<cr>
"map <leader>tp :tabprevious<cr>
"map <leader>tf :tabfirst<cr>
"map <leader>tl :tablast<cr>
"map <leader>tm :tabmove

let mapleader = ","

" Save file on lost focus
au FocusLost * :wa
au! BufWritePost ~/.vimrc source %

" Filetypes
au BufNewFile,BufRead *.ahaml syntax on
au BufNewFile,BufRead *.ahaml set filetype=haml

" Underline current line
nnoremap <leader>1 yypVr=
map <Leader>tt :wa<cr>:call RunCurrentRspecTest()<CR>
map <Leader>tf :wa<cr>:call RunCurrentTest()<CR>
map <Leader>tl :wa<cr>:call RunCurrentLineInTest()<CR>
map <Leader>ta :wa<cr>:call RunAssociatedTests()<CR>
map <Leader>te :wa<cr>:call RunAllTests()<CR>
map <Leader>rr :wa<cr>:call RunRake()<CR>
map <Leader>tz :call ToggleZeus()<CR>

" Reformat File
map <Leader>2 mzgg=G`z<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bjo_use_zeus = 1
function! ToggleZeus()
  if g:bjo_use_zeus
    let g:bjo_use_zeus = 0
  else
    let g:bjo_use_zeus = 1
  end
endfunction

function! RunAllTests()
  exec "!rspec spec"
  "exec \"!rspec spec spec/classes spec/models\"
endfunction

function! RunCurrentTest()
  call SetTestFile()

  let rspec_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if rspec_file
    call RunCurrentRspecTest()
  else
    exec "!bundle exec ruby " . g:bjo_test_file
  end
endfunction

function! RunCurrentRspecTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '/features/') != -1
      call SetTestRunner("rspec --no-color ", 0)
    else
      call SetTestRunner("rspec --no-color ", 1)
    end
  endif

  let l:cmd_start = (g:bjo_test_runner_use_zeus && g:bjo_use_zeus) ? "!zeus " : "!"
  exec l:cmd_start . " " . g:bjo_test_runner . " " . g:bjo_test_file
endfunction

function! SetTestRunner(runner, use_zeus)
  let g:bjo_test_runner=a:runner
  let g:bjo_test_runner_use_zeus=a:use_zeus
endfunction

function! RunAssociatedTests()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  endif

  exec "!ruby ./bin/run_associated_tests.rb " g:bjo_test_file
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()

    if match(expand('%'), '/features/') != -1
      call SetTestRunner("rspec --no-color ", 0)
    else
      call SetTestRunner("rspec --no-color ", 1)
    end
  end

  let l:cmd_start = (g:bjo_test_runner_use_zeus && g:bjo_use_zeus) ? "!zeus " : "!"
  exec l:cmd_start . " " . g:bjo_test_runner . " " . g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

function! RunRake()
  let l:cmd_start = (g:bjo_test_runner_use_zeus && g:bjo_use_zeus) ? "!zeus " : "!"
  exec l:cmd_start . " rake"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DELETE CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

