autoload -U compinit && compinit -d "$HOME/.zcompdump"
_comp_options+=(GLOB_DOTS) # show hidden files in completion choices

zstyle ':completion:*' menu select                        # use completion menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # ignore case when invoking completion

zstyle ':completion:*:default'  list-colors "${(s.:.)LS_COLORS}" # color files in completion choices
