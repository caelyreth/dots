function lt --description 'List file tree with eza' --wraps eza
    eza --tree --git-ignore --level=3 $argv
end
