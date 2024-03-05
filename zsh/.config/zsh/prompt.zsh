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

	cwd_prompt_info+="%F{cyan}${dirnames[-1]}"
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

		git_prompt_info+=" %F{red}["

		# Get untracked files
		# TODO: Not sure if this might create output so if I start seeing random text appear redirect this to /dev/null
		if ! git ls-files --other --directory --exclude-standard | sed Q1; then
			git_prompt_info+="?"
		fi

		# Get unstaged changes
		if ! git diff-files --quiet; then
			git_prompt_info+="!"
		fi

		# Get unpushed commits
		if ! git diff-index --quiet --cached HEAD; then
			git_prompt_info+="&"
		fi

		git_prompt_info+="]"
	fi
}

precmd_prompt_info() {
	precmd_cwd_prompt_info
	precmd_git_prompt_info
}
precmd_functions+=( precmd_prompt_info )
setopt PROMPT_SUBST # expand variables in prompt

# Build prompt
PROMPT="\$cwd_prompt_info %f"
PROMPT+="%(?:%F{green}:%F{red})❯"
PROMPT+="%f "

RPROMPT="\$git_prompt_info"
