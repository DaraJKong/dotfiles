{pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.nerdfonts.override {fonts = ["FiraCode" "FiraMono"];})
    alejandra
    # cargo
    cargo-leptos
    clang
    leptosfmt
    nil
    ripgrep
    openssl
    pkg-config
    # rust-analyzer
    sqlite
    sqlx-cli
    tailwindcss
    tailwindcss-language-server
    xclip
  ];
}
