function todo -d "custom todo with ~/todo file"
    set -l todofile $HOME/todo
    test -s $todofile || return
    type -q rg || { echo "`rg` is not available."; return }
    type -q sd || { echo "`sd` is not available."; return }

    printf '%sTODOs:%s\n' (set_color green) (set_color normal)
    rg -v '^#' $todofile | sd '^(<[^>]*>)(.*)$' (printf '  %s${1}%s${2}' (set_color magenta) (set_color blue))
    echo

    set_color normal
end
