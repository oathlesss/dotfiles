set fish_greeting

source ~/.config/fish/conf.d/paths.fish
source ~/.config/fish/functions/aliases.fish
source ~/.config/fish/functions/keybinds.fish

if status is-interactive
    # export ZELLIJ_CONFIG_DIR=$HOME/.config/zellij
    #
    # if [ "$TERM" = "xterm-ghostty" ]
    #   eval (zellij setup --generate-auto-start fish | string collect)
    # end
    if type -q tmux; and test -z "$TMUX"
        tmux attach-session -t default; or tmux new-session -s default
    end
end

if status is-login
    contains ~/.local/bin $PATH
    or set -gxa PATH ~/.local/bin
end

zoxide init fish | source

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

starship init fish | source
