{
  description = "inlinefun's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      home-manager,
      nixpkgs,
      ...
    }@inputs:
    let
      arch = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${arch};
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = arch;
        # nixpkgs.hostPlatform = lib.mkDefault arch;
        specialArgs = { inherit inputs; };
        modules = [
          ./system
          home-manager.nixosModules.default
        ];
      };
      homeConfigurations.me = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home
        ];
      };
    };
}
