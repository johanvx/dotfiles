function todo -d "custom todo with ~/todo file"
    set -l todofile $HOME/todo
    test -s $todofile || return
    type -q rg || begin; echo "`rg` is not available."; return; end
    type -q sd || begin; echo "`sd` is not available."; return; end

    printf '%sTODOs:%s\n' (set_color green) (set_color normal)
    rg -v '^#' $todofile | sd '^(<[^>]*>)(.*)$' (printf '  %s${1}%s${2}' (set_color magenta) (set_color blue))
    echo

    set_color normal
end
