{
  imports = [
    ./apps/ghostty.nix
    ./programs/agents.nix
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/devenv.nix
    ./security/sops.nix
  ];

  home.stateVersion = "26.05";

  programs = {
    home-manager.enable = true;
    man.generateCaches = false;
  };
}
