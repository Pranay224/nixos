{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    burpsuite-patched = {
      url = "path:/home/pranay/nixos/packages/burpsuite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      disko,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      overlays = import ./overlays { inherit system inputs; };
    in
    {
      nixosConfigurations.cypher = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/cypher/configuration.nix
          home-manager.nixosModules.home-manager
          disko.nixosModules.disko

          {
            nixpkgs.overlays = overlays;

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.pranay = {
              imports = [
                nixvim.homeModules.nixvim
                ./modules/home
              ];
            };
          }
        ];
      };
    };
}
