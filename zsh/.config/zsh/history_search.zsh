# Source fzf's zsh keybinds if it exists
if [[ -f "/usr/share/fzf/key-bindings.zsh" ]]; then
	source "/usr/share/fzf/key-bindings.zsh"
elif [[ -f "/usr/share/doc/fzf/examples/key-bindings.zsh" ]]; then
	source "/usr/share/doc/fzf/examples/key-bindings.zsh"
else
	return 0
fi

# Remove unwanted keybinds (why is there no config option for this??)
for key in $(bindkey -L | grep fzf | grep -v history | cut -d ' ' -f 2 | tr -d '"'); do
	bindkey -r $key
done
