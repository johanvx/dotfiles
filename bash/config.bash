# To use this bash configuration set, the following lines in ~/.bashrc:
#
# ```
# BASH_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/bash"
# if [[ -r "$BASH_CONFIG_DIR/config.bash" ]]; then
#     source "$BASH_CONFIG_DIR/config.bash"
# fi
# unset BASH_CONFIG_DIR
# ```

# If not running interactively, do nothing.
[[ $- != *i* ]] && return

BASH_CONFIG_DIR="${BASH_CONFIG_DIR:-$(
    cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &&
    pwd -P
)}"

# Helpers path_{append,prepend,remove,contains}
source "$BASH_CONFIG_DIR/lib/path.bash"

_source_bash_dir() {
    local dir=$1
    local file

    [[ -d "$dir" ]] || return 0

    for file in "$dir"/*.bash; do
        [[ -r "$file" ]] || continue
        source "$file"
    done
}

_source_bash_dir "$BASH_CONFIG_DIR/conf.d"
_source_bash_dir "$BASH_CONFIG_DIR/functions"

unset -f _source_bash_dir
unset BASH_CONFIG_DIR
