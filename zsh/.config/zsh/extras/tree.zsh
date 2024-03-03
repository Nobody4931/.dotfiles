# Stop execution if tree is not installed
command -v tree &> /dev/null || return 0

# Colorize tree output
alias tree="tree -C"
