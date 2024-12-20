source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  #eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/catppuccin.omp.json)"
  eval "$(oh-my-posh init zsh --config ~/.ksm_theme.omp.json)"
fi

alias ls="/opt/homebrew/opt/coreutils/libexec/gnubin/ls --color --group-directories-first"
alias ll="ls --group-directories-first -GFlash"
alias l.="ls -ld .?*"
alias cp="/opt/homebrew/opt/coreutils/libexec/gnubin/cp"
alias ggraph='git log --graph --pretty="%C(Yellow)%h  %C(reset)%ad (%C(Green)%cr%C(reset))%x09 %C(Cyan)%an: %C(reset)%s %C(auto)%d" --date=short'

bindkey "\e[H"    beginning-of-line
bindkey "\e[F"    end-of-line

## control left and right to jump words
bindkey "^[[1;3D"   backward-word  
bindkey "^[[1;3C"   forward-word

#autoload -U up-line-or-beginning-search
#autoload -U down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#bindkey "^[[A" up-line-or-beginning-search # Up
#bindkey "^[[B" down-line-or-beginning-search # Down
#bindkey "^[[5~" up-line-or-beginning-search # Up
#bindkey "^[[6~" down-line-or-beginning-search # Down

# page up:  ^[[5~
# page down:  ^[[6~

export HOMEBREW_NO_AUTO_UPDATE=1
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
