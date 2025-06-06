{
  description = "NixOS config flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = {self, nixpkgs, home-manager, nixvim, ...}@inputs: {
    nixosConfigurations.cypher = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/cypher/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.pranay = {
            imports = [
              nixvim.homeManagerModules.nixvim
              ./modules/home
            ]; 
          };
        }
      ];
    };
  };
}
