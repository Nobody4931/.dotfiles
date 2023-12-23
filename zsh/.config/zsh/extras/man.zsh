# Stop execution if man is not installed
command -v man &> /dev/null || return 0

# Build MANPAGER environment
local -a environment
environment+=("LESS_TERMCAP_so=${fg_bold[yellow]}${bg[blue]}")
environment+=("LESS_TERMCAP_mb=${fg_bold[magenta]}")
environment+=("LESS_TERMCAP_md=${fg_bold[magenta]}")
environment+=("LESS_TERMCAP_us=${fg_bold[blue]}")
environment+=("LESS_TERMCAP_me=${reset_color}")
environment+=("LESS_TERMCAP_se=${reset_color}")
environment+=("LESS_TERMCAP_ue=${reset_color}")
environment+=("GROFF_NO_SGR=1")

export MANPAGER="${${commands[less]:+env $environment ${commands[less]}}:-$MANPAGER}"
