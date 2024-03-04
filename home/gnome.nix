{
  config,
  lib,
  pkgs,
  ...
}: {
  # Set GNOME's keyboard layout
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      show-all-sources = true;
      sources = [(lib.hm.gvariant.mkTuple ["xkb" "ca"])];
      xkb-options = [];
    };
  };
}
