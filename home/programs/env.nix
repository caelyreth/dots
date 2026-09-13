{ ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableFishIntegration = true;
    silent = true;

    config = {
      global = {
        hide_env_diff = true;
      };
    };
  };

  programs.nix-your-shell = {
    enable = true;
    enableFishIntegration = true;
  };
}
