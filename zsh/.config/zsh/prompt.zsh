# Setup precmd hook to build prompt
precmd_cwd_prompt_info() {
	cwd_prompt_info="%F{black}"

	# Split cwd path into directory names
	local dirnames=( ${(s:/:)$(print -P '%~')} )
	local dirnames_len=${#dirnames}

	# Start cwd prompt at root if it doesn't start at home
	if [[ "${dirnames[1]}" != "~" ]]; then
		cwd_prompt_info="/"
	fi

	for (( i=1; i<$dirnames_len; i++ )); do
		# Truncate to the first character
		local dirname=${dirnames[i]}
		local dirname_trunc=${dirname[1,1]}
		# If hidden directory, truncate to the first 2 characters
		if [[ "$dirname_trunc" == "." ]]; then
			dirname_trunc=${dirname[1,2]}
		fi

		cwd_prompt_info+="$dirname_trunc/"
	done

	cwd_prompt_info+="%F{cyan}${dirnames[-1]}%f"
}

precmd_git_prompt_info() {
	unset git_prompt_info

	# Check for git repository
	if git rev-parse --git-dir &> /dev/null; then
		# Get branch or refname
		local ref
		ref=$(git symbolic-ref --short HEAD 2> /dev/null) \
			|| ref=$(git describe --tags --exact-match HEAD 2> /dev/null) \
			|| ref=$(git rev-parse --short HEAD 2> /dev/null) \
			|| return 0

		git_prompt_info="on %F{magenta} $ref"

		# Get repository status
		git_prompt_info+=" %F{red}["

		local git_status=$(git status --porcelain 2> /dev/null)

		# Check for detached HEAD
		if [[ $(git rev-parse --abbrev-ref --symbolic-full-name HEAD) == "HEAD" ]]; then
			git_prompt_info+="✕"
		else
			local behind=$(git rev-list HEAD..$ref@{upstream} 2> /dev/null | wc -l)
			local ahead=$(git rev-list $ref@{upstream}..HEAD 2> /dev/null | wc -l)

			if [[ $behind == 0 ]] && [[ $ahead == 0 ]]; then # HEAD is synced with remote
				git_prompt_info+="✓"
			elif [[ $behind > 0 ]] && [[ $ahead == 0 ]]; then # HEAD is behind remote
				git_prompt_info+="↓"
			elif [[ $behind == 0 ]] && [[ $ahead > 0 ]]; then # HEAD is ahead of remote
				git_prompt_info+="↑"
			elif [[ $behind > 0 ]] && [[ $ahead > 0 ]]; then # HEAD is diverged from remote
				git_prompt_info+="↕"
			fi
		fi

		# Check for untracked files
		if echo "$git_status" | grep -q '^?? ' &> /dev/null; then
			git_prompt_info+="?"
		fi

		# Check for unstaged changes
		if echo "$git_status" | grep -qE '^[ MARC][MD] ' &> /dev/null; then
			git_prompt_info+="!"
		fi

		# Check for staged changes
		if echo "$git_status" | grep -qE '^(D[ M]|[MARC][ MD]) ' &> /dev/null; then
			git_prompt_info+="&"
		fi

		git_prompt_info+="]%f"
	fi
}

precmd_prompt_info() {
	precmd_cwd_prompt_info
	precmd_git_prompt_info
}
precmd_functions+=( precmd_prompt_info )
setopt PROMPT_SUBST # expand variables in prompt

# Build prompt
PROMPT="\$cwd_prompt_info "
PROMPT+="%(?:%F{green}:%F{red})❯"
PROMPT+="%f "

RPROMPT="\$git_prompt_info"
