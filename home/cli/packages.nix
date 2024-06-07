{pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.nerdfonts.override {fonts = ["FiraCode" "FiraMono"];})
    xclip
    ripgrep
    # alejandra
    # nil

    # clang
    # openssl
    # pkg-config
    # cargo-leptos
    # sqlite
    # sqlx-cli
    # leptosfmt
    # taplo
    # tailwindcss
    # tailwindcss-language-server
  ];
}
