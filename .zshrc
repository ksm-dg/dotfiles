# handle secrets, like HA MCP URL
if [ -f ~/.env ]; then
    source ~/.env
fi

source ~/.env
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GOPATH="/Users/ksm/go"
export PATH="$GOPATH/bin:$PATH"

# basic history search forward and backward
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Use fancier autocomplete
# Diasbled for now because I didn't like the "assume first possible selection" folder autocomplete
#source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# bindkey              '^I'         menu-complete
# bindkey "$terminfo[kcbt]" reverse-menu-complete

# Native zsh prompt: no theme framework or external prompt dependency.
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' %F{yellow}git:%b%f'

_prompt_precmd() {
  vcs_info
}
precmd_functions+=(_prompt_precmd)

_prompt_venv() {
  # A valid venv contains pyvenv.cfg. This also ignores a stale VIRTUAL_ENV.
  [[ -n ${VIRTUAL_ENV:-} && -f "$VIRTUAL_ENV/pyvenv.cfg" ]] || return
  print -n -- " %F{magenta}(${VIRTUAL_ENV:t})%f"
}

setopt prompt_subst
PROMPT='%F{cyan}%~%f$(_prompt_venv)${vcs_info_msg_0_}
%F{green}❯%f '

alias ls="/opt/homebrew/opt/coreutils/libexec/gnubin/ls --color --group-directories-first"
alias ll="ls --group-directories-first -GFlash"
alias l.="ls -ld .?*"
alias cp="/opt/homebrew/opt/coreutils/libexec/gnubin/cp"
alias ggraph='git log --graph --pretty="%C(Yellow)%h  %C(reset)%ad (%C(Green)%cr%C(reset))%x09 %C(Cyan)%an: %C(reset)%s %C(auto)%d" --date=short'
alias grepr="grep -rn --color=always --exlude-dir=.git"

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
