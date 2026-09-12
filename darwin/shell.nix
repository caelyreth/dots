{ pkgs, shared, ... }:

{
  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];
  users.users.${shared.user}.shell = pkgs.fish;

  system.activationScripts.postActivation.text = ''
    /usr/bin/dscl . -create \
      /Users/${shared.user} \
      UserShell \
      /run/current-system/sw/bin/fish
  '';
}
