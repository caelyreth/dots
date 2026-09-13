{ palette, ... }:

{
  programs.gh = {
    enable = true;
  };

  programs.gh-dash = {
    enable = true;

    settings.theme.colors = {
      text = {
        primary = palette.text.primary;
        secondary = palette.text.muted;
        inverted = palette.terminal.background;
        faint = palette.ui.active;
        warning = palette.status.warning;
        success = palette.status.success;
        error = palette.status.error;
        actor = palette.text.muted;
      };

      background.selected = palette.ui.hover;

      border = {
        primary = palette.ui.focusedBorder;
        secondary = palette.ui.active;
        faint = palette.ui.border;
      };

      icon = {
        newcontributor = palette.text.muted;
        contributor = palette.terminal.foreground;
        collaborator = palette.accent.hint;
        member = palette.status.info;
        owner = palette.accent.primary;
        unknownrole = palette.ui.active;
      };
    };
  };
}
