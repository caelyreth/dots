{ ... }:

{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      # habit
      cls = "clear";
      dots = "/etc/nix-darwin";
      # tools
      g = "git";
      ls = "eza";
      cd = "z";
    };
  };

  xdg.configFile."fish/functions" = {
    source = ../../dotfiles/fish/functions;
    recursive = true;
  };
}
