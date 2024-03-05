{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.qutebrowser = {
    enable = true;
    settings = {
      colors.webpage = {
        darkmode.enabled = true;
        preferred_color_scheme = "dark";
      };
    };
  };
}
