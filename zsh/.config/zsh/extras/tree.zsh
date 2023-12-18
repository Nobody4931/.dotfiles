# Stop execution if tree is not installed
command -v tree &> /dev/null || return 0

# Add aliases
alias tree="tree -C"
