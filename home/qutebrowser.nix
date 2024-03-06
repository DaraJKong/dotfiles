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
        darkmode.policy.images = "never";
        preferred_color_scheme = "dark";
      };
    };
    quickmarks = {
      # Nix related
      packages = "https://search.nixos.org/packages";
      options = "https://search.nixos.org/options";
      mynixos = "https://mynixos.com/";

      nixpkgs = "https://github.com/NixOS/nixpkgs";
      home-manager = "https://github.com/nix-community/home-manager";

      # Programming
      github = "https://github.com/";

      # AI tools
      phind = "https://www.phind.com/search?home=true";
    };
  };
}
