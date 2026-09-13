{ palette, ... }:

{
  programs = {
    fd.enable = true;
    ripgrep.enable = true;
    jq.enable = true;
    gh.enable = true;

    eza = {
      enable = true;
      enableFishIntegration = true;
      icons = "never";
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    bat = {
      enable = true;
      config.theme = palette.name;
      themes.${palette.name}.src = palette.replaceVars ../templates/bat.tmTheme.plist;
    };

    btop = {
      enable = true;
      settings = {
        color_theme = palette.name;
        theme_background = true;
      };
      themes.${palette.name} = palette.replaceVars ../templates/btop.theme;
    };

    difftastic = {
      enable = true;
      git.enable = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
