{ config, machine, ... }:

let
  utils = rec {
    mkProjectSymlink =
      relativePath:
      config.lib.file.mkOutOfStoreSymlink "${machine.configurationDirectory}/${relativePath}";

    mkDotfileSymlink = relativePath: mkProjectSymlink "dotfiles/${relativePath}";
  };
in
{
  _module.args = { inherit utils; };

  xdg.configFile."home-manager/flake.nix".source = utils.mkProjectSymlink "flake.nix";
}
