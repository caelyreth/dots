{ lib, ... }:

let
  load = dir:
    let
      entries = builtins.readDir dir;
    in
    map (name: dir + "/${name}")
      (builtins.filter
        (name:
          entries.${name} == "regular"
          && lib.hasSuffix ".nix" name
        )
        (builtins.attrNames entries));
in
{
  home.stateVersion = "26.05";

  programs = {
    home-manager.enable = true;
    man.generateCaches = false;
  };

  imports = [
    ./secrets.nix
  ] ++ load ./tools;
}
