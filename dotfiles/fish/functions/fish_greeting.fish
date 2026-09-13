function fish_greeting
    set -l reset  (set_color normal)
    set -l blue   (set_color blue)
    set -l yellow (set_color yellow)

    echo "Beneath the$blue frostlands$reset, the$yellow Startorch$reset burns."
    echo
end
