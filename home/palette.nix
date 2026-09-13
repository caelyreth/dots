{ pkgs }:

rec {
  name = "Eclat";

  ui = {
    background = "#151515";
    editor = "#191919";
    surface = "#212121";
    hover = "#272726";
    active = "#525251";
    selection = "#3F3136";
    border = "#272726";
    focusedBorder = "#8E6673";
  };

  text = {
    primary = "#C0BEAF";
    muted = "#878782";
    bright = "#E0DFD7";
  };

  accent = {
    primary = "#CE94A7";
    focus = "#8E6673";
    hint = "#AA9DCA";
    cursor = "#CE94A7";
  };

  status = {
    success = "#76A78F";
    warning = "#D1A075";
    error = "#DA7C7E";
    info = "#CE94A7";
  };

  terminal = {
    background = "#191919";
    foreground = "#C0BEAF";
    dimForeground = "#878782";
    brightForeground = "#E0DFD7";

    ansi = {
      black = "#191919";
      red = "#DA7C7E";
      green = "#A0A973";
      yellow = "#D1A075";
      blue = "#AA9DCA";
      magenta = "#CE94A7";
      cyan = "#76A78F";
      white = "#C0BEAF";

      dim = {
        black = "#272726";
        red = "#A96061";
        green = "#6D724F";
        yellow = "#8B6F56";
        blue = "#655D79";
        magenta = "#8E6673";
        cyan = "#526F61";
        white = "#8E8D80";
      };

      bright = {
        black = "#525251";
        red = "#DD5F62";
        green = "#849140";
        yellow = "#CE8546";
        blue = "#8371B6";
        magenta = "#CA6385";
        cyan = "#3B9174";
        white = "#DBDAD1";
      };
    };
  };

  syntax = {
    comment = "#525251";
    keyword = "#DA7C7E";
    string = "#A0A973";
    function = "#AA9DCA";
    type = "#D1A075";
    constant = "#3B9174";
    number = "#D1A075";
    boolean = "#CE94A7";
  };

  replaceVars =
    src:
    let
      template = builtins.readFile src;
      replacements = {
        theme_name = name;
        background = terminal.background;
        cursor = accent.cursor;
        foreground = terminal.foreground;
        line_highlight = ui.surface;
        selection = ui.selection;
        selection_foreground = text.primary;
        primary = accent.primary;
        focus = accent.focus;
        hint = accent.hint;
        muted = text.muted;
        bright = text.bright;
        surface = ui.surface;
        active = ui.active;
        border = ui.border;
        success = status.success;
        warning = status.warning;
        error = status.error;
        info = status.info;
        syntax_comment = syntax.comment;
        syntax_keyword = syntax.keyword;
        syntax_string = syntax.string;
        syntax_function = syntax.function;
        syntax_type = syntax.type;
        syntax_constant = syntax.constant;
        syntax_number = syntax.number;
        syntax_boolean = syntax.boolean;
      };
    in
    pkgs.replaceVars src (
      pkgs.lib.filterAttrs (token: _: pkgs.lib.hasInfix "@${token}@" template) replacements
    );
}
