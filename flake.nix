{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs_daisyui.url = "github:NixOS/nixpkgs/dc763d353cdf5c5cd7bf2c7af4b750960e66cce7";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    muse-sounds-manager.url = "github:thilobillerbeck/muse-sounds-manager-nix";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs_daisyui,
    rust-overlay,
    flake-utils,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    overlays = [(import rust-overlay)];
    pkgs = import nixpkgs {
      inherit system overlays;
    };
    pkgs_daisyui = import nixpkgs_daisyui {
      inherit system;
    };
    my-tailwindcss = pkgs.nodePackages.tailwindcss.overrideAttrs (oa: {
      plugins = [pkgs_daisyui.daisyui];
    });
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./system/configuration.nix
        ];
      };
    };

    devShells.${system} = {
      default = with pkgs;
        mkShell {
          shellHook = ''
            export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig";
          '';
          nativeBuildInputs = [
            pkg-config
          ];
          buildInputs = [
            git
            clang
            openssl
            (rust-bin.stable.latest.default.override {
              extensions = ["rust-src" "rust-std" "rust-analyzer" "rustfmt" "clippy"];
              targets = ["x86_64-unknown-linux-gnu" "wasm32-unknown-unknown"];
            })
            sqlite
            sqlx-cli
            nil
            alejandra
            statix
            deadnix
            taplo
          ];
        };
      "leptos-nightly" = with pkgs;
        mkShell {
          shellHook = ''
            export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig";
          '';
          nativeBuildInputs = [
            pkg-config
          ];
          buildInputs = [
            git
            openssl
            (rust-bin.selectLatestNightlyWith (toolchain:
              toolchain.default.override {
                extensions = ["rust-src" "rust-std" "rust-analyzer" "rustfmt" "clippy"];
                targets = ["x86_64-unknown-linux-gnu" "wasm32-unknown-unknown"];
              }))
            trunk
            cargo-leptos
            leptosfmt
            sqlite
            sqlx-cli
            nil
            alejandra
            statix
            deadnix
            taplo
            sass
            my-tailwindcss
            tailwindcss-language-server
          ];
        };
    };
  };
}
