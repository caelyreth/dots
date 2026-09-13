function find_completion --description 'Locate Fish completion source for a command'
    argparse 's/show' -- $argv
    or return 2

    if test (count $argv) -ne 1
        echo "usage: find_completion [-s|--show] COMMAND" >&2
        return 2
    end

    set -l cmd (path basename -- $argv[1])
    set -l name "$cmd.fish"

    for dir in $fish_complete_path
        set -l file "$dir/$name"

        if test -f "$file"
            if set -q _flag_show
                cat "$file"
            else
                echo "$file"
            end
            return 0
        end
    end

    set -l embedded "completions/$name"

    if status get-file "$embedded" >/dev/null 2>/dev/null
        if set -q _flag_show
            status get-file "$embedded"
        else
            echo "embedded:$embedded"
        end
        return 0
    end

    complete -C "$cmd " >/dev/null 2>/dev/null

    set -l definitions (complete -c "$cmd" 2>/dev/null)

    if test (count $definitions) -gt 0
        if set -q _flag_show
            string join \n -- $definitions
        else
            echo "runtime:$cmd"
        end
        return 0
    end

    echo "No command-specific completion found for '$cmd'" >&2
    return 1
end
