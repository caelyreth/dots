{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    sops
    age
    age-plugin-se
  ];

  sops = {
    defaultSopsFile = ../secrets/common.yaml;
    defaultSopsFormat = "yaml";

    age = {
      keyFile =
        "${config.home.homeDirectory}/Library/Application Support/sops/age/keys.txt";

      generateKey = false;

      plugins = [
        pkgs.age-plugin-se
      ];
    };

    keepGenerations = 1;
  };
}
