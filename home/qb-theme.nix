{
  config,
  lib,
  ...
}: {
  options = with lib; {
    flavour = mkOption {
      default = "mocha";
      type = types.str;
      description = ''
        Catppuccin variant
      '';
    };
    samecolorrows = mkOption {
      default = false;
      type = types.bool;
    };
  };

  config = let
    flavours = {
      latte = {
        rosewater = "#dc8a78";
        flamingo = "#dd7878";
        pink = "#ea76cb";
        mauve = "#8839ef";
        red = "#d20f39";
        maroon = "#e64553";
        peach = "#fe640b";
        yellow = "#df8e1d";
        green = "#40a02b";
        teal = "#179299";
        sky = "#04a5e5";
        sapphire = "#209fb5";
        blue = "#1e66f5";
        lavender = "#7287fd";
        text = "#4c4f69";
        subtext1 = "#5c5f77";
        subtext0 = "#6c6f85";
        overlay2 = "#7c7f93";
        overlay1 = "#8c8fa1";
        overlay0 = "#9ca0b0";
        surface2 = "#acb0be";
        surface1 = "#bcc0cc";
        surface0 = "#ccd0da";
        base = "#eff1f5";
        mantle = "#e6e9ef";
        crust = "#dce0e8";
      };
      frappe = {
        rosewater = "#f2d5cf";
        flamingo = "#eebebe";
        pink = "#f4b8e4";
        mauve = "#ca9ee6";
        red = "#e78284";
        maroon = "#ea999c";
        peach = "#ef9f76";
        yellow = "#e5c890";
        green = "#a6d189";
        teal = "#81c8be";
        sky = "#99d1db";
        sapphire = "#85c1dc";
        blue = "#8caaee";
        lavender = "#babbf1";
        text = "#c6d0f5";
        subtext1 = "#b5bfe2";
        subtext0 = "#a5adce";
        overlay2 = "#949cbb";
        overlay1 = "#838ba7";
        overlay0 = "#737994";
        surface2 = "#626880";
        surface1 = "#51576d";
        surface0 = "#414559";
        base = "#303446";
        mantle = "#292c3c";
        crust = "#232634";
      };
      macchiato = {
        rosewater = "#f4dbd6";
        flamingo = "#f0c6c6";
        pink = "#f5bde6";
        mauve = "#c6a0f6";
        red = "#ed8796";
        maroon = "#ee99a0";
        peach = "#f5a97f";
        yellow = "#eed49f";
        green = "#a6da95";
        teal = "#8bd5ca";
        sky = "#91d7e3";
        sapphire = "#7dc4e4";
        blue = "#8aadf4";
        lavender = "#b7bdf8";
        text = "#cad3f5";
        subtext1 = "#b8c0e0";
        subtext0 = "#a5adcb";
        overlay2 = "#939ab7";
        overlay1 = "#8087a2";
        overlay0 = "#6e738d";
        surface2 = "#5b6078";
        surface1 = "#494d64";
        surface0 = "#363a4f";
        base = "#24273a";
        mantle = "#1e2030";
        crust = "#181926";
      };
      mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
    };
    palette = flavours."${config.flavour}";
  in {
    programs.qutebrowser.settings = {
      # completion
      ## Background color of the completion widget category headers.
      colors.completion.category.bg = palette.base;
      ## Bottom border color of the completion widget category headers.
      colors.completion.category.border.bottom = palette.mantle;
      ## Top border color of the completion widget category headers.
      colors.completion.category.border.top = palette.overlay2;
      ## Foreground color of completion widget category headers.
      colors.completion.category.fg = palette.green;
      ## Background color of the completion widget for even and odd rows.
      colors.completion.even.bg = palette.mantle;
      colors.completion.odd.bg =
        if config.samecolorrows
        then palette.mantle
        else palette.crust;
      ## Text color of the completion widget.
      colors.completion.fg = palette.subtext0;

      ## Background color of the selected completion item.
      colors.completion.item.selected.bg = palette.surface2;
      ## Bottom border color of the selected completion item.
      colors.completion.item.selected.border.bottom = palette.surface2;
      ## Top border color of the completion widget category headers.
      colors.completion.item.selected.border.top = palette.surface2;
      ## Foreground color of the selected completion item.
      colors.completion.item.selected.fg = palette.text;
      ## Foreground color of the selected completion item.
      colors.completion.item.selected.match.fg = palette.rosewater;
      ## Foreground color of the matched text in the completion.
      colors.completion.match.fg = palette.text;

      ## Color of the scrollbar in completion view
      colors.completion.scrollbar.bg = palette.crust;
      ## Color of the scrollbar handle in completion view.
      colors.completion.scrollbar.fg = palette.surface2;

      # downloads
      colors.downloads.bar.bg = palette.base;
      colors.downloads.error.bg = palette.base;
      colors.downloads.start.bg = palette.base;
      colors.downloads.stop.bg = palette.base;

      colors.downloads.error.fg = palette.red;
      colors.downloads.start.fg = palette.blue;
      colors.downloads.stop.fg = palette.green;
      colors.downloads.system.fg = "none";
      colors.downloads.system.bg = "none";

      # hints
      ## Background color for hints. Note that you can use a `rgba(...)` value
      ## for transparency.
      colors.hints.bg = palette.peach;

      ## Font color for hints.
      colors.hints.fg = palette.mantle;

      ## Hints
      hints.border = "1px solid " + palette.mantle;

      ## Font color for the matched part of hints.
      colors.hints.match.fg = palette.subtext1;

      # keyhints
      ## Background color of the keyhint widget.
      colors.keyhint.bg = palette.mantle;

      ## Text color for the keyhint widget.
      colors.keyhint.fg = palette.text;

      ## Highlight color for keys to complete the current keychain.
      colors.keyhint.suffix.fg = palette.subtext1;

      # messages
      ## Background color of an error message.
      colors.messages.error.bg = palette.overlay0;
      ## Background color of an info message.
      colors.messages.info.bg = palette.overlay0;
      ## Background color of a warning message.
      colors.messages.warning.bg = palette.overlay0;

      ## Border color of an error message.
      colors.messages.error.border = palette.mantle;
      ## Border color of an info message.
      colors.messages.info.border = palette.mantle;
      ## Border color of a warning message.
      colors.messages.warning.border = palette.mantle;

      ## Foreground color of an error message.
      colors.messages.error.fg = palette.red;
      ## Foreground color an info message.
      colors.messages.info.fg = palette.text;
      ## Foreground color a warning message.
      colors.messages.warning.fg = palette.peach;

      # prompts
      ## Background color for prompts.
      colors.prompts.bg = palette.mantle;

      # ## Border used around UI elements in prompts.
      colors.prompts.border = "1px solid " + palette.overlay0;

      ## Foreground color for prompts.
      colors.prompts.fg = palette.text;

      ## Background color for the selected item in filename prompts.
      colors.prompts.selected.bg = palette.surface2;

      ## Background color for the selected item in filename prompts.
      colors.prompts.selected.fg = palette.rosewater;

      # statusbar
      ## Background color of the statusbar.
      colors.statusbar.normal.bg = palette.base;
      ## Background color of the statusbar in insert mode.
      colors.statusbar.insert.bg = palette.crust;
      ## Background color of the statusbar in command mode.
      colors.statusbar.command.bg = palette.base;
      ## Background color of the statusbar in caret mode.
      colors.statusbar.caret.bg = palette.base;
      ## Background color of the statusbar in caret mode with a selection.
      colors.statusbar.caret.selection.bg = palette.base;

      ## Background color of the progress bar.
      colors.statusbar.progress.bg = palette.base;
      ## Background color of the statusbar in passthrough mode.
      colors.statusbar.passthrough.bg = palette.base;

      ## Foreground color of the statusbar.
      colors.statusbar.normal.fg = palette.text;
      ## Foreground color of the statusbar in insert mode.
      colors.statusbar.insert.fg = palette.rosewater;
      ## Foreground color of the statusbar in command mode.
      colors.statusbar.command.fg = palette.text;
      ## Foreground color of the statusbar in passthrough mode.
      colors.statusbar.passthrough.fg = palette.peach;
      ## Foreground color of the statusbar in caret mode.
      colors.statusbar.caret.fg = palette.peach;
      ## Foreground color of the statusbar in caret mode with a selection.
      colors.statusbar.caret.selection.fg = palette.peach;

      ## Foreground color of the URL in the statusbar on error.
      colors.statusbar.url.error.fg = palette.red;

      ## Default foreground color of the URL in the statusbar.
      colors.statusbar.url.fg = palette.text;

      ## Foreground color of the URL in the statusbar for hovered links.
      colors.statusbar.url.hover.fg = palette.sky;

      ## Foreground color of the URL in the statusbar on successful load
      colors.statusbar.url.success.http.fg = palette.teal;

      ## Foreground color of the URL in the statusbar on successful load
      colors.statusbar.url.success.https.fg = palette.green;

      ## Foreground color of the URL in the statusbar when there's a warning.
      colors.statusbar.url.warn.fg = palette.yellow;

      ## PRIVATE MODE COLORS
      ## Background color of the statusbar in private browsing mode.
      colors.statusbar.private.bg = palette.mantle;
      ## Foreground color of the statusbar in private browsing mode.
      colors.statusbar.private.fg = palette.subtext1;
      ## Background color of the statusbar in private browsing + command mode.
      colors.statusbar.command.private.bg = palette.base;
      ## Foreground color of the statusbar in private browsing + command mode.
      colors.statusbar.command.private.fg = palette.subtext1;

      # tabs
      ## Background color of the tab bar.
      colors.tabs.bar.bg = palette.crust;
      ## Background color of unselected even tabs.
      colors.tabs.even.bg = palette.surface2;
      ## Background color of unselected odd tabs.
      colors.tabs.odd.bg = palette.surface1;

      ## Foreground color of unselected even tabs.
      colors.tabs.even.fg = palette.overlay2;
      ## Foreground color of unselected odd tabs.
      colors.tabs.odd.fg = palette.overlay2;

      ## Color for the tab indicator on errors.
      colors.tabs.indicator.error = palette.red;
      ## Color gradient interpolation system for the tab indicator.
      ## Valid values:
      ##	 - rgb: Interpolate in the RGB color system.
      ##	 - hsv: Interpolate in the HSV color system.
      ##	 - hsl: Interpolate in the HSL color system.
      ##	 - none: Don't show a gradient.
      colors.tabs.indicator.system = "none";

      # ## Background color of selected even tabs.
      colors.tabs.selected.even.bg = palette.base;
      # ## Background color of selected odd tabs.
      colors.tabs.selected.odd.bg = palette.base;

      # ## Foreground color of selected even tabs.
      colors.tabs.selected.even.fg = palette.text;
      # ## Foreground color of selected odd tabs.
      colors.tabs.selected.odd.fg = palette.text;

      # context menus
      colors.contextmenu.menu.bg = palette.base;
      colors.contextmenu.menu.fg = palette.text;

      colors.contextmenu.disabled.bg = palette.mantle;
      colors.contextmenu.disabled.fg = palette.overlay0;

      colors.contextmenu.selected.bg = palette.overlay0;
      colors.contextmenu.selected.fg = palette.rosewater;

      # background color for webpages
      colors.webpage.bg = palette.base;
    };
  };
}
