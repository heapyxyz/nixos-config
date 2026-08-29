{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mactahoe-src = {
      url = "github:vinceliuice/MacTahoe-icon-theme";
      flake = false;
    };

    openlogi = {
      url = "github:AprilNEA/OpenLogi";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      flake-dir = "/etc/nixos";
      username = "heapy";
      background = "tahoe-dark.jpeg"; # stored in ./modules/home/backgrounds/
    in
    {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              flake-dir
              username
              background
              ;

            hostname = "laptop";
          };

          modules = [
            ./hosts/laptop/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.openlogi.nixosModules.default
          ];
        };

        pc = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              flake-dir
              username
              background
              ;

            hostname = "pc";
          };

          modules = [
            ./hosts/pc/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.openlogi.nixosModules.default
          ];
        };

        # todo: install nixos on home server and copy hardware-configuration.nix
        # todo: finish ./modules/system/server/
        # todo: use different home-manager configuration (not ./modules/home/) or not use it at all (?)
        home-server = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              flake-dir
              username
              background
              ;

            hostname = "home-server";
          };

          modules = [
            ./hosts/home-server/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}
