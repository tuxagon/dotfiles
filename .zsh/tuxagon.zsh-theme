# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"


if [[ $UID -eq 0 ]]; then
    local user_host='(%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%})'
    local user_symbol='#'
else
    local user_host='(%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%})'
    local user_symbol='$'
fi

local current_dir='(%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%})'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='(%{$fg[red]%}ruby-$(rvm-prompt i v g)%{$reset_color%})'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='(%{$fg[red]%}ruby-$(rbenv version | sed -e "s/ (set.*$//")%{$reset_color%})'
  fi
fi
local git_branch=' $(git_prompt_info)%{$reset_color%}'
local datetime='(%{$fg[magenta]%}%D{%m/%d %L:%M%p}%{$reset_color%})'

PROMPT="╭─${user_host} ${rvm_ruby}${git_branch}${datetime}
╰─${current_dir} %B${user_symbol}%b "
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}%{$reset_color%}) "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
