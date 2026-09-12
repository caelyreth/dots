{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      # habit
      cls = "clear";
      # tools
      g = "git";
    };
  };
}
