path_like_add() {
    local var_name="$1"
    local mode="$2"
    shift 2

    # Collect all existing paths
    local -a valid_paths=()
    local p
    for p in "$@"; do
        if [[ -d "$p" ]]; then
            valid_paths+=("$p")
        fi
    done

    # Exit if no valid paths
    if [[ ${#valid_paths[@]} -eq 0 ]]; then
        echo 'path_like_add: no valid paths' >&2
        return 1
    fi

    # Get current value (empty if not defined)
    local current_val="${!var_name:-}"

    # Join wih ':'
    local IFS=":"
    local joined="${valid_paths[*]}"

    # Concatenate based on mode (prepend or append)
    local new_val
    case "${mode}" in
        prepend)
            new_val="${joined}${current_val:+:${current_val}}"
            ;;
        append)
            new_val="${current_val}${current_val:+:}${joined}"
            ;;
        *)
            echo "path_like_add: mode must be 'prepend' or 'append'" >&2
            return 1
            ;;
    esac

    export "${var_name}=${new_val}"
    return 0
}
