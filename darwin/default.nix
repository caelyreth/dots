{ pkgs, shared, ... }:

{
  system.stateVersion = 7;

  nix = {
    package = pkgs.lix;
    channel.enable = false;
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

  users.users.${shared.user} = {
    name = shared.user;
    home = "/Users/${shared.user}";
  };

  networking = {
    hostName = shared.host;
    localHostName = shared.host;
    computerName = shared.host;
  };

  imports = [
    ./shell.nix
  ];
}
