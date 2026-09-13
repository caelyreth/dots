{ config, machine, ... }:

{
  imports = [
    ./apps/ghostty.nix
    ./programs/agents.nix
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/env.nix
    ./programs/common.nix
    ./security/sops.nix
  ];

  xdg.configFile."home-manager/flake.nix".source =
    config.lib.file.mkOutOfStoreSymlink "${machine.configurationDirectory}/flake.nix";

  home.stateVersion = "26.05";

  programs = {
    home-manager.enable = true;
    man.generateCaches = false;
  };
}
