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
    settings.font = {
      normal = {
        family = "FiraMono Nerd Font";
        style = "Regular";
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/default-applications" = {
      terminal = "alacritty";
    };
  };
}
