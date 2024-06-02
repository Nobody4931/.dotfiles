# Initialize starship.rs prompt
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

eval "$(starship init zsh)"

# Use emacs keybinds
bindkey -e

# Make navigation keybinds behave more like emacs
WORDCHARS=""
