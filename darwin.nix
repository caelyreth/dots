{ pkgs, shared, ... }:

{
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
      ];
    };
  };

  nixpkgs.hostPlatform = shared.arch;

  # constants
  users.users.${shared.user} = {
    name = shared.user;
    home = "/Users/${shared.user}";
    shell = pkgs.fish;
  };

  networking = {
    hostName = shared.host;
    localHostName = shared.host;
    computerName = shared.host;
  };

  # tweaks
  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true;
  };

  # shell
  programs.fish.enable = true;

  # activate fish in system level
  environment.shells = [ pkgs.fish ];

  # workaround: update config database manually
  system.activationScripts.postActivation.text = ''
    /usr/bin/dscl . -create \
      /Users/${shared.user} \
      UserShell \
      /run/current-system/sw/bin/fish
  '';
}
