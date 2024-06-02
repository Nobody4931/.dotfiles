# Setting these variables aren't required, but we'll do it anyways in order to use them in scripts

# FROM: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# - XDG_CONFIG_HOME: Stores user-specific configuration files
# - XDG_CACHE_HOME: Stores user-specific non-essential data files
# - XDG_DATA_HOME: Stores user-specific	data files
# - XDG_STATE_HOME: Stores user-specific persistent state files

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Add local bin directory to PATH
export PATH="$HOME/.local/bin:$PATH"

# Enable truecolor for terminals that support it
export COLORTERM=truecolor

# Bootstrap zinit plugin manager
ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"

# Source modules
source "$HOME/.config/zsh/aliases.zsh"

source "$HOME/.config/zsh/history.zsh"

source "$HOME/.config/zsh/completion.zsh"

source "$HOME/.config/zsh/prompt.zsh"

# TODO: Add git module (shortcut aliases)
source "$HOME/.config/zsh/extras/vim.zsh"
source "$HOME/.config/zsh/extras/eza.zsh"
source "$HOME/.config/zsh/extras/man.zsh"
source "$HOME/.config/zsh/extras/ssh.zsh"
source "$HOME/.config/zsh/extras/zoxide.zsh"
source "$HOME/.config/zsh/extras/reflector.zsh"

# Disable Ctrl+S hanging
stty -ixon
