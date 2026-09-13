function ll --description 'List files with eza' --wraps eza
    eza -lah --git $argv
end
