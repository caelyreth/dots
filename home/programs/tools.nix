{ palette, ... }:

{
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = "never";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.bat = {
    enable = true;
    config.theme = palette.name;
    themes.${palette.name}.src = palette.replaceVars ../templates/bat.tmTheme.plist;
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = palette.name;
      theme_background = true;
    };
    themes.${palette.name} = palette.replaceVars ../templates/btop.theme;
  };
}
