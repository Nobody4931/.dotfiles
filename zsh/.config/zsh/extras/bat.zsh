# Stop execution if bat is not installed
command -v bat &> /dev/null || return 0

# Add aliases
alias cat="bat"
