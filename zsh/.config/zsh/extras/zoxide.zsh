# Stop execution if zoxide is not installed
command -v zoxide &> /dev/null || return 0

# Initialize zoxide
eval "$(zoxide init zsh)"
