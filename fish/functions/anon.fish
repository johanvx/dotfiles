function anon -d 'Anonymous mode for fish prompt'
    if set -q anonymous_fish_prompt
        set -e anonymous_fish_prompt
        echo 'fish prompt: anonymous mode off.'
    else
        set -g anonymous_fish_prompt 1
        echo 'fish prompt: anonymous mode on.'
    end
end
