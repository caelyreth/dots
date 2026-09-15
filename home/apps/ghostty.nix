{ lib, palette, ... }:

let
  hex = lib.removePrefix "#";
in
{
  programs.ghostty = {
    enable = true;
    # Ghostty itself is managed outside of Home Manager.
    package = null;
    enableFishIntegration = true;

    settings = {
      # font
      font-size = 14.5;
      font-family = "Maple Mono NF CN";
      # style
      theme = palette.name;
      window-padding-x = 10;
      window-padding-y = 4;
      # misc
      working-directory = "home";
      window-width = 80;
      window-height = 26;
      window-inherit-working-directory = false;
      tab-inherit-working-directory = true;
    };

    themes.${palette.name} = {
      background = hex palette.terminal.background;
      foreground = hex palette.terminal.foreground;
      cursor-color = hex palette.accent.cursor;
      cursor-text = hex palette.terminal.background;
      selection-background = hex palette.ui.selection;
      selection-foreground = hex palette.text.primary;
      palette = [
        "0=${hex palette.terminal.ansi.black}"
        "1=${hex palette.terminal.ansi.red}"
        "2=${hex palette.terminal.ansi.green}"
        "3=${hex palette.terminal.ansi.yellow}"
        "4=${hex palette.terminal.ansi.blue}"
        "5=${hex palette.terminal.ansi.magenta}"
        "6=${hex palette.terminal.ansi.cyan}"
        "7=${hex palette.terminal.ansi.white}"
        "8=${hex palette.terminal.ansi.bright.black}"
        "9=${hex palette.terminal.ansi.bright.red}"
        "10=${hex palette.terminal.ansi.bright.green}"
        "11=${hex palette.terminal.ansi.bright.yellow}"
        "12=${hex palette.terminal.ansi.bright.blue}"
        "13=${hex palette.terminal.ansi.bright.magenta}"
        "14=${hex palette.terminal.ansi.bright.cyan}"
        "15=${hex palette.terminal.ansi.bright.white}"
      ];
    };
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
