#####################################################################################
# FROM: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
#
# The user doesn't necessarily have to set any of these variables, since most
# programs will use their respective default values if they are unset, but we will
# explicitly set them in order to use them in other scripts across the system
#####################################################################################

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Create a cache directory for zsh
ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

mkdir -p "$ZSH_CACHE_DIR"

# Source modules
source "$HOME/.config/zsh/options.zsh"
source "$HOME/.config/zsh/aliases.zsh"

source "$HOME/.config/zsh/prompt.zsh"
source "$HOME/.config/zsh/prompt_syntax.zsh"

source "$HOME/.config/zsh/history.zsh"
source "$HOME/.config/zsh/history_search.zsh"

source "$HOME/.config/zsh/completion.zsh"
source "$HOME/.config/zsh/completion_suggestions.zsh"

source "$HOME/.config/zsh/extras/man.zsh"
source "$HOME/.config/zsh/extras/ssh.zsh"
source "$HOME/.config/zsh/extras/bat.zsh"
source "$HOME/.config/zsh/extras/tree.zsh"
source "$HOME/.config/zsh/extras/zoxide.zsh"
source "$HOME/.config/zsh/extras/reflector.zsh"

# Disable Ctrl+S hanging
stty -ixon
