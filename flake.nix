{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs_daisyui.url = "github:NixOS/nixpkgs/dc763d353cdf5c5cd7bf2c7af4b750960e66cce7";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
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
    blender-bin = {
      url = "github:edolstra/nix-warez?dir=blender";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    muse-sounds-manager.url = "github:thilobillerbeck/muse-sounds-manager-nix";
    musnix.url = "github:musnix/musnix";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs_daisyui,
    flake-parts,
    rust-overlay,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} ({withSystem, ...}: {
      systems = ["x86_64-linux"];

      imports = [
        {
          config._module.args._inputs = inputs // {inherit (inputs) self;};
        }

        inputs.flake-parts.flakeModules.easyOverlay
      ];

      perSystem = {
        inputs',
        config,
        pkgs,
        system,
        ...
      }: let
        overlays = [(import rust-overlay)];
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [
            (final: prev: {
              lmms = prev.lmms.overrideAttrs {
                version = "1.3.0-alpha.1";
                src = pkgs.fetchFromGitHub {
                  owner = "LMMS";
                  repo = "lmms";
                  rev = "bda042e1eb59e4c7508faa072051c50c2e12894d";
                  sha256 = "sha256-EGJcTzPUkIqURHKjX6dTRkeRTqwHM8eG74lYVILgSAs";
                  fetchSubmodules = true;
                };
                patches = [];
              };
            })
          ];
          config = {};
        };
        pkgs = system:
          import nixpkgs {
            inherit system overlays;
          };
        pkgs_daisyui = system:
          import nixpkgs_daisyui {
            inherit system;
          };
        my-tailwindcss = pkgs.nodePackages.tailwindcss.overrideAttrs (oa: {
          plugins = [pkgs_daisyui.daisyui];
        });
      in {
        devShells = with pkgs; {
          default = mkShell {
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
          "leptos-nightly" = mkShell {
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
              binaryen
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

      flake = {
        nixosConfigurations = import ./hosts inputs;
        images = {
          okarin =
            (self.nixosConfigurations.okarin.extendModules
              {
                modules = ["${nixpkgs}/nixos/modules/installer/sd-card/sd-image-x86_64.nix"];
              })
            .config
            .system
            .build
            .sdImage;
          mayushii =
            (self.nixosConfigurations.mayushii.extendModules
              {
                modules = ["${nixpkgs}/nixos/modules/installer/sd-card/sd-image-x86_64.nix"];
              })
            .config
            .system
            .build
            .sdImage;
        };
      };
    });
}
