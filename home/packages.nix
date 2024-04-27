{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    audacity
    blender
    davinci-resolve
    gimp
    inkscape
    krita
    obs-studio
  ];
}
