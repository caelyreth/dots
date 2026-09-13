function fish_prompt --description 'Two-line colored prompt'
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status

    set -l reset   (set_color normal)
    set -l blue    (set_color blue)
    set -l white   (set_color white)
    set -l yellow  (set_color yellow)
    set -l magenta (set_color magenta)
    set -l cyan    (set_color cyan)

    # blank line between prompts
    if set -q __prompt_has_run
        echo
    else
        set -g __prompt_has_run 1
    end

    # root prompt handling
    set -l color_cwd $fish_color_cwd
    set -l suffix '>'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    set -l cwd (set_color $color_cwd)

    # command status / pipestatus
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

    # user
    echo -n "$blue$USER"

    # only show hostname for remote SSH sessions
    if set -q SSH_CONNECTION; or set -q SSH_TTY
        echo -n "$white @ $yellow"(prompt_hostname)
    end

    # current directory
    echo -n "$reset $cwd"(prompt_pwd)

    # git branch
    if test -n "$git_branch"
        echo -n " $magenta$git_branch"
    end

    # command status
    if test -n "$prompt_status"
        echo -n "$reset $prompt_status"
    end

    # active devenv environment
    if set -q DEVENV_ROOT
        set -l devenv_name (path basename "$DEVENV_ROOT")
        echo -n " "$cyan"[dev:$devenv_name]"
    end

    echo
    echo -n "$reset$suffix "
end
