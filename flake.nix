{
  description = "inlinefun's NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    custom-packages = {
      url = "github:inlinefun/nix-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      defaults = {
        hostName = "nixos";
        system = "x86_64-linux";
        mainUser = "me";
      };
    in
    {
      nixosConfigurations.${defaults.hostName} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit defaults;
        };
        modules = [
          ./system
          home-manager.nixosModules.default
        ];
      };
      homeConfigurations.${defaults.mainUser} =
        let
          pkgs = nixpkgs.legacyPackages.${defaults.system};
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs;
            inherit defaults;
          };
          modules = [ ./home ];
        };
    };
}
