{ config, lib, pkgs, ... }: {
  programs.helix = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "helix";
  };
}
