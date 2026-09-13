{ ... }:

{
  imports = [
    ./utils.nix
    ./apps/ghostty.nix
    ./apps/zed.nix
    ./programs/nh.nix
    ./programs/agents.nix
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/env.nix
    ./programs/common.nix
    ./security/sops.nix
  ];

  home.stateVersion = "26.05";

  programs = {
    home-manager.enable = true;
    man.generateCaches = false;
  };
}
