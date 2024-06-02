# Initialize starship.rs prompt
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

eval "$(starship init zsh)"

# Make prompt navigation behave like emacs
bindkey -e # use emacs keybinds
WORDCHARS="" # group words by alphanumeric chars

# Enable prompt syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Enable prompt completion suggestions
zinit light zsh-users/zsh-autosuggestions

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=("completion")

#ZSH_AUTOSUGGEST_CLEAR_WIDGETS=()
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=()
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(forward-char forward-word)
ZSH_AUTOSUGGEST_EXECUTE_WIDGETS=()
ZSH_AUTOSUGGEST_IGNORE_WIDGETS=()

bindkey '^s' autosuggest-accept
