{ config, ... }:

{
  programs.git = {
    enable = true;

    ignores = [
      ".env"
      ".DS_Store"
    ];

    settings = {
      user = {
        name = "Yu";
        email = "echo.aimless@gmail.com";
      };

      init.defaultBranch = "main";
      pull.rebase = true;
      fetch.prune = true;
      rerere.enabled = true;

      alias = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        lg = "log --graph --oneline --decorate --all";
      };
    };

    signing = {
      format = "ssh";
      key = config.sops.secrets."ssh/github".path;
      signByDefault = true;
    };
  };
}
