PROMPT_COMMAND=_bash_prompt

_bash_prompt() {
    local pipe_status="${PIPESTATUS[@]}"
    local -i pipe_failed=0
    for status in "${pipe_status[@]}"; do
        if (( status != 0 )); then
            pipe_failed=1
            break
        fi
    done

    local current_time='\A' # HH:MM
    local user='\u'
    local hostname='\h'
    local cwd='\w'

    local cmd_duration='0'
    if [[ -n "${CMD_START_TIME}" ]]; then
        local now
        now="$(date +%s.%N)"
        cmd_duration="$(awk "BEGIN {printf \"%.0f\", $now - $CMD_START_TIME}")"
    fi
    CMD_START_TIME="$(date +%s.%N)"

    # Standard colors
    local fg_black='\e[30m'
    local fg_red='\e[31m'
    local fg_green='\e[32m'
    local fg_yellow='\e[33m'
    local fg_blue='\e[34m'
    local fg_magenta='\e[35m'
    local fg_cyan='\e[36m'
    local fg_white='\e[37m'
    local fg_brblack='\e[90m'
    local fg_brred='\e[91m'
    local fg_brgreen='\e[92m'
    local fg_bryellow='\e[93m'
    local fg_brblue='\e[94m'
    local fg_brmagenta='\e[95m'
    local fg_brcyan='\e[96m'
    local fg_brwhite='\e[97m'
    # Style control
    local reset_all='\e[0m'
    local bold='\e[1m'

    # Renamed colors
    #
    # Main colors
    local c_bg="${fg_black}"
    local c_bg0="${fg_brblack}"
    local c_fg0="${fg_white}"
    local c_fg="${fg_brwhite}"
    # Primary accent colors
    local c_red="${fg_red}"
    local c_green="${fg_green}"
    local c_yellow="${fg_yellow}"
    local c_blue="${fg_blue}"
    local c_magenta="${fg_magenta}"
    local c_cyan="${fg_cyan}"
    # Secondary accent colors
    local c_red0="${fg_brred}"
    local c_green0="${fg_brgreen}"
    local c_yellow0="${fg_bryellow}"
    local c_blue0="${fg_brblue}"
    local c_magenta0="${fg_brmagenta}"
    local c_cyan0="${fg_brcyan}"

    # Reset
    PS1=''

    # Helper functions
    #
    # printf that appends output to PS1
    appendf() {
        appendf__format="$1"
        shift
        printf -v PS1 "%s${appendf__format}" "$PS1" "$@"
    }
    # set color with '\[' and '\]'
    set_color() {
        appendf '\[%s\]' $1
    }

    # current time
    set_color "${c_fg0}"
    appendf '[%s] ' "${current_time}"

    # user
    set_color "${c_magenta}"
    appendf '%s' "${user}"

    # @ sep
    set_color "${c_fg0}"
    appendf '@'

    # hostname
    set_color "${c_green}"
    appendf '%s' "${hostname}"

    # : sep
    set_color "${c_fg0}"
    appendf ':'

    # cwd
    set_color "${c_blue}"
    appendf '%s' "${cwd}"

    # git prompt
    _bash_git_prompt__color="${c_fg0}"
    _bash_git_prompt__color_branch="${c_cyan}"
    set_color "${c_fg0}"
    appendf '%s' "$(_bash_git_prompt)"

    # pipe status
    if (( pipe_failed )); then
        set_color "${c_red}"
        set_color "${bold}"
        appendf ' [%s]' "${pipe_status[*]}"
        set_color "${reset_all}"
    fi

    # cmd duration
    if (( cmd_duration )); then
        set_color "${c_fg0}"

        local day=$((cmd_duration / 86400))
        local hour=$((cmd_duration / 3600 % 24))
        local minute=$((cmd_duration / 60 % 60))
        local second=$((cmd_duration % 60))

        append_non_zero() {
            if (( $1 )); then
                appendf '%s%s' $1 $2
            fi
        }

        appendf ' '
        append_non_zero "${day}" 'd'
        append_non_zero "${hour}" 'hr'
        append_non_zero "${minute}" 'min'
        append_non_zero "${second}" 's'
    fi

    # $ indicator
    set_color "${c_green}"
    appendf ' $ '
    set_color "${reset_all}"
}

_bash_git_prompt() {
    local git_prompt_format=' (%s)'
    if [[ -n "$1" ]]; then
        git_prompt_format="$1"
    fi

    local git_prompt=''

    appendf() {
        appendf__format="$1"
        shift
        printf -v git_prompt "%s${appendf__format}" "${git_prompt}" "$@"
    }

    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    if [[ -n "${branch}" ]]; then
        appendf '\[%s\]%s\[%s\]' \
            "${_bash_git_prompt__color_branch}" \
            "${branch}" \
            "${_bash_git_prompt__color}"
    fi

    if [[ -n "${git_prompt}" ]]; then
        printf "${git_prompt_format}" "${git_prompt}"
    fi
}
