# Stop execution if bat/batcat is not installed
# NOTE: bat is renamed to batcat on Ubuntu/Debian because of name conflicts with another package
command -v bat &> /dev/null \
	|| command -v batcat &> /dev/null \
	|| return 0

batcmd=${commands[bat]:-${commands[batcat]}}

# Add aliases
alias cat="$batcmd"
