{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    sops
    age
  ];

  sops = {
    defaultSopsFile = ../../secrets/common.yaml;
    defaultSopsFormat = "yaml";

    age = {
      keyFile = "${config.home.homeDirectory}/Library/Application Support/sops/age/keys.txt";
      generateKey = false;
    };

    keepGenerations = 1;
  };
}
