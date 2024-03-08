# Stop execution if eza/exa is not installed
command -v eza &> /dev/null || \
	command -v exa &> /dev/null || return 0

# Detect whether eza or exa is installed, preferring eza
ezacmd=${commands[eza]:-${commands[exa]}}

# Create alias for eza ('x' because eza was originally exa)
alias x="$ezacmd -g --git --time-style='+%m.%d.%y %H:%M' --icons"

# Create quality of life aliases for eza
alias xa="x -a"
alias xal="x -al"
alias xl="x -l"
