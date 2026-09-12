{ pkgs, shared, ... }:

{
  home.stateVersion = "26.05";

  programs = {
    home-manager.enable = true;
    man.generateCaches = false;
  };

  imports = [
    ./fish.nix
    ./git.nix
    ./secrets.nix
    ./ssh.nix
  ];
}
