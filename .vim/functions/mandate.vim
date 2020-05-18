"command -nargs=1 Mandate a"class <args>\n  include Mandate\n\n  def call\n  end\end"<ESC>
"
function! RunMandate(className)
    :normal iclass
    exec "%s/class/class " . a:className
    :normal oinclude Mandate
    :normal o
    :normal oinitialize_with
    :normal o
    :normal odef call
    :normal oend
    :normal oend
    :normal 5G
endfunction
command -nargs=1 Mandate :call RunMandate(<f-args>)<CR>

"noremap ,mandate aclass <args>\r  include Mandate\n\n  def call\n  end\end<ESC>
noremap <Leader>s r<CR>O






