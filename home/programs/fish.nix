{ ... }:

{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      cls = "clear";
      g = "git";
    };
  };
}
