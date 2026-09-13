{ ... }:

{
  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    silent = true;

    config = {
      global = {
        hide_env_diff = true;
      };
    };
  };

  programs.devenv = {
    enable = true;
  };
}
