# Stop execution if tmux is not installed
command -v tmux &> /dev/null || return 0

# Enter tmux session on startup (only if inside interactive shell and not already in tmux)
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]]; then
	if ! tmux has-session -t default; then
		tmux new-session -s default
	fi
	exec tmux attach-session -t default
fi
