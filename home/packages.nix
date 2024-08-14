{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    audacity
    davinci-resolve
    gimp
    inkscape
    krita
    musescore
    (inputs.muse-sounds-manager.packages.${pkgs.system}.muse-sounds-manager)
    obs-studio
    rustdesk
    vlc
  ];
}
