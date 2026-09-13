function ll --description 'List files with eza' --wraps eza
    eza -la --git $argv
end
