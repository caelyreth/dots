{ ... }:

{
  programs.ghostty = {
    enable = true;
    # Ghostty itself is managed outside of Home Manager.
    package = null;
    enableFishIntegration = true;
  };

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
