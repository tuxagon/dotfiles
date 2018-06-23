# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# host information
if [[ $UID -eq 0 ]]; then
    local user_host='(%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%})'
    local user_symbol='#'
else
    local user_host='(%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%})'
    local user_symbol='$'
fi

# current directory
local current_dir='(%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%})'

# asdf versions
function asdf_current() {
  asdf current $1 | awk '{print $1}'
}

local asdf_ruby=' (%{$fg[red]%}ruby-$(asdf_current ruby)%{$reset_color%})'
local asdf_elixir=' (%{$fg[magenta]%}elixir-$(asdf_current elixir)%{$reset_color%})'
local asdf_nodejs=' (%{$fg[yellow]%}nodejs-$(asdf_current nodejs)%{$reset_color%})'

# git branch
local git_branch=' $(git_prompt_info)%{$reset_color%}'

# date and 12-hour time
local datetime='(%{$fg[cyan]%}%D{%m/%d %L:%M%p}%{$reset_color%})'

# zsh configuration
PROMPT="╭─${user_host}${asdf_ruby}${git_branch}${datetime}
╰─${current_dir} %B${user_symbol}%b "
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}%{$reset_color%}) "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
