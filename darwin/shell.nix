{ pkgs, machine, ... }:

{
  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];

  users.users.${machine.username}.shell = pkgs.fish;

  # Ensure the existing macOS account uses Fish as its login shell.
  system.activationScripts.postActivation.text = ''
    /usr/bin/dscl . -create \
      /Users/${machine.username} \
      UserShell \
      /run/current-system/sw/bin/fish
  '';
}
