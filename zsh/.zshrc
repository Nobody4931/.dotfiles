export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
mkdir -p "$ZSH_CACHE_DIR"

# TODO: Modularize this

#### Config options
setopt AUTO_CD

#### Custom prompt
autoload -Uz vcs_info
autoload -U colors && colors

precmd_vcs_info() { vcs_info }
precmd_functions+=(precmd_vcs_info)
setopt PROMPT_SUBST

zstyle ':vcs_info:git:*' formats "%{$fg[blue]%}(%{$fg[magenta]%}%b%{$fg[blue]%}) "

PROMPT="%{$fg[blue]%}[%{$fg[white]%}%F{255}%n%{$fg[red]%}@%{$fg[white]%}%F{255}%m%{$fg[blue]%}] "
PROMPT+="%(?:%{$fg[green]%}:%{$fg[red]%})➜ "
PROMPT+="%{$fg[cyan]%}%c "
PROMPT+="\$vcs_info_msg_0_"
PROMPT+="%{$reset_color%}"

## Syntax highlighting plugin
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

#### Command history
HISTFILE="$ZSH_CACHE_DIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

## FZF bindings plugin
source "/usr/share/fzf/key-bindings.zsh"

# Remove unwanted widgets and bindings (why is there no config option for this??)
for key in $(bindkey -L | grep fzf | grep -v history | cut -d ' ' -f 2 | tr -d '"'); do
	bindkey -r $key
done

#### Command autocompletion
autoload -U compinit && compinit -d "$ZSH_CACHE_DIR/.zcompdump"

zstyle ':completion:*' menu select                        # Use menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Ignore case

bindkey -e # Emacs keybinds

## Autosuggestions plugin
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"

#ZSH_AUTOSUGGEST_CLEAR_WIDGETS=()
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=()
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(forward-char forward-word)
ZSH_AUTOSUGGEST_EXECUTE_WIDGETS=()
ZSH_AUTOSUGGEST_IGNORE_WIDGETS=()

bindkey '^s' autosuggest-accept

#### Colored man pages
function colored_pager() {
	local -a environment

	environment+=("LESS_TERMCAP_so=${fg_bold[yellow]}${bg[blue]}")
	environment+=("LESS_TERMCAP_mb=${fg_bold[magenta]}")
	environment+=("LESS_TERMCAP_md=${fg_bold[magenta]}")
	environment+=("LESS_TERMCAP_us=${fg_bold[blue]}")
	environment+=("LESS_TERMCAP_me=${reset_color}")
	environment+=("LESS_TERMCAP_se=${reset_color}")
	environment+=("LESS_TERMCAP_ue=${reset_color}")
	environment+=("GROFF_NO_SGR=1")

	environment+=("PAGER=${commands[less]:-$PAGER}")

	command env $environment "$@"
}

alias man="colored_pager man"

#### Source modules
source "$HOME/.config/zsh/aliases.zsh"

#### Disable Ctrl+S hanging
stty -ixon
