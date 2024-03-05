{
  config,
  lib,
  pkgs,
  theme,
  ...
}: {
  dconf.settings = with lib.hm.gvariant; {
    # Set GNOME's keyboard layout
    "org/gnome/desktop/input-sources" = {
      show-all-sources = true;
      sources = [(mkTuple ["xkb" "ca"])];
      xkb-options = [];
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    # Set GNOME's wallpaper
    "org/gnome/desktop/background" = {
      picture-uri = "/home/darak/.background-image";
      picture-uri-dark = "/home/darak/.background-image";
    };
    "org/gnome/desktop/screensaver" = {
      picture-uri = "/home/darak/.background-image";
    };
  };

  home.file.".background-image".source = theme.wallpaper;
}
