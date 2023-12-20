# FROM: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# These don't necessarily need to be set, but we'll set them anyways in order to use them in scripts
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Add local bin directory to PATH
export PATH="$HOME/.local/bin:$PATH"

# Source modules
source "$HOME/.config/zsh/options.zsh"
source "$HOME/.config/zsh/aliases.zsh"

source "$HOME/.config/zsh/prompt.zsh"
source "$HOME/.config/zsh/prompt_syntax.zsh"

source "$HOME/.config/zsh/history.zsh"
source "$HOME/.config/zsh/history_search.zsh"

source "$HOME/.config/zsh/completion.zsh"
source "$HOME/.config/zsh/completion_suggestions.zsh"

source "$HOME/.config/zsh/keybinds.zsh"

source "$HOME/.config/zsh/extras/man.zsh"
source "$HOME/.config/zsh/extras/ssh.zsh"
source "$HOME/.config/zsh/extras/bat.zsh"
source "$HOME/.config/zsh/extras/tree.zsh"
source "$HOME/.config/zsh/extras/zoxide.zsh"
source "$HOME/.config/zsh/extras/reflector.zsh"

# Disable Ctrl+S hanging
stty -ixon
