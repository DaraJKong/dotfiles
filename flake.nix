{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # devshell = {
    #   url = "github:numtide/devshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
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
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
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
      "rust-stable" = {
        name = "rust-stable";
        commands = {};
        env = {};
        packages = with pkgs; [
          alejandra
          # cargo
          cargo-leptos
          clang
          deadnix
          leptosfmt
          nil
          openssl
          pkg-config
          # rust-analyzer
          (rust-bin.stable.latest.default.override {
            extensions = ["rust-analyzer" "rust-src" "rust-std" "rustfmt" "clippy"];
            targets = ["x86_64-unknown-linux-gnu" "wasm32-unknown-unknown"];
          })
          sqlite
          sqlx-cli
          statix
          tailwindcss
          tailwindcss-language-server
          taplo
        ];
      };
    };
  };
}
