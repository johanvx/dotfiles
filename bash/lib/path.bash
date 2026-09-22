# ~/.config/bash/lib/path.bash
#
# Helpers for manipulating colon-separated path variables.
#
# Usage:
#   path_contains VAR DIR
#   path_prepend  VAR DIR...
#   path_append   VAR DIR...
#   path_remove   VAR DIR...
#
# prepend/append:
#   - ignore directories that do not exist
#   - avoid duplicate entries
#   - preserve argument order
#
# remove:
#   - remove matching entries even if the directory no longer exists
#
# These helpers do not export variables automatically.

_path_validate_var() {
    [[ $1 =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]] || {
        printf 'invalid variable name: %s\n' "$1" >&2
        return 2
    }
}

_path_value_contains() {
    local value=$1
    local dir=$2

    [[ ":$value:" == *":$dir:"* ]]
}

path_contains() {
    [[ $# -eq 2 ]] || {
        printf 'usage: path_contains VAR DIR\n' >&2
        return 2
    }

    local var=$1
    local dir=$2
    local value

    _path_validate_var "$var" || return

    value=${!var-}
    _path_value_contains "$value" "$dir"
}

path_prepend() {
    [[ $# -ge 2 ]] || {
        printf 'usage: path_prepend VAR DIR...\n' >&2
        return 2
    }

    local var=$1
    shift

    _path_validate_var "$var" || return

    local value=${!var-}
    local dir i
    local -a dirs=("$@")

    # Iterate backwards so:
    #
    #   path_prepend PATH /foo /bar
    #
    # results in:
    #
    #   /foo:/bar:$PATH
    #
    for ((i = ${#dirs[@]} - 1; i >= 0; i--)); do
        dir=${dirs[i]}

        [[ -d "$dir" ]] || continue
        _path_value_contains "$value" "$dir" && continue

        value="$dir${value:+:$value}"
    done

    printf -v "$var" '%s' "$value"
}

path_append() {
    [[ $# -ge 2 ]] || {
        printf 'usage: path_append VAR DIR...\n' >&2
        return 2
    }

    local var=$1
    shift

    _path_validate_var "$var" || return

    local value=${!var-}
    local dir

    for dir in "$@"; do
        [[ -d "$dir" ]] || continue
        _path_value_contains "$value" "$dir" && continue

        value="${value:+$value:}$dir"
    done

    printf -v "$var" '%s' "$value"
}

path_remove() {
    [[ $# -ge 2 ]] || {
        printf 'usage: path_remove VAR DIR...\n' >&2
        return 2
    }

    local var=$1
    shift

    _path_validate_var "$var" || return

    local value=${!var-}
    local target remaining entry new_value
    local first last

    for target in "$@"; do
        remaining=$value
        new_value=
        first=1

        while :; do
            if [[ $remaining == *:* ]]; then
                entry=${remaining%%:*}
                remaining=${remaining#*:}
                last=0
            else
                entry=$remaining
                last=1
            fi

            if [[ $entry != "$target" ]]; then
                if (( first )); then
                    new_value=$entry
                    first=0
                else
                    new_value+=":$entry"
                fi
            fi

            (( last )) && break
        done

        value=$new_value
    done

    printf -v "$var" '%s' "$value"
}
