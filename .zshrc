export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  #eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/catppuccin.omp.json)"
  eval "$(oh-my-posh init zsh --config ~/.ksm_theme.omp.json)"
fi

alias ls="/opt/homebrew/opt/coreutils/libexec/gnubin/ls --color --group-directories-first"
alias ll="ls --group-directories-first -GFlash"
alias cp="/opt/homebrew/opt/coreutils/libexec/gnubin/cp"

bindkey "\e[H"    beginning-of-line
bindkey "\e[F"    end-of-line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
