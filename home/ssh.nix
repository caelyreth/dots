{ config, ... }:

{
  sops.secrets."ssh/github" = {
    mode = "0400";
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "*" = {
        ForwardAgent = false;
        AddKeysToAgent = "no";
        Compression = false;
        ServerAliveInterval = 0;
        ServerAliveCountMax = 3;
        HashKnownHosts = true;
        UserKnownHostsFile = "~/.ssh/known_hosts";
        ControlMaster = "no";
        ControlPersist = "no";
      };

      "github.com" = {
        HostName = "ssh.github.com";
        Port = 443;
        User = "git";
        IdentitiesOnly = true;
        IdentityFile = config.sops.secrets."ssh/github".path;
      };
    };
  };
}
