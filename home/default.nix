{ pkgs, ... }:

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
    ./programs/uv.nix
    ./security/sops.nix
  ];

  home = {
    stateVersion = "26.05";
    packages = [
      pkgs.typst
      pkgs.macmon
      pkgs.tokei
      pkgs.addlicense
    ];
  };

  programs = {
    home-manager.enable = true;
    man.generateCaches = false;
  };
}
