HISTFILE="$HOME/.zhistory"
HISTSIZE=10000 # maximum amount of history saved in a shell session
SAVEHIST=10000 # maximum amount of history saved to disk

# Share history between multiple concurrent shell sessions
setopt APPEND_HISTORY     # append to history file instead of overwriting it
setopt INC_APPEND_HISTORY # incrementally append to history file instead of only at shell exit
setopt SHARE_HISTORY      # constantly imports new commands from history

# Remove duplicates from command history
setopt HIST_IGNORE_DUPS     # don't save consecutive duplicate commands to the history list
setopt HIST_IGNORE_ALL_DUPS # don't save any duplicate commands to the history list
setopt HIST_SAVE_NO_DUPS    # don't write any duplicate commands to the history file
setopt HIST_FIND_NO_DUPS    # don't find any duplicate commands when searching through command history

setopt HIST_IGNORE_SPACE    # don't save commands starting with a space to the history list
