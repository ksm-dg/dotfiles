# Need these to fix tmux interacting poorly with autocomplete/omp

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GOPATH="/Users/ksm/go"
export PATH="$GOPATH/bin:$PATH"
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

# control left and right to jump words
bindkey "^[[1;3D"   backward-word  
bindkey "^[[1;3C"   forward-word

export HOMEBREW_NO_AUTO_UPDATE=1
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
