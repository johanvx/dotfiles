# If not running interactively, do nothing.
[[ $- != *i* ]] && return

[[ -f ./bash_prompt.bash ]] && . ./bash_prompt.bash
