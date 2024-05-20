{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    audacity
    blender
    davinci-resolve
    gimp
    inkscape
    krita
    musescore
    (inputs.muse-sounds-manager.packages.${pkgs.system}.muse-sounds-manager)
    obs-studio
    slack
    vlc
  ];
}
