{ ... }:

{
  programs.ghostty = {
    enable = true;
    package = null;
    enableFishIntegration = true; # integration only
  };

  # register completion
  programs.fish.completions.ghostty = ''
    if set -q GHOSTTY_RESOURCES_DIR
      set -l completion \
        (path dirname "$GHOSTTY_RESOURCES_DIR")/fish/vendor_completions.d/ghostty.fish

      if test -r "$completion"
        source "$completion"
      end
    end
  '';
}
