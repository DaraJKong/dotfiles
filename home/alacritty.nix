{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  # Install the alacritty-theme overlay
  nixpkgs.overlays = [inputs.alacritty-theme.overlays.default];

  programs.alacritty = {
    enable = true;
    settings.import = [pkgs.alacritty-theme.catppuccin_mocha];
  };

  dconf.settings = {
    "org/gnome/desktop/default-applications" = {
      terminal = "alacritty";
    };
  };
}
