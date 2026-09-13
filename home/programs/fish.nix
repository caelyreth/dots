{ ... }:

{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      # habit
      cls = "clear";
      # tools
      g = "git";
      ls = "eza";
    };
  };

  xdg.configFile."fish/functions" = {
    source = ../../dotfiles/fish/functions;
    recursive = true;
  };
}
