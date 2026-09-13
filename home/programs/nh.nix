{ ... }:

{
  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/etc/nix-darwin/flake.nix";
  };
}
