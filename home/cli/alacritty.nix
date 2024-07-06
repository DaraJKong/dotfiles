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

  xdg.desktopEntries = {
    alacritty-dev = {
      name = "AlacrittyDev";
      genericName = "Terminal";
      exec = ''alacritty --hold --command zellij a -c dev'';
      terminal = false;
      categories = ["System" "TerminalEmulator"];
    };
  };

  dconf.settings = {
    "org/gnome/desktop/default-applications" = {
      terminal = "alacritty";
    };
  };
}
