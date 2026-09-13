{ palette, pkgs, ... }:

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
    themes.${palette.name}.src = pkgs.replaceVars ../templates/bat.tmTheme.plist {
      theme_name = palette.name;
      background = palette.terminal.background;
      cursor = palette.accent.cursor;
      foreground = palette.terminal.foreground;
      line_highlight = palette.ui.surface;
      selection = palette.ui.selection;
      selection_foreground = palette.text.primary;
      syntax_comment = palette.syntax.comment;
      syntax_keyword = palette.syntax.keyword;
      syntax_string = palette.syntax.string;
      syntax_function = palette.syntax.function;
      syntax_type = palette.syntax.type;
      syntax_constant = palette.syntax.constant;
      syntax_number = palette.syntax.number;
      syntax_boolean = palette.syntax.boolean;
      error = palette.status.error;
    };
  };
}
