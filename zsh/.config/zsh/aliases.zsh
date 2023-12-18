# Update mirrorlist
alias updmirrors="sudo cp -f /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak && sudo reflector --fastest 30 --latest 30 --number 15 --verbose --save /etc/pacman.d/mirrorlist"

# Confirm before overwriting
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Colored grep output
alias grep="grep --color=auto"

# Colored ls output
alias ls="ls --color=auto"

# Colored cat output
alias cat="bat"

# Quality of life ls
alias l="ls -a"
alias la="ls -lAFh"
alias ll="ls -lFh"

# Quality of life vim/nvim
alias v="vim"
alias nv="nvim"
