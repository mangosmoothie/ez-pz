# oh-my-zsh based off of Bureau Theme


_PATH="%{$fg_bold[white]%}%~%{$reset_color%}"

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n"
  _LIBERTY="%{$fg[red]%}#"
else
  _USERNAME="%{$fg_bold[white]%}%n"
  _LIBERTY="%{$fg_bold[green]%}λ"
fi
_USERNAME="$_USERNAME%{$reset_color%}@%m"
_LIBERTY="$_LIBERTY%{$reset_color%}"

_1LEFT="$_PATH"

bureau_precmd () {
  _LAST_STATUS=$?
  
  if [[ _LAST_STATUS -eq 0 ]]; then
    _STATUS_COLOR=""
  else
    _STATUS_COLOR=" $fg_bold[red]exit $_LAST_STATUS$reset_color"
  fi

  print -rP "$_1LEFT $_STATUS_COLOR"
}

setopt prompt_subst
PROMPT='$_LIBERTY > '

autoload -U add-zsh-hook
add-zsh-hook precmd bureau_precmd
