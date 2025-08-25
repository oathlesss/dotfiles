if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Disable async git prompt to avoid _omz_register_handler errors
zstyle ':omz:alpha:lib:git' async-prompt no

# Add in zsh plugins
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Source .fzf.zsh so that the ctrl+r bindkey is given back fzf
zvm_after_init_commands+=('[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh')

# Syntax Hihghlighting
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]='fg=white'
ZSH_HIGHLIGHT_STYLES[alias]='fg=white'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=white'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=white'
ZSH_HIGHLIGHT_STYLES[default]='fg=white'

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias cd="z"
alias ..="cd .."
alias ...="cd ../.."

# Eza
alias l="eza -l --icons --git"
alias ls="eza --icons=always"
alias lt="eza --tree --level=2 --icons"
alias ltree="eza --tree --level=2 --long --icons"

# Nvim
alias n="nvim"
alias cnvim="NVIM_APPNAME=cnvim nvim"

# Exported Paths
export ZSH="$HOME/.config/zshrc"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/share/zinit/plugins/JanDeDobbeleer/oh-my-posh:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR="nvim"
export XDG_CONFIG_HOME=$HOME/.config
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/.config/scripts:$PATH"

bindkey -s '^F' 'tmux-sessionizer.sh\n'

# prompt
setopt prompt_subst
git_prompt_info() {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return

  # shorten if too long
  local maxlen=20
  if [[ ${#branch} -gt $maxlen ]]; then
    local half=$(( (maxlen - 3) / 2 ))
    branch="${branch[1,$half]}...${branch[-$half,-1]}"
  fi

  # check if repo has uncommitted changes
  if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
    echo "%F{red}$branch%f"   # red if uncommitted changes
    return
  fi

  # check sync status with remote
  local branch_status
  branch_status=$(git status --porcelain=2 --branch 2>/dev/null | grep '^# branch.ab')

  if [[ $branch_status == *ahead* || $branch_status == *behind* ]]; then
    echo "%F{red}$branch%f"   # red if out of sync with remote
  else
    echo "%F{green}$branch%f" # green if clean & up-to-date
  fi
}
short_pwd() {
  local path=$PWD
  local maxlen=20

  # replace $HOME with ~
	path="${path/#${HOME}/~}"

  if [[ ${#path} -gt $maxlen ]]; then
    local half=$(( (maxlen - 3) / 2 ))
    echo "${path[1,$half]}...${path[-$half,-1]}"
  else
    echo "$path"
  fi
}
PROMPT='%F{blue}oathless%f %F{#d4982a}$(short_pwd)%f %# '
RPROMPT='$(git_prompt_info)'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
source <(COMPLETE=zsh tms)
[ -s "/Users/rubenhesselink/.bun/_bun" ] && source "/Users/rubenhesselink/.bun/_bun"

# Auto start tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
