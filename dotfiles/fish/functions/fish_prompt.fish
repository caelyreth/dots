function fish_prompt --description 'Two-line colored prompt'
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status
    set -l normal (set_color --reset)

    # blank line between prompts.
    if set -q __prompt_has_run
        echo
    else
        set -g __prompt_has_run 1
    end

    # root prompt handling.
    set -l color_cwd $fish_color_cwd
    set -l suffix '>'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    # command status / pipestatus.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation

    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end

    set __fish_prompt_status_generation $status_generation

    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)

    set -l prompt_status (
        __fish_print_pipestatus "[" "]" "|" \
            "$status_color" "$statusb_color" \
            $last_pipestatus
    )

    # git branch
    set -l git_branch (
        command git symbolic-ref --quiet --short HEAD 2>/dev/null
    )

    # username - blue
    set_color blue
    echo -n $USER

    # @ - dim
    set_color --dim white
    echo -n ' @ '

    # hostname
    set_color normal
    set_color yellow
    echo -n (prompt_hostname)

    # path
    set_color normal
    echo -n ' '
    set_color $color_cwd
    echo -n (prompt_pwd)

    # git branch
    if test -n "$git_branch"
        set_color normal
        echo -n ' '
        set_color magenta
        echo -n $git_branch
    end

    # status
    set_color normal
    if test -n "$prompt_status"
        echo -n ' ' $prompt_status
    end

    # second line
    echo
    set_color normal
    echo -n "$suffix "
end
