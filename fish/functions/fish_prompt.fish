function fish_prompt -d '[HH:MM] User@Hostname:Cwd (GitPrompt) [LastPipestatus] CmdDuration $'
    # Custom prompt contents
    set -l last_pipestatus $pipestatus[-1]
    set -l current_time (date "+%H:%M")
    set -l cwd (basename (pwd | string replace $HOME "~"))
    set -l cmd_duration (math -s0 "$CMD_DURATION / 1000")

    # Sync with OS
    #
    # If enable this feature, the highlighting colors are set to the colors
    # defined by the terminal. This is helpful when the terminal is able to
    # switch its color scheme based on the OS appearance (or 'color mode').
    #
    # It's recommended to use the corresponding terminal port of Lettepa when
    # using this feature.
    set -l sync_with_os true

    # Color mode
    set -l is_dark true

    # Lettepa full palette
    set -l lettepa_anlan 101f30
    set -l lettepa_qinghui 2b333e
    set -l lettepa_waguanhui 47484c
    set -l lettepa_yuweihui 5e616d
    set -l lettepa_xinghui b2bbbe
    set -l lettepa_dalishihui c4cbcf
    set -l lettepa_zhenzhuhui e4dfd7
    set -l lettepa_hanbaiyu f8f4ed
    set -l lettepa_haitanghong f03752
    set -l lettepa_fengyehong c21f30
    set -l lettepa_shilv 57c3c2
    set -l lettepa_meidielv 12aa9c
    set -l lettepa_jianshilan 66a9c9
    set -l lettepa_dianqing 1661ab
    set -l lettepa_pubulan 51c4d3
    set -l lettepa_cuilan 1e9eb3
    set -l lettepa_fengxianhuahong ea7293
    set -l lettepa_zijinghong ee2c79
    set -l lettepa_mihuang fbb957
    set -l lettepa_canghuang 806332

    # Palette corresponding to the OS appearance
    if $sync_with_os
        # Main colors
        set -f bg black
        set -f bg0 brblack
        set -f fg0 white
        set -f fg brwhite
        # Primary accent colors
        set -f red red
        set -f green green
        set -f blue blue
        set -f cyan cyan
        set -f magenta magenta
        set -f yellow yellow
        # Secondary accent colors
        set -f red0 brred
        set -f green0 brgreen
        set -f blue0 brblue
        set -f cyan0 brcyan
        set -f magenta0 brmagenta
        set -f yellow0 bryellow
    else
        # Palette based on the color mode
        if $is_dark
            # Main colors
            set -f bg $lettepa_anlan
            set -f bg0 $lettepa_qinghui
            set -f fg0 $lettepa_dalishihui
            set -f fg $lettepa_zhenzhuhui
            # Primary accent colors
            set -f red $lettepa_haitanghong
            set -f green $lettepa_shilv
            set -f blue $lettepa_jianshilan
            set -f cyan $lettepa_pubulan
            set -f magenta $lettepa_fengxianhuahong
            set -f yellow $lettepa_mihuang
            # Secondary accent colors
            set -f red0 $lettepa_fengyehong
            set -f green0 $lettepa_meidielv
            set -f blue0 $lettepa_dianqing
            set -f cyan0 $lettepa_cuilan
            set -f magenta0 $lettepa_zijinghong
            set -f yellow0 $lettepa_canghuang
        else
            # Main colors
            set -f bg $lettepa_hanbaiyu
            set -f bg0 $lettepa_zhenzhuhui
            set -f fg0 $lettepa_waguanhui
            set -f fg $lettepa_qinghui
            # Primary accent colors
            set -f red $lettepa_fengyehong
            set -f green $lettepa_meidielv
            set -f blue $lettepa_dianqing
            set -f cyan $lettepa_cuilan
            set -f magenta $lettepa_zijinghong
            set -f yellow $lettepa_canghuang
            # Secondary accent colors
            set -f red0 $lettepa_haitanghong
            set -f green0 $lettepa_shilv
            set -f blue0 $lettepa_jianshilan
            set -f cyan0 $lettepa_pubulan
            set -f magenta0 $lettepa_fengxianhuahong
            set -f yellow0 $lettepa_mihuang
        end
    end

    # git prompt settings
    set -g __fish_git_prompt_showcolorhints true
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showuntrackedfiles true
    set -g __fish_git_prompt_show_informative_status true
    set -g __fish_git_prompt_showupstream informative
    set -g __fish_git_prompt_describe_style branch

    # git prompt clean state
    set -g __fish_git_prompt_char_cleanstate -
    set -g __fish_git_prompt_color_cleanstate $green

    # git prompt dirty states
    set -g __fish_git_prompt_char_dirtystate '?'
    set -g __fish_git_prompt_char_invalidstate '*'
    set -g __fish_git_prompt_char_stagedstate '+'
    set -g __fish_git_prompt_color_dirtystate $yellow
    set -g __fish_git_prompt_color_invalidstate $red
    set -g __fish_git_prompt_color_stagedstate $green

    # git prompt untracked
    set -g __fish_git_prompt_char_untrackedfiles '!'
    set -g __fish_git_prompt_color_untrackedfiles $magenta

    # git prompt colors
    set -g __fish_git_prompt_color $fg0
    set -g __fish_git_prompt_color_branch $cyan
    set -g __fish_git_prompt_color_branch_detached $magenta
    set -g __fish_git_prompt_color_branch_dirty $yellow
    set -g __fish_git_prompt_color_branch_staged $green

    # current time
    set_color $fg0
    printf "[%s] " $current_time

    if not set -q anonymous_fish_prompt
        # username
        set_color $magenta
        echo -n $USER

        # @ sep
        set_color $fg0
        echo -n '@'

        # hostname
        set_color $green
        echo -n $hostname

        # : sep
        set_color $fg0
        echo -n ':'
    end

    # cwd
    set_color $blue
    echo -n $cwd

    # git branch
    set_color $fg0
    printf '%s ' (fish_git_prompt)

    # last pipestatus
    if test ! $last_pipestatus = 0
        set_color $red --bold
        printf '[%s] ' $last_pipestatus
        set_color normal
    end

    # cmd duration
    if test ! $cmd_duration = 0
        set_color $fg0
        set -l year (math -s0 "$cmd_duration / (60 * 60 * 24 * 30 * 12)")
        set -l month (math -s0 "$cmd_duration / (60 * 60 * 24 * 30) % 12")
        set -l day (math -s0 "$cmd_duration / (60 * 60 * 24) % 30")
        set -l hour (math -s0 "$cmd_duration / (60 * 60) % 24")
        set -l minute (math -s0 "$cmd_duration / 60 % 60")
        set -l second (math -s0 "$cmd_duration % 60")
        function print_non_zero
            if ! test $argv[1] = 0
                printf '%s%s' $argv[1] $argv[2]
            end
        end
        print_non_zero $year yr
        print_non_zero $month mo
        print_non_zero $day d
        print_non_zero $hour hr
        print_non_zero $minute min
        print_non_zero $second s
        echo -n ' '
    end

    # $ indicator
    set_color $green
    echo -n '$ '
    set_color normal
end
