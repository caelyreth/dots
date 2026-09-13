function find_completion --description 'Show Fish completion file for a command'
    if test (count $argv) -ne 1
        echo "usage: find_completion COMMAND" >&2
        return 2
    end

    set -l cmd (path basename -- $argv[1])

    for dir in $fish_complete_path
        set -l file "$dir/$cmd.fish"

        if test -f "$file"
            echo "$file"
            return 0
        end
    end

    echo "No completion file found for '$cmd'" >&2
    return 1
end
