# Show completion menu after pressing tab twice
setopt AUTO_MENU

# Initialize completion engine and set dump file path
autoload -U compinit && compinit -d "$HOME/.zcompdump"
_comp_options+=(GLOB_DOTS) # show hidden files in completion choices

# Add completion rules:
# 1. Simple completion
# 2. Case insensitive completion
# 3. Partial completion (eg. f.b -> foo.bar)
# 4. Backwards completion (eg. bar -> foobar)
zstyle ':completion:*' matcher-list \
	'' \
	'm:{a-zA-Z}={A-Za-z}' \
	'r:|[._-]=* r:|=*' \
	'+l:|=* r:|=*'

# Enable completion menu
zstyle ':completion:*' menu select

# Display message on failed completion
zstyle ':completion:*:warnings' format '%F{red}no matches for:%f %d'

# Colorize matches
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Separate matches into groups
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:descriptions' format '%F{red}completing %B%d%b%f'
