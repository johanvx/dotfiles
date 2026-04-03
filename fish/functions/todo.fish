function todo -d "custom todo with ~/todo file"
    set -l todofile $HOME/todo
    if test -s $todofile
        if type -q rg
            if type -q sd
                printf '%sTODOs:%s\n' (set_color green) (set_color normal)
                cat $todofile | rg -v '^#' | sd '^(<[^>]*>)(.*)$' (printf '  %s${1}%s${2}' (set_color magenta) (set_color blue))
                echo
            else
                echo "`sd` is not available."
            end
        else
            echo "`rg` is not available."
        end
    end

    set_color normal
end
