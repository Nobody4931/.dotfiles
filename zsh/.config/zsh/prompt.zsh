# Setup precmd hook to build git prompt
precmd_git_prompt_info() {
	unset git_prompt_info

	if git rev-parse --git-dir &> /dev/null; then
		local ref
		ref=$(git symbolic-ref --short HEAD 2> /dev/null) \
			|| ref=$(git describe --tags --exact-match HEAD 2> /dev/null) \
			|| ref=$(git rev-parse --short HEAD 2> /dev/null) \
			|| return 0

		git_prompt_info="%F{blue}(%F{red}$ref%F{blue}) "
	fi
}
precmd_functions+=( precmd_git_prompt_info )
setopt PROMPT_SUBST # expand parameters in prompts (ie. $git_prompt_info)

# Build prompt
PROMPT="%F{blue}[%F{white}%F{255}%n%F{red}@%F{white}%F{255}%F{255;25;25}%m%F{blue}] "
PROMPT+="%(?:%F{green}:%F{red})➜ "
PROMPT+="%F{cyan}%c "
PROMPT+="\$git_prompt_info"
PROMPT+="%f"
