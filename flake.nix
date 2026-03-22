{
  description = "inlinefun's flake based NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem-impure = {
      url = "github:Rexcrazy804/hjem-impure";
      inputs.nixpkgs.follows = "";
      inputs.hjem.follows = "";
    };
    basix = {
      url = "github:NotAShelf/Basix";
    };
  };
  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations.x515 = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          colors = inputs.basix.schemeData.base24."0x96f".palette;
        };
        modules = [
          inputs.hjem.nixosModules.default
          ./modules
          ./hosts/x515
          ./users/me
        ];
      };
    };
}
