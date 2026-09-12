{ pkgs, machine, ... }:

{
  imports = [
    ./fonts.nix
    ./shell.nix
  ];

  system.stateVersion = 7;

  nix = {
    package = pkgs.lix;
    channel.enable = false;
    optimise.automatic = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://mirrors.sjtug.sjtu.edu.cn/nix-channels/store"
        "https://cache.numtide.com"
      ];
      trusted-public-keys = [
        "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
      ];
    };
  };

  nixpkgs.hostPlatform = machine.system;

  users.users.${machine.username} = {
    name = machine.username;
    home = "/Users/${machine.username}";
  };

  networking = {
    hostName = machine.hostname;
    localHostName = machine.hostname;
    computerName = machine.hostname;
  };

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true;
  };

}
