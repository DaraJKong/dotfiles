{pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.nerdfonts.override {fonts = ["FiraCode" "FiraMono"];})
    alejandra
    # cargo
    nil
    ripgrep
    # rust-analyzer
    xclip
  ];
}
