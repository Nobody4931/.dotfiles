autoload -U colors && colors

# Setup precmd hook to build git prompt
precmd_git_prompt_info() {
	unset git_prompt_info

	if git rev-parse --git-dir &> /dev/null; then
		local ref
		ref=$(git symbolic-ref --short HEAD 2> /dev/null) \
			|| ref=$(git describe --tags --exact-match HEAD 2> /dev/null) \
			|| ref=$(git rev-parse --short HEAD 2> /dev/null) \
			|| return 0

		git_prompt_info="%{$fg[blue]%}(%{$fg[red]%}$ref%{$fg[blue]%}) "
	fi
}
precmd_functions+=( precmd_git_prompt_info )
setopt PROMPT_SUBST # expand parameters in prompts (ie. $git_prompt_info)

# Build prompt
PROMPT="%{$fg[blue]%}[%{$fg[white]%}%F{255}%n%{$fg[red]%}@%{$fg[white]%}%F{255}%m%{$fg[blue]%}] "
PROMPT+="%(?:%{$fg[green]%}:%{$fg[red]%})➜ "
PROMPT+="%{$fg[cyan]%}%c "
PROMPT+="\$git_prompt_info"
PROMPT+="%{$reset_color%}%F{7}"
