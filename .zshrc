# shell
PROMPT='%F{#9ccfd8}%~%f${vcs_info_msg_0_} %F{#eb6f92}$%f '

fpath=(/usr/share/zsh/site-functions /usr/share/zsh/*/functions $fpath)
autoload -Uz compinit vcs_info
compinit

# autocomplete
if command -v kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi
if command -v helm &>/dev/null; then
  source <(helm completion zsh)
fi
if command -v argo &>/dev/null; then
  source <(argo completion zsh)
fi

# git
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{#f6c177}(%b)%f'
setopt PROMPT_SUBST

# general
source <(fzf --zsh)

export LANG=en_US.UTF-8
export VISUAL="nvim"
export DOCKER_COMMAND=podman

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR="$VISUAL"
fi
HISTFILE=$HOME/.zsh_history
HISTFILESIZE=100000
HISTSIZE=100000
SAVEHIST=500000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
FZF_IGNORE="\( -name .git -o -name .gitlab -prune \)"
export FZF_DEFAULT_COMMAND="find . $FZF_IGNORE -o -not -path '*/.*' -print"
export FZF_DEFAULT_CTRL_E_COMMAND="find . $FZF_IGNORE -o -type d -not -path '*/.*' -print"
fzf_cd() {
  local dir
  dir=$(eval "$FZF_DEFAULT_CTRL_E_COMMAND" | fzf) || return 1
  cd "$dir" || return 1
  zle reset-prompt
}
zle -N fzf_cd_widget fzf_cd
bindkey '^E' fzf_cd_widget
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey -M vicmd v edit-command-line
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# aliases
alias l="ls -lah --color -h --group-directories-first"
alias v="nvim"
alias lg="lazygit"
alias update="$HOME/scripts/update.sh"
alias k="kubectl"
alias docker="podman"

# exports
export BROWSER="open"
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/.opencode/bin:$PATH
