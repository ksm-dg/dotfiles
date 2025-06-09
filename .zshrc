export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GOPATH="/Users/ksm/go"
export PATH="$GOPATH/bin:$PATH"

# basic history search forward and backward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Use fancier autocomplete
# Diasbled for now because I didn't like the "assume first possible selection" folder autocomplete
#source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# bindkey              '^I'         menu-complete
# bindkey "$terminfo[kcbt]" reverse-menu-complete

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

# control left and right to jump words
bindkey "^[[1;3D"   backward-word  
bindkey "^[[1;3C"   forward-word

export HOMEBREW_NO_AUTO_UPDATE=1
autoload -Uz compinit && compinit # needed to fix cryptic error about eval missing compdef
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/ksm/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
