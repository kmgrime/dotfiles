export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

set -o vi

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 1

DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd-mm-yyyy"

plugins=(
  git
  kubectl
	helm
	zsh-autocomplete
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Enable fuzzy directory and file search.
source <(fzf --zsh);

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# History file settings
HISTFILE=$HOME/.zsh_history
HISTFILESIZE=1000000
HISTSIZE=1000000
SAVEHIST=500000
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Enable fuzzy directory and file search
source <(fzf --zsh);
# Ignore certain directories globally.
export FZF_IGNORE="\( -name .git -o -name .gitlab -prune \)"
export FZF_DEFAULT_COMMAND="find . $FZF_IGNORE -o -not -path '*/.*' -print"
export FZF_DEFAULT_CTRL_E_COMMAND="find . $FZF_IGNORE -o -type d -not -path '*/.*' -print"
# Use Ctrl-E for fuzzy cd.
fzf_cd() {
 local dir
 dir=$(eval "$FZF_DEFAULT_CTRL_E_COMMAND" | fzf) || return 1
 cd "$dir" || return 1
zle reset-prompt  # Redraw prompt after changing directory
}
zle -N fzf_cd_widget fzf_cd
bindkey '^E' fzf_cd_widget

# Drop into vi with the current commandline
bindkey "^X^E" edit-command-line
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Enable autocomplete that is case insensitive
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# Defaults
export VISUAL="/usr/bin/nvim"
export EDITOR="$VISUAL"
export DOCKER_COMMAND=podman

# Aliases
alias l="ls -lah --color -h --group-directories-first"
alias wttr="curl wttr.in"
alias v="nvim"
alias lg="lazygit"
alias k="kubectl"
alias docker="podman"

## Default app browser
export BROWSER="open"

## Path exports
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:$HOME/.local/bin

# Argo Workflows CLI autocompletion
if command -v argo &>/dev/null; then
  source <(argo completion zsh)
fi
