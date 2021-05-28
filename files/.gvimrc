# Make macvim fit the screen size when it opens
set lines=1000 columns=1000

set macligatures
set guifont=FiraCode-Retina:h14

if has("gui_macvim")
  " Remove existing icons from touch bar
  aunmenu TouchBar.
endif

:an TouchBar.Lint :Lint<CR>
