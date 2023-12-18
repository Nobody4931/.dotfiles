# Source autosuggestions plugin if it exists
if [[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
	source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
elif [[ -f "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
	source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
else
	return 0
fi

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=("history" "completion")
ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"

#ZSH_AUTOSUGGEST_CLEAR_WIDGETS=()
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=()
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(forward-char forward-word)
ZSH_AUTOSUGGEST_EXECUTE_WIDGETS=()
ZSH_AUTOSUGGEST_IGNORE_WIDGETS=()

bindkey '^s' autosuggest-accept
