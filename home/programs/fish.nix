{ ... }:

{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      cls = "clear";
      g = "git";
    };
  };

  xdg.configFile."fish/functions" = {
    source = ../../dotfiles/fish/functions;
    recursive = true;
  };
}
