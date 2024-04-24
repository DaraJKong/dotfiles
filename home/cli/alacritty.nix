{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.alacritty-theme.overlays.default];

  programs.alacritty = {
    enable = true;
    settings.import = [pkgs.alacritty-theme.catppuccin_mocha];
    settings = {
      window.startup_mode = "Maximized";
      shell = "nu";
      font = {
        normal = {
          family = "FiraMono Nerd Font";
          style = "Regular";
        };
      };
    };
  };

  dconf.settings = {
    "org/gnome/desktop/default-applications" = {
      terminal = "alacritty";
    };
  };
}
