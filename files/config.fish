set -U fish_color_normal normal
set -U fish_color_command 00ff00
set -U fish_color_quote ffd700
set -U fish_color_redirection 00afff
set -U fish_color_end 009900
set -U fish_color_error ff8787
set -U fish_color_param 00afff
set -U fish_color_comment 00af00
set -U fish_color_match normal
set -U fish_color_selection c0c0c0
set -U fish_color_search_match ffff00
set -U fish_color_history_current normal
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd 008000
set -U fish_color_cwd_root 800000
set -U fish_color_valid_path normal
set -U fish_color_autosuggestion 555
set -U fish_color_user 00ff00
set -U fish_color_host normal
set -U fish_color_cancel normal
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan

set -gx EDITOR vim

source /opt/homebrew/share/fish/vendor_functions.d/chruby.fish
# source /opt/homebrew/share/fish/vendor_funcions.d/auto.fish

# This command allows cruby to run inside vim's shell 
# with the correct env set up
chruby_auto 

alias brewup='cd ~; brew update; brew upgrade; brew bundle; brew cleanup; brew doctor'
alias ls="ls -lasG"

#alias bert="bundle exec rake test"
alias rdm="rake db:migrate"

alias ga.="git add ."
alias gs="git status"
alias gcp="git cherry-pick"
alias gpoh="git push origin head"

alias cde="cd ~/Code/exercism/website"
