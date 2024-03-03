# Stop execution if ssh is not installed
command -v ssh &> /dev/null || return 0

# Extremely hacky solution but it captures all edge cases (hopefully)

ssh_agent_env_file="$HOME/.ssh/agent.env"

# Source the environment file if it exists and not already sourced
if [[ -f "$ssh_agent_env_file" ]] && [[ ! -e "$SSH_AUTH_SOCK" ]]; then
	source "$ssh_agent_env_file" > /dev/null
fi

# Reload the environment if it has been invalidated for some reason
# ie. ssh-agent was killed, environment file was tampered with, etc.
if [[ ! -e "$SSH_AUTH_SOCK" ]]; then
	# Kill all existing ssh-agent's
	for pid in $(pgrep -u "$USER" ssh-agent); do
		kill $pid
	done
	# Start a new ssh-agent
	ssh-agent -s > "$ssh_agent_env_file"
	source "$ssh_agent_env_file" > /dev/null
	# Register all private keys
	for pubkey in "$HOME/.ssh/"*.pub; do
		privkey="${pubkey/.pub/}"
		ssh-add "$privkey" > /dev/null
	done
fi

unset ssh_agent_env_file
