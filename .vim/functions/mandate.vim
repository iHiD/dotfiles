"command -nargs=1 Mandate a"class <args>\n  include Mandate\n\n  def call\n  end\end"<ESC>
function! RunMandate(className)
    :normal i class^V<\r\r<CR><CR>include Mandate<CR><CR>initialize_with :<CR><CR>def call<CR>end<CR>end^V<ESC>
endfunction
command -nargs=1 Mandate :call RunMandate(<f-args>)<CR>

"noremap ,mandate 
noremap <Leader>s r<CR>O






