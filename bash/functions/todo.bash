# todo - custom todo with ~/todo file
todo() {
    local -r green=$'\e[32m'
    local -r magenta=$'\e[35m'
    local -r blue=$'\e[34m'
    local -r normal=$'\e[0m'

    local -r todofile="${HOME}/todo"

    [[ -s "${todofile}" ]] || return

    command -v rg >/dev/null 2>&1 || {
        printf '%s\n' '`rg` is not available.'
        return
    }

    command -v sd >/dev/null 2>&1 || {
        printf '%s\n' '`sd` is not available.'
        return
    }

    printf '%sTODOs:%s\n' "${green}" "${normal}"

    rg -v '^#' "$todofile" |
        sd '^(<[^>]*>)(.*)$' \
           "$(printf '  %s${1}%s${2}' "${magenta}" "${blue}")"

    printf '\n%s' "$normal"
}
