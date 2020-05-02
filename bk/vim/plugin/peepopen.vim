if &cp || exists("g:peepopen_loaded") && g:peepopen_loaded
	  finish
  endif
  let g:peepopen_loaded = 1

  let s:save_cpo = &cpo
  set cpo&vim

  function s:LaunchPeepOpenViaVim()
	    let cwd = getcwd()
	      silent exe "!open \"peepopen://" . shellescape(cwd) . "?editor=MacVim\""
      endfunction

      command! PeepOpen :call <SID>LaunchPeepOpenViaVim()

      noremap <unique> <script> <Plug>PeepOpen <SID>Launch
      noremap <SID>Launch :call <SID>LaunchPeepOpenViaVim()<CR>

      if !hasmapto('<Plug>PeepOpen')
	        map <unique> <silent> <Leader>p <Plug>PeepOpen
	endif

	let &cpo = s:save_cpo
	unlet s:save_cpo
