{
  nixpkgs,
  self,
  ...
}: let
  inherit (self) inputs;
  core = ../system/core;
  bootloader = ../system/core/bootloader.nix;
  nvidia = ../system/core/nvidia.nix;
  steam = ../system/core/steam.nix;
  # hw = inputs.nixos-hardware.nixosModules;
  # agenix = inputs.agenix.nixosModules.age;
  hmModule = inputs.home-manager.nixosModules.home-manager;

  shared = [core bootloader];

  home-manager = {imports}: {
    home-manager = {
      backupFileExtension = "backup";
      useUserPackages = true;
      # useGlobalPkgs = true;
      extraSpecialArgs = {
        inherit inputs;
        inherit self;
      };
      users.darak = {
        imports = [../home] ++ imports;
        _module.args.theme = import ../theme;
      };
    };
  };
in {
  # Lenovo Legion T5 26IRB8
  okarin = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        {networking.hostName = "okarin";}
        ./okarin
        hmModule
        nvidia
        steam
        (
          home-manager {imports = [./okarin/home.nix];}
        )
      ]
      ++ shared;
    specialArgs = {inherit inputs;};
  };

  # System76 Lemur Pro
  mayushii = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        {networking.hostName = "mayushii";}
        ./mayushii
        hmModule
        (
          home-manager {imports = [./mayushii/home.nix];}
        )
      ]
      ++ shared;
    specialArgs = {inherit inputs;};
  };
}
